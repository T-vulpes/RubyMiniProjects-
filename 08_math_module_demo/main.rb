require_relative 'math_utils'

def menu
  loop do
    puts "\nMath Operations Menu:"
    puts "1. Factorial"
    puts "2. Prime Check"
    puts "3. Power"
    puts "4. Basic Arithmetic (+ - * / %)"
    puts "5. Digit Sum"
    puts "6. Palindrome Check"
    puts "0. Exit"
    print "Choose an option: "
    choice = gets.to_i

    case choice
    when 1
      print "Enter a number: "
      n = gets.to_i
      puts "Factorial of #{n} is #{MathUtils.factorial(n)}"

    when 2
      print "Enter a number: "
      n = gets.to_i
      puts MathUtils.is_prime?(n) ? "#{n} is a prime number." : "#{n} is not a prime."

    when 3
      print "Enter base: "
      base = gets.to_f
      print "Enter exponent: "
      exp = gets.to_f
      puts "#{base} ^ #{exp} = #{MathUtils.power(base, exp)}"

    when 4
      print "Enter first number: "
      a = gets.to_f
      print "Enter second number: "
      b = gets.to_f
      puts "Sum: #{MathUtils.sum(a, b)}"
      puts "Subtraction: #{MathUtils.subtract(a, b)}"
      puts "Multiplication: #{MathUtils.multiply(a, b)}"
      puts "Division: #{MathUtils.divide(a, b)}"
      puts "Modulo: #{MathUtils.modulo(a, b)}"

    when 5
      print "Enter a number: "
      n = gets.to_i
      puts "Digit sum of #{n} is #{MathUtils.digit_sum(n)}"

    when 6
      print "Enter a number: "
      n = gets.chomp
      puts MathUtils.palindrome?(n) ? "#{n} is a palindrome." : "#{n} is not a palindrome."

    when 0
      puts "Exiting program..."
      break
    else
      puts "⚠ Invalid selection. Please choose from the menu."
    end
  end
end

menu
