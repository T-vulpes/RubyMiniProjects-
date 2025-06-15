r = Random.new
secret_number = r.rand(0..50)
puts "🎯 Welcome to the Number Guessing Game!"
puts "You have 3 chances to guess the correct number (between 0 and 50)."

attempt = 0
max_attempts = 3

while attempt < max_attempts
  start_time = Time.now
  print "\nEnter your guess: "
  guess = gets.to_i

  if guess == secret_number
    puts "Congratulations! You guessed the number on attempt ##{attempt + 1}!"
    end_time = Time.now
puts "You finished in #{(end_time - start_time).round(2)} seconds."

    break
  elsif guess < secret_number
    puts "Try a higher number."
  elsif guess > secret_number
    puts "Try a lower number."
  else
    puts "Invalid input! Please enter a valid number."
  end

  attempt += 1

  if attempt == max_attempts
    puts "\nYou've used all your attempts. The correct number was: #{secret_number}"
        end_time = Time.now
puts "You finished in #{(end_time - start_time).round(2)} seconds."
  end
end
