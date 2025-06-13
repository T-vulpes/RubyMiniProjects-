print "Please enter your year of birth: "

begin
  birth_date = Integer(gets)
  age = 2025 - birth_date
  puts "Your Age: #{age}"
rescue
  puts "You have entered incorrectly! Please enter only numbers.!"
end
