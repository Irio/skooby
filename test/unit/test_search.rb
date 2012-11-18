require_relative '../helper'

class TestSearch < MiniTest::Unit::TestCase
  def subject
    Skoob::Search.new
  end

  def test_returns_a_collection_of_Skoob_Book_instances
    result = subject.book('Harry Potter e a Pedra Filosofal')
    assert result.is_a?(Enumerable), 'should be a collection'
    result.each { |book| assert book.is_a?(Skoob::Book), 'should be a Skoob::Book' }
  end
end
