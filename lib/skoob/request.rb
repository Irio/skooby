module Skoob
  class Request
    include HTTParty
    base_uri 'skoob.com.br'

    def post(path, options = {})
      self.class.post(path, options)
    end
  end
end
