require_relative '../helper'

class TestRequest < MiniTest::Unit::TestCase
  def test_initialization_of_attributes
    subject = Skoob::Book.new(id: 108)
    assert_equal 108, subject.id, 'should allow initialization of id'
    subject = Skoob::Book.new(title: 'Harry Potter e a Pedra Filosofal')
    assert_equal 'Harry Potter e a Pedra Filosofal', subject.title,
      'should allow initialization of id'
  end

  def test_first_class_method_returns_you_a_instance_of_a_Skoob_Book
    Skoob::Search.any_instance.stubs(:book).returns(stub(first: Skoob::Book.new))
    assert Skoob::Book.first('Harry Potter e a Pedra Filosofal').
      instance_of?(Skoob::Book), 'should be instance of Skoob::Book'
  end
end
