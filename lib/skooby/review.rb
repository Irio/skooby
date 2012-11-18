module Skooby
  class Review
    attr_accessor :author, :title, :text

    def initialize(params = {})
      @author = params[:author] if params.has_key?(:author)
      @title  = params[:title]  if params.has_key?(:title)
      @text   = params[:text]   if params.has_key?(:text)
    end
  end
end
