loop do
  print "Enter your year of birth: "
  begin
    year = Integer(gets)
    puts "Your age: #{2025 - year}"
    break
  rescue
    puts "Invalid login, please try again."
  end
end
