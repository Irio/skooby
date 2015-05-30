require 'nokogiri'

module Skooby
  class Search
    def book(query)
      opts = { body: { data: { Busca: { tipo: "Livro", tag: query } } } }
      page = Request.new.post('/livro/lista/', opts)
      parse_result(page)
    end

    private
    def parse_result(page_body)
      doc = Nokogiri::HTML(page_body)
      if doc.css('#resultadoBusca').empty?
        puts "Book not Found ! "
      else
        doc.css('.box_lista_busca_vertical').map do |book_node|
          Book.new(id: book_node.css('img')[0][:src].split("/livros/")[1].split("/")[0],
                   title: book_node.css('a')[1].content ,
                   author:  book_node.css('a')[2].content )
        end
      end
    end
  end
end
