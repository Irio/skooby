require_relative '../helper'

class TestSearch < MiniTest::Unit::TestCase
  def subject
    Skooby::Search.new
  end

  def test_book_method_returns_a_collection_of_Skooby_Book_instances_when_find_more_than_one_book
    result = nil
    VCR.use_cassette('search_movie_multiple_results') do
      result = subject.book('Harry Potter e a Pedra Filosofal')
    end
    assert result.is_a?(Enumerable), 'should be a collection'
    result.each { |book| assert book.is_a?(Skooby::Book), 'should be a Skooby::Book' }
  end

  def test_book_method_returned_collection_must_have_ids
    result = nil
    VCR.use_cassette('search_movie_multiple_results') do
      result = subject.book('Harry Potter e a Pedra Filosofal')
    end
    result.each { |book| refute_nil book.id }
  end

  def test_book_method_returned_collection_must_have_titles
    result = nil
    VCR.use_cassette('search_movie_multiple_results') do
      result = subject.book('Harry Potter e a Pedra Filosofal')
    end
    result.each { |book| refute_nil book.title }
  end

  def test_book_method_returned_collection_must_have_authors
    result = nil
    VCR.use_cassette('search_movie_multiple_results') do
      result = subject.book('Harry Potter e a Pedra Filosofal')
    end
    result.each { |book| refute_nil book.author }
  end

  def test_book_method_returns_a_Skooby_Book_when_find_just_one_book
    result = nil
    VCR.use_cassette('search_movie_one_result') do
      result = subject.book('Exceptional Ruby')
    end
    assert result.is_a?(Skooby::Book), 'should be a Skooby::Book'
  end
end
