require_relative 'spec_helper'

describe Skoob::Request do
  it { Skoob::Request.base_uri.must_equal 'http://skoob.com.br' }

  describe "#post" do
    it "delegates to a class method" do
      Skoob::Request.expects(:post).with('/', bla: :foo).
        returns(stub('response', :body))
      Skoob::Request.new.post('/', bla: :foo)
    end
  end
end
