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

  describe '#garbled' do

    it 'returns a a string just as long' do
      expect(subject.garbled('hello').length).to eq(5)
      expect(subject.garbled('helloworld').length).to eq(10)
    end

    it 'matches just garbled characters' do
      expect(subject.garbled('helloworldhowareyou')).to match(/[$@!#%]+/)
    end

  end

  describe '#hollow' do

    it 'stars out inner word' do
      expect(subject.hollow('foobar')).to eq('f****r')
    end

    it 'leaves two letter words alone' do
      expect(subject.hollow('hi')).to eq('hi')
    end

  end

  describe '#L337' do

    it 'gives back 1337 speak' do
      expect(subject.L337('foobar')).to eq('Ph00B4R')
    end

  end

  describe '#piglatin' do

    it 'converts to pig latin examples taken from wikipedia' do
      expect(subject.piglatin('happy')).to eq('appyhay')
      expect(subject.piglatin('duck')).to eq('uckday')
      expect(subject.piglatin('glove')).to eq('oveglay')
      expect(subject.piglatin('egg')).to eq('eggway')
      expect(subject.piglatin('inbox')).to eq('inboxway')
      expect(subject.piglatin('eight')).to eq('eightway')
    end

  end

end
