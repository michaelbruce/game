def multiples_of_three_and_five
  multiples_list = []
  (1..1000).each {|number|
    multiples_list << number if number % 3 == 0 || number % 5 == 0
  }
  multiples_list.inject{|sum, number| sum += number}
end

def even_fibonacci_numbers
  fibonacci_sequence = [1]
  while fibonacci_sequence[-1] < 4000000
    fibonacci_sequence << fibonacci_sequence[-1] + (fibonacci_sequence[-2] || fibonacci_sequence[-1])
  end
  fibonacci_sequence.keep_if{|num| num % 2 == 0}
  fibonacci_sequence.inject{|sum,number| sum += number}
end

def largest_prime_factor
  original_number = 600851475143
  largest_factor = 1
  #cut down the sequence before iterating?
  #product results get stored in an array, iterated over to clean large chunks of potential prime factors
  prime_numbers
  (1..(original_number/2)).each {|number|
    puts "#{largest_factor} #{number}"
    largest_factor = number if original_number % number == 0
  }
  largest_factor
end


puts "Problem 1: #{multiples_of_three_and_five}"
puts "Problem 2: #{even_fibonacci_numbers}"
puts "Problem 3: #{largest_prime_factor}"
