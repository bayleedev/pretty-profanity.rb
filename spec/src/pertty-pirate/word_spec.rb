require 'spec_helper'

describe PrettyPirate::Word do

  before do
    PrettyPirate::Pirate.whitelist = ['hello world', 'goodbye hello']
  end

  subject { PrettyPirate::Word.new('hello') }

  describe '#to_regex' do

    it 'matches the base hello' do
      expect(subject.to_regex).to match('this is hello meow')
    end

    it 'matches the base HELLO in caps' do
      expect(subject.to_regex).to match('this is HELLO meow')
    end

    it 'does not match beginning whitelist phrase' do
      expect(subject.to_regex).to_not match('this is hello world meow')
    end

    it 'does not match ending whitelist phrase' do
      expect(subject.to_regex).to_not match('this is goodbye hello meow')
    end

  end

end
