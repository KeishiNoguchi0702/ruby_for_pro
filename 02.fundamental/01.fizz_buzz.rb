def fizz_buzz(num)
  if num % 15 == 0
    "fizz_buzz"
  elsif num % 5 == 0
    "fizz"
  elsif num % 3 == 0
    "buzz"
  else
    "hogehoge"
  end
end

(1..15).each do |num|
  puts fizz_buzz(num)
end