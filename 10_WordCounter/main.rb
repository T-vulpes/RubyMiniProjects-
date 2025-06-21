begin
  require 'pdf-reader'
rescue LoadError
  puts "Please install the required gem by running:"
  puts "gem install pdf-reader"
  exit
end

puts "Choose the source to count words from:"
puts "1 - A selected file (PDF only)"
puts "2 - A sentence you enter manually"
print "Your choice: "
option = gets.to_i

case option
when 1
  print "Enter the PDF file name (e.g., sample.pdf): "
  filename = gets.chomp

  begin
    reader = PDF::Reader.new(filename)
    full_text = ""
    reader.pages.each { |page| full_text += page.text }
    words = full_text.split(/\s+/)
    puts "The number of words in the PDF: #{words.length}"
  rescue Errno::ENOENT
    puts "❌ File not found. Please check the file name and try again."
  rescue => e
    puts "❌ An error occurred: #{e.message}"
  end

when 2
  print "Enter your sentence: "
  sentence = gets.chomp
  words = sentence.split(/\s+/)
  puts "The number of words in your sentence: #{words.length}"

else
  puts "❌ Invalid option!"
end

puts "\nProgram finished. Press Enter to exit."
gets
