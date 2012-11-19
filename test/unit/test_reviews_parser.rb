require_relative '../helper'

class TestReviewsParser < MiniTest::Unit::TestCase
  def subject
    Skooby::ReviewsParser.new(108)
  end

  def test_url_method_should_return_a_valid_url
    URI.parse(subject.url)
  end

  def test_reviews_method_returns_a_collection_of_Skooby_Review_instances
    result = nil
    VCR.use_cassette('fetch_reviews') do
      result = subject.last_reviews
    end
    assert result.is_a?(Enumerable), 'should be a collection'
    result.each { |book| assert book.is_a?(Skooby::Review), 'should be a Skooby::Review' }
  end

  def test_reviews_method_extracts_a_author_for_each_review
    Skooby::ReviewsParser.any_instance.expects(:extract_author).at_least_once
    VCR.use_cassette('fetch_reviews') do
      subject.last_reviews
    end
  end

  def test_reviews_method_extracts_a_title_for_each_review
    Skooby::ReviewsParser.any_instance.expects(:extract_title).at_least_once
    VCR.use_cassette('fetch_reviews') do
      subject.last_reviews
    end
  end

  def test_reviews_method_extracts_a_text_for_each_review
    Skooby::ReviewsParser.any_instance.expects(:extract_text).at_least_once
    VCR.use_cassette('fetch_reviews') do
      subject.last_reviews
    end
  end
end
