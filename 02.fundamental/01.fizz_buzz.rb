def fizz_buzz(num)
  if num % 15 == 0
    "fizz_buzz"
  elsif num % 5 == 0
    "fizz"
  elsif num % 3 == 0
    "buzz"
  end
end

num = gets.to_i
puts fizz_buzz(num)