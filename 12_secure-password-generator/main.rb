require 'securerandom'
lowercase = ('a'..'z').to_a
uppercase = ('A'..'Z').to_a
digits    = ('0'..'9').to_a
symbols   = ['!', '-', '_', '/', '=', '^', '+', '@', '%', '&', '(', ')', '{', '}', '[', ']']

all_chars = lowercase + uppercase + digits + symbols
puts "Enter password length (minimum 8):"
length = gets.chomp.to_i

if length < 8
  puts "Password must be at least 8 characters."
  exit
end

# Ensure at least one from each group
password = []
password << lowercase.sample
password << uppercase.sample
password << digits.sample
password << symbols.sample

# Fill the rest with random characters
remaining = length - password.length
remaining.times { password << all_chars.sample }

# Shuffle for randomness
password.shuffle!

# Output the password
puts "Generated Secure Password: #{password.join}"
