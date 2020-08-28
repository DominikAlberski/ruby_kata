require 'spec_helper'
require './katas/stop_spinning'

RSpec.describe 'spinWords' do
  context 'for less then 5 letters' do
    let(:sample) { 'stri' }
    let(:sample_with_space) { 'stri stri' }

    it 'returns same string' do
      expect(spinWords(sample)).to eq sample
    end

    it 'returns same string with spaces' do
      expect(spinWords(sample_with_space)).to eq sample_with_space
    end
  end

  context 'for 5 and more letter words it reverse that words' do
    let(:sample) { 'string' }
    let(:sample_2) { 'string string' }
    let(:sample_3) { 'string stri string' }

    it 'reverse string' do
      expect(spinWords(sample)).to eq('gnirts')
    end

    it 'reverses strings with spaces' do
      expect(spinWords(sample_2)).to eq('gnirts gnirts')
    end

    it 'reverse only words with 5 or more chard' do
      expect(spinWords(sample_3)).to eq('gnirts stri gnirts')
    end
  end
end
