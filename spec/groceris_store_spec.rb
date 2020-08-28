require "spec_helper"
require "./katas/groceris_store"

RSpec.describe Groceries do
  let(:service) { described_class.new(groceries) }
  let(:groceries) { "fruit_banana,vegetable_carrot,fruit_apple,canned_sardines,drink_juice,fruit_orange" }
  describe "#call" do
    it "returns String" do
      expect(service.call).to be_kind_of(String)
    end

    context 'with fruit kind groceries' do
      let(:groceries) { "fruit_banana,fruit_apple,lol_something" }

      it "returns category with sorted groceries" do
        expect(service.call)
          .to eq(<<-TEXT.delete("\s").strip)
            fruit:apple,banana
            meat:
            other:something
            vegetable:
          TEXT
      end
    end
  end
end
