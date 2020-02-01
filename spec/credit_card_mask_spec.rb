require 'spec_helper'
require './credit_card_mask'

RSpec.describe "maskify" do
 it 'do not change string shorter then 5 characters' do
   expect(maskify("abcd")).to eq "abcd"
 end

 it 'changes string longer then 5 character' do
   expect(maskify 'abcde').to eq "#bcde"
   expect(maskify '4556364607935616').to eq '############5616'
 end
end
