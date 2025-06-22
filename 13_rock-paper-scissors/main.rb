choices = ["rock", "paper", "scissors"]
user_score = 0
computer_score = 0

def valid_input?(input)
  ["rock", "paper", "scissors"].include?(input)
end

puts "Welcome to Rock, Paper, Scissors!"
loop do
  print "\nChoose one (rock, paper, scissors): "
  user_input = gets.chomp.downcase

  until valid_input?(user_input)
    print "Invalid input. Please type rock, paper, or scissors: "
    user_input = gets.chomp.downcase
  end

  computer_choice = choices.sample
  puts "Computer chose: #{computer_choice}"

  if user_input == computer_choice
    puts "It's a tie!"
  elsif (user_input == "rock" && computer_choice == "scissors") ||
        (user_input == "paper" && computer_choice == "rock") ||
        (user_input == "scissors" && computer_choice == "paper")
    puts "You win this round!"
    user_score += 1
  else
    puts "Computer wins this round!"
    computer_score += 1
  end

  puts "Score => You: #{user_score} | Computer: #{computer_score}"

  print "\nDo you want to play again? (yes/no): "
  answer = gets.chomp.downcase
  break unless answer == "yes"
end

puts "\nFinal Score => You: #{user_score} | Computer: #{computer_score}"

if user_score > computer_score
  puts "Congratulations! You won the game!"
elsif user_score < computer_score
  puts "Computer wins the game! Better luck next time."
else
  puts "The game ended in a draw!"
end

puts "Thanks for playing!"
