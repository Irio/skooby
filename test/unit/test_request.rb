require_relative '../helper'

class TestRequest < MiniTest::Unit::TestCase
  def test_defines_skoobs_base_uri
    assert_equal 'http://skoob.com.br', Skooby::Request.base_uri
  end

  def test_post_method_delegates_itself_to_a_class_method
    Skooby::Request.expects(:post).with('/', bla: :foo).
      returns(stub('response', :body))
    Skooby::Request.new.post('/', bla: :foo)
  end

  def test_get_method_delegates_itself_to_a_class_method
    Skooby::Request.expects(:get).with('/', bla: :foo).
      returns(stub('response', :body))
    Skooby::Request.new.get('/', bla: :foo)
  end
end
