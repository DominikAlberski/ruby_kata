require "spec_helper"
require "./katas/prime_number"

RSpec.describe "isPrime" do
  it "returns false for numbers below 1" do
    expect(isPrime(1)).to be false
  end

  it "returns true for prime number" do
    expect(isPrime(2)).to be true
    expect(isPrime(3)).to be true
    expect(isPrime(5)).to be true
    expect(isPrime(7)).to be true
    expect(isPrime(11)).to be true
  end

  it 'returns false for not prime numbers' do
    expect(isPrime(4)).to be false
    expect(isPrime(100)).to be false
    expect(isPrime(999)).to be false
    expect(isPrime(958297)).to be false
    expect(isPrime(-7)).to be false
  end
  it "new spec" do
    expect(isPrime(765190505)).to be false
  end
end
