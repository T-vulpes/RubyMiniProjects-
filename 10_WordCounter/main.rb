begin
  require 'pdf-reader'
rescue LoadError
  puts "Please install the pdf-reader library first with the following command:"
  puts "gem install pdf-reader"
  exit
end

puts "Specify the source to be used for word count:"
puts "1 - Selected file (only PDF supported)"
puts "2 - Sentence to be entered manually"
print "Your choice: "
options = gets.to_i

case options
when 1
  print "Enter the name of the PDF file (example: file.pdf): "
  filename = gets.chomp

  begin
    reader = PDF::Reader.new(filename)
    full_text = ""
    reader.pages.each { |page| full_text += page.text }
    kelimeler = full_text.split(/\s+/)
    puts "Number of words in PDF: #{words.length}"
  rescue Errno::ENOENT
    puts "❌ File not found. Please enter the correct file name."
  rescue => e
    puts "❌ An error occurred: #{e.message}"
  end

when 2
  print "Cümle giriniz: "
  cumle = gets.chomp
  kelimeler = cumle.split(/\s+/)
  puts "Kelime sayınız: #{kelimeler.length}"

else
  puts "❌ Geçersiz seçenek!"
end

puts "\nProgram sonlandı. Çıkmak için Enter'a bas."
gets
