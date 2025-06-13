def calculate_age
  print "Enter your birth year: "

  begin
    year = Integer(gets)
    age = 2025 - year
    puts "You are #{age} years old."
  rescue
    puts "Invalid input. Please enter a valid number."
  end
end

calculate_age
