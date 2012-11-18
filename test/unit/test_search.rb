require_relative '../helper'

class TestSearch < MiniTest::Unit::TestCase
  def subject
    Skooby::Search.new
  end

  def test_returns_a_collection_of_Skooby_Book_instances
    result = subject.book('Harry Potter e a Pedra Filosofal')
    assert result.is_a?(Enumerable), 'should be a collection'
    result.each { |book| assert book.is_a?(Skooby::Book), 'should be a Skooby::Book' }
  end
end
