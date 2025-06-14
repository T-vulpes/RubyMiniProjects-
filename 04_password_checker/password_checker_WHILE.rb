correct_password = "12345"
attempt = 0
max_attempts = 3

while attempt < max_attempts
  print "Enter your password: "
  user_input = gets.chomp

  if user_input == correct_password
    puts "Login successful, password correct!"
    break
  else
    attempt += 1
    if attempt < max_attempts
      puts "Password is incorrect, try again (Your remaining: #{max_attempts - attempt})"
    else
      puts "Login failed! You have used up your maximum attempts."
    end
  end
end
