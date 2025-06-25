def countdown(seconds)
  while seconds > 0
    min = seconds / 60
    sec = seconds % 60
    system("clear") || system("cls")
    puts format("Time remaining: %02d:%02d", min, sec)
    sleep(1)
    seconds -= 1
  end
  puts "Time's up!"
end

puts "Select a countdown option:"
puts "1 - 60 seconds"
puts "2 - 5 minutes"
puts "3 - 10 seconds"
puts "4 - Custom input (seconds)"
puts "5 - Custom input (minutes)"
print "> "
opt = gets.to_i

case opt
when 1
  countdown(60)
when 2
  countdown(5 * 60)
when 3
  countdown(10)
when 4
  print "Enter the number of seconds: "
  seconds = gets.to_i
  countdown(seconds)
when 5
  print "Enter the number of minutes: "
  minutes = gets.to_i
  countdown(minutes * 60)
else
  puts "Invalid option."
end

