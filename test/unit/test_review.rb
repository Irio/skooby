require_relative '../helper'

class TestReview < MiniTest::Unit::TestCase
  def test_initialization_of_attributes
    subject = Skooby::Review.new(author: 'Irio')
    assert_equal 'Irio', subject.author, 'should allow initialization of author'
    subject = Skooby::Review.new(title: 'Lipsum')
    assert_equal 'Lipsum', subject.title, 'should allow initialization of title'
    subject = Skooby::Review.new(text: 'Lorem ipsum dolor sit amet.')
    assert_equal 'Lorem ipsum dolor sit amet.', subject.text, 'should allow initialization of text'
  end
end
