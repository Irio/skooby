require_relative 'spec_helper'

describe Skoob::Book do
  it "initializes attributes" do
    subject = Skoob::Book.new(id: 108)
    assert_equal 108, subject.id, 'should allow initialization of id'
    subject = Skoob::Book.new(title: 'Harry Potter e a Pedra Filosofal')
    assert_equal 'Harry Potter e a Pedra Filosofal', subject.title,
      'should allow initialization of id'
  end

  describe '.first' do
    it 'returns you a instance of a Skoob::Book' do
      Skoob::Search.any_instance.stubs(:book).returns(stub(first: Skoob::Book.new))
      assert Skoob::Book.first('Harry Potter e a Pedra Filosofal').
        instance_of?(Skoob::Book), 'should be instance of Skoob::Book'
    end
  end
end

