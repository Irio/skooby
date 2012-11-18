require_relative '../helper'

class TestRequest < MiniTest::Unit::TestCase
  def test_defines_skoobs_base_uri
    assert_equal 'http://skoob.com.br', Skoob::Request.base_uri
  end

  def test_post_method_delegates_itself_to_a_class_method
    Skoob::Request.expects(:post).with('/', bla: :foo).
      returns(stub('response', :body))
    Skoob::Request.new.post('/', bla: :foo)
  end
end
