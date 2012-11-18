require_relative '../helper'

class TestRequest < MiniTest::Unit::TestCase
  def test_initialization_of_attributes
    subject = Skooby::Book.new(id: 108)
    assert_equal 108, subject.id, 'should allow initialization of id'
    subject = Skooby::Book.new(title: 'Harry Potter e a Pedra Filosofal')
    assert_equal 'Harry Potter e a Pedra Filosofal', subject.title,
      'should allow initialization of id'
  end
end
