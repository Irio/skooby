require 'nokogiri'

module Skooby
  class Search
    def book(query)
      opts = { body: { data: { Busca: { tipo: "livro", tag: query } } } }
      page = Request.new.post('/livro/lista/', opts)
      parse_result(page)
    end

    private
    def parse_result(page_body)
      doc = Nokogiri::HTML(page_body)
      if doc.css('#livro').empty?
        doc.css('.box_lista_busca').map do |book_node|
          title_node = book_node.css('.l15ab')[0]
          Book.new(id: /\A\/livro\/(\d+).*\Z/.match(title_node[:href])[1],
                   title: title_node.content,
                   author: book_node.css('.l11')[0].content)
        end
      else
        Book.new(id: /\A\/livro\/(\d+).*\Z/.match(doc.css('#menubusca li:first a')[0][:href])[1],
                 title: doc.css('#barra_titulo h1')[0].content)
      end
    end
  end
end
