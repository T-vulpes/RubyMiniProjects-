print "Enter your midterm score: "
midterm = gets.to_f

print "Enter your final exam score: "
final = gets.to_f 
ort = (midterm * 0.4) + (final * 0.6)

puts "Average: #{ort.round(2)}"

case ort
when 85..100
puts "Congratulations! Your letter grade: AA"
when 70...85
puts "You are successful. Your letter grade: BA"
when 65...70
puts "A good result. Your letter grade: BB"
when 55...65
puts "Slightly above average. Your letter grade: CB"
when 45...55
puts "You passed. Your letter grade: CC"
when 30...45
puts "You passed conditionally. Your letter grade: DC"
when 0...30
puts "Unfortunately, you failed. Your letter grade: FF"
else
puts "Invalid grade entry!"
end
