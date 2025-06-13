# calculator_functions.rb

def add(a, b)
  a + b
end

def subtract(a, b)
  a - b
end

def multiply(a, b)
  a * b
end

def divide(a, b)
  return "Cannot divide by zero!" if b == 0
  a / b
end

def power(a, b)
  a ** b
end

def modulo(a, b)
  a % b
end

puts "Enter the first number:"
num1 = gets.to_f

puts "Enter the second number:"
num2 = gets.to_f

puts "Which operation would you like to perform? (+, -, /, *, **, %):"
operation = gets.chomp.strip

case operation
when "+"
  puts "Result: #{add(num1, num2)}"
when "-"
  puts "Result: #{subtract(num1, num2)}"
when "*"
  puts "Result: #{multiply(num1, num2)}"
when "/"
  puts "Result: #{divide(num1, num2)}"
when "**"
  puts "Result: #{power(num1, num2)}"
when "%"
  puts "Result: #{modulo(num1, num2)}"
else
  puts "Invalid operation!"
end
