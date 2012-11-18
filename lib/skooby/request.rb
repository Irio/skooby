module Skooby
  class Request
    include HTTParty
    base_uri 'skoob.com.br'

    def post(path, options = {})
      self.class.post(path, options).body
    end

    def get(path, options = {})
      self.class.get(path, options).body
    end
  end
end
