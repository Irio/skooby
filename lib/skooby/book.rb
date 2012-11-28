require 'nokogiri'

module Skooby
  class Book
    attr_reader :id, :title, :author, :rating, :votes

    def initialize(params = {})
      @id       = params[:id]
      @title    = params[:title]
      @author   = params[:author]
      @rating   = params[:rating]
      @votes    = params[:votes]
    end

    def url
      Skooby::Request.base_uri + path
    end

    def author
      @author || fetch.author
    end

    def rating
      @rating || fetch.rating
    end

    def votes
      @votes || fetch.votes
    end

    def fetch
      doc = Nokogiri::HTML.parse(Request.new.get(path))
      @title  = doc.css('#barra_titulo h1')[0].content
      @author = doc.css('.l11')[0].content
      @rating = (doc.css('#bt_ranking')[0].content.to_f / 5).round(2)
      @votes  = /(\d+)/.match(doc.css('#bt_estrelas')[0].content)[1]
      self
    end

    def reviews(opts = {})
      page = opts[:page] || 1
      { page: page, results: ReviewsParser.new(@id).last_reviews(page) }
    end

    private
    def path
      raise ArgumentError, 'Skooby::Book must have an id' if @id.nil?

      "/livro/#@id"
    end
  end
end
