class StudentGrade
  attr_reader :midterm, :final, :average

  def initialize(vize, final)
    @midterm = midterm.to_f
    @final = final.to_f
    @average = calculate_average
  end

  def calculate_average
    (@midterm * 0.4) + (@final * 0.6)
  end

  def letter_grade
    case @average
    when 85..100
      "AA - Excellent work!"
    when 70...85
      "BA - Great job!"
    when 65...70
      "BB - Good effort!"
    when 55...65
      "CB - Above average."
    when 45...55
      "CC - Just passed."
    when 30...45
      "DC - Conditional pass."
    when 0...30
      "FF - Failed."
    else
      "Invalid score!"
    end
  end

  def print_summary
    puts "midterm: #{@midterm}"
    puts "Final: #{@final}"
    puts "Average: #{@average.round(2)}"
    puts "Letter Grade: #{letter_grade}"
  end
end

print "Enter your midterm score: "
vize = gets.chomp
print "Enter your final exam score: "
final = gets.chomp

student = StudentGrade.new(midterm, final)
puts "\n--- Grade Report ---"
student.print_summary
