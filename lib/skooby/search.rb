require 'nokogiri'

module Skooby
  class Search
    attr_reader :parser

    def initialize(parser = Nokogiri::HTML)
      @parser = parser
    end

    def book(query)
      opts = { body: { data: { Busca: { tipo: "livro", tag: query } } } }
      page = Request.new.post('/livro/lista/', opts)
      parse_result(page)
    end

    private
    def parse_result(page_body)
      doc = Nokogiri::HTML(page_body)
      doc.css('.l15ab').map do |book_node|
        Book.new(id: /\A\/livro\/(\d+).*\Z/.match(book_node[:href])[1],
                 title: book_node.content)
      end
    end
  end
end
