require 'spec_helper'

describe PrettyProfanity::Sanitize do

  describe '#none' do
    it 'returns an empty string' do
      expect(subject.none('hello')).to eq('')
    end
  end

  describe '#vowels' do
    it 'replaces vowels with stars' do
      expect(subject.vowels('hello')).to eq('h*ll*')
    end
  end

  describe '#star' do
    it 'replaces characters with stars' do
      expect(subject.star('hello')).to eq('*****')
    end
  end

end
