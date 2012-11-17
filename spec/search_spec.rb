require_relative 'spec_helper'

describe Skoob::Search do
  let(:subject) { Skoob::Search.new }

  describe '#book' do
    it 'returns a collection of Skoob::Book' do
      assert subject.book('Harry Potter e a Pedra Filosofal').is_a?(Enumerable), 'should be a collection'
    end
  end
end


