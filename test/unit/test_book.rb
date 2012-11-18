require_relative '../helper'

class TestRequest < MiniTest::Unit::TestCase
  def test_initialization_of_attributes
    subject = Skooby::Book.new(id: 108)
    assert_equal 108, subject.id, 'should allow initialization of id'
    subject = Skooby::Book.new(title: 'Harry Potter e a Pedra Filosofal')
    assert_equal 'Harry Potter e a Pedra Filosofal', subject.title,
      'should allow initialization of id'
  end

  def test_first_class_method_returns_you_a_instance_of_a_Skooby_Book
    Skooby::Search.any_instance.stubs(:book).returns(stub(first: Skooby::Book.new))
    assert Skooby::Book.first('Harry Potter e a Pedra Filosofal').
      instance_of?(Skooby::Book), 'should be instance of Skooby::Book'
  end
end
