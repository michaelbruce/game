def multiples_of_three_and_five
  multiples_list = []
  (1..1000).each {|number|
    multiples_list << number if number % 3 == 0 || number % 5 == 0
  }
  multiples_list.inject{|sum, number| sum += number}
end



puts "Problem 1: #{multiples_of_three_and_five}"
