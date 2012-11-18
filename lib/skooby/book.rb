module Skooby
  class Book
    attr_reader :id, :title

    def initialize(params = {})
      @id    = params[:id]    if params.has_key?(:id)
      @title = params[:title] if params.has_key?(:title)
    end
  end
end
