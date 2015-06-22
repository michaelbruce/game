def one
  (1..10).each {|num| puts num if num % 5 == 0 || num % 3 == 0 }
end

one
