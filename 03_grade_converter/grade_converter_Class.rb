class StudentGrade
  attr_reader :vize, :final, :average

  def initialize(vize, final)
    @vize = vize.to_f
    @final = final.to_f
    @average = calculate_average
  end

  def calculate_average
    (@vize * 0.4) + (@final * 0.6)
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
    puts "Vize: #{@vize}"
    puts "Final: #{@final}"
    puts "Average: #{@average.round(2)}"
    puts "Letter Grade: #{letter_grade}"
  end
end

print "Enter your midterm score: "
vize = gets.chomp
print "Enter your final exam score: "
final = gets.chomp

# Nesne oluştur ve sonucu yazdır
student = StudentGrade.new(vize, final)
puts "\n--- Grade Report ---"
student.print_summary
