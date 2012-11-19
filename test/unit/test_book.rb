require_relative '../helper'

class TestBook < MiniTest::Unit::TestCase
  def test_initialization_of_attributes
    subject = Skooby::Book.new(id: 108)
    assert_equal 108, subject.id, 'should allow initialization of id'
    subject = Skooby::Book.new(title: 'Harry Potter e a Pedra Filosofal')
    assert_equal 'Harry Potter e a Pedra Filosofal', subject.title,
      'should allow initialization of id'
    subject = Skooby::Book.new(author: 'J. K. Rowling')
    assert_equal 'J. K. Rowling', subject.author,
      'should allow initialization of author'
    subject = Skooby::Book.new(rating: 0.88)
    assert_equal 0.88, subject.rating, 'should allow initialization of rating'
    subject = Skooby::Book.new(votes: 123)
    assert_equal 123, subject.votes, 'should allow initialization of votes'
    subject = Skooby::Book.new(reviews: [1])
    assert_equal [1], subject.reviews, 'should allow initialization of reviews'
  end

  def test_initialization_should_not_trigger_fetch_method
    Skooby::Book.any_instance.expects(:fetch).never
    Skooby::Book.new(id: 108)
  end

  def test_url_method_should_return_a_valid_url
    URI.parse(Skooby::Book.new(id: 108).url)
  end

  def test_url_method_raises_exception_when_called_without_an_id
    assert_raises(ArgumentError) do
      Skooby::Book.new(id: nil).url
    end
  end

  def test_asking_for_the_author_should_trigger_fetch_method
    Skooby::Book.any_instance.expects(:fetch).returns(stub(author: 'J. K. Rowling'))
    Skooby::Book.new(id: 108).author
  end

  def test_asking_for_the_rating_should_trigger_fetch_method
    Skooby::Book.any_instance.expects(:fetch).returns(stub(rating: 1))
    Skooby::Book.new(id: 108).rating
  end

  def test_asking_for_the_votes_should_trigger_fetch_method
    Skooby::Book.any_instance.expects(:fetch).returns(stub(votes: 1))
    Skooby::Book.new(id: 108).votes
  end

  def test_fetch_method_shouldnt_be_triggered_when_asking_for_a_already_assigned_author
    Skooby::Book.any_instance.expects(:fetch).never
    Skooby::Book.new(id: 108, author: 'J. K. Rowling')
  end

  def test_fetch_method_shouldnt_be_triggered_when_asking_for_a_already_assigned_rating
    Skooby::Book.any_instance.expects(:fetch).never
    Skooby::Book.new(id: 108, rating: 0.88)
  end

  def test_fetch_method_shouldnt_be_triggered_when_asking_for_a_already_assigned_votes
    Skooby::Book.any_instance.expects(:fetch).never
    Skooby::Book.new(id: 108, votes: 0.88)
  end

  def test_fetch_method_populates_author_attribute
    subject = Skooby::Book.new(id: 108)
    VCR.use_cassette('fetch_movie') do
      subject.fetch
    end
    refute_nil subject.author
  end

  def test_fetch_method_populates_rating_attribute
    subject = Skooby::Book.new(id: 108)
    VCR.use_cassette('fetch_movie') do
      subject.fetch
    end
    refute_nil subject.rating
  end

  def test_fetch_method_populates_votes_attribute
    subject = Skooby::Book.new(id: 108)
    VCR.use_cassette('fetch_movie') do
      subject.fetch
    end
    refute_nil subject.votes
  end

  def test_fetch_method_returns_a_reloaded_instance_of_self
    subject = Skooby::Book.new(id: 108)
    VCR.use_cassette('fetch_movie') do
      assert subject.fetch.is_a?(Skooby::Book), 'should be a instance of Skooby::Book'
    end
  end

  def test_fetch_method_gets_the_page_of_the_book
    subject = Skooby::Book.new(id: 108)
    Nokogiri::HTML.stubs(:parse).returns(stub(css: [stub_everything]))
    Regexp.any_instance.stubs(:match).returns([])
    Skooby::Request.any_instance.expects(:get).with('/livro/108')
    subject.fetch
  end

  def test_reviews_method_shouldnt_request_again_for_reviews_already_assigned
    reviews = stub('collection of reviews')
    subject = Skooby::Book.new(id: 108, reviews: reviews)
    Skooby::ReviewsParser.any_instance.expects(:last_reviews).never
    subject.reviews
  end

  def test_reviews_method_fetches_reviews
    expected_reviews = stub('collection of reviews')
    Skooby::ReviewsParser.stubs(:new).with(108).returns(stub(last_reviews: expected_reviews))
    subject = Skooby::Book.new(id: 108)
    assert_equal expected_reviews, subject.reviews
  end
end
