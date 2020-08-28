# Define a function that takes an integer argument and returns logical value
# true or false depending on if the integer is a prime.

# Per Wikipedia, a prime number (or a prime) is a natural number greater than 1
# that has no positive divisors other than 1 and itself.

def isPrime(num)
  return false if num <= 1
  return true if [2, 3, 5].include?(num)
  return false if num.even?
  return false if num.to_s.split.map(&:to_i).sum % 3 == 0
  return false if num.to_s.split("")[-1] == "5"

  Math.sqrt(num).floor.downto(7).each do |n|
    return false if (num % n).zero?
  end

  true
end

# simple solution with use of prime lib:
# require 'prime'

# def isPrime(num)
#   num.prime?
# end
