MAX_ATTEMPTS = 3
CORRECT_PASSWORD = "12345"

def prompt_password
  print "Enter your password: "
  gets.chomp
end

def password_correct?(input, correct)
  input == correct
end

def print_error_message(remaining_attempts)
  if remaining_attempts > 0
    puts "Incorrect password. Try again. (Attempts left: #{remaining_attempts})"
  else
    puts "Access denied. You have used all your attempts."
  end
end

def login_process
  attempts = 0

  while attempts < MAX_ATTEMPTS
    input = prompt_password

    if password_correct?(input, CORRECT_PASSWORD)
      puts "Access granted!"
      return true
    else
      attempts += 1
      print_error_message(MAX_ATTEMPTS - attempts)
    end
  end
  false
end

login_process
