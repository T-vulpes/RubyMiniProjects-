# calculator_case.rb

puts "Enter the first number:"
number1 = gets.to_f

puts "Enter the second number:"
number2 = gets.to_f

puts "What operation would you like to perform? (+, -, /, *, **, %):"
oprt = gets.chomp.strip

case oprt
when "+"
  puts "Result: #{number1 + number2}"
when "-"
  puts "Result: #{number1 - number2}"
when "/"
  if number2 == 0
    puts "A number cannot be divided by zero!"
  else
    puts "Result: #{number1 / number2}"
  end
when "*"
  puts "Result: #{number1 * number2}"
when "**"
  puts "Result: #{number1 ** number2}"
when "%"
  puts "Result: #{number1 % number2}"
else
  puts "You entered the wrong action command!"
end
