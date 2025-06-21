puts "Enter a word:"
word = gets.chomp.strip.downcase  # Remove extra spaces and normalize

reversed_word = word.reverse

if word.empty?
  puts "You did not enter a valid word."
elsif word == reversed_word
  puts "The word '#{word}' is a palindrome."
else
  puts "The word '#{word}' is not a palindrome. Its reverse is '#{reversed_word}'."
end

puts "\nPress ENTER to exit..."
gets
