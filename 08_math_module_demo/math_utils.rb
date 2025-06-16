module MathUtils
  def self.factorial(n)
    (1..n).inject(1, :*)
  end

  def self.is_prime?(n)
    return false if n <= 1
    (2..Math.sqrt(n)).none? { |i| n % i == 0 }
  end

  def self.power(base, exponent)
    base**exponent
  end

  def self.sum(a, b)
    a + b
  end

  def self.subtract(a, b)
    a - b
  end

  def self.multiply(a, b)
    a * b
  end

  def self.divide(a, b)
    return "Cannot divide by zero!" if b == 0
    a / b.to_f
  end

  def self.modulo(a, b)
    a % b
  end

  # Calculates the sum of the digits of a number
  def self.digit_sum(n)
    n.abs.digits.sum
  end

  # Checks if a number is a palindrome (reads the same forwards and backwards)
  def self.palindrome?(n)
    str = n.to_s
    str == str.reverse
  end

end
