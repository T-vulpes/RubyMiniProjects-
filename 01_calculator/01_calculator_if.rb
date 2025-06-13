# calculator_if.rb

puts "Enter the first number:"
number1 = gets.to_f

puts "Enter the second number:"
number2 = gets.to_f

puts "What operation would you like to perform? (+, -, /, *, **, %):"
oprt = gets.chomp.strip

if oprt == "+"
  puts "result: #{number1 + number2}"
elsif oprt == "-"
  puts "result: #{number1 - number2}"
elsif oprt == "/"
  if number2 == 0
    puts "A number cannot be divided by zero!"
  else
    puts "result: #{number1 / number2}"
  end
elsif oprt == "*"
  puts "result: #{number1 * number2}"
elsif oprt == "**"
  puts "result: #{number1 ** number2}"
elsif oprt == "%"
  puts "result: #{number1 % number2}"
else
  puts "You entered the wrong action command!"
end
