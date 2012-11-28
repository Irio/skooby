module Skooby
  class ReviewsParser
    def initialize(book_id)
      @book_id = book_id
    end

    def url
      Request.base_uri + path
    end

    def last_reviews(page = 1)
      page_body = Request.new.get(path(page))
      doc = Nokogiri::HTML.parse(page_body)
      doc.css('#corpo > div > [id^="resenha"]').map do |review_node|
        Review.new(author: extract_author(review_node),
                   title: extract_title(review_node),
                   text: extract_text(review_node))
      end
    end

    private

    def path(page = 1)
      raise ArgumentError, 'Skooby::ReviewsParser must have a book_id' if @book_id.nil?
      "/livro/resenhas/#@book_id/recentes/page:#{page}"
    end

    def extract_author(review_node)
      review_node.css(".corner strong")[0].content
    end

    def extract_title(review_node)
      review_node.css(".corner > div strong")[1].content
    end

    def extract_text(review_node)
      review_node.css(".corner > div")[0].search('text()')[3..-1].text
    end
  end
end
