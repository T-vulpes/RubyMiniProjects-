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
  print "PDF dosyasının adını giriniz (örnek: dosya.pdf): "
  filename = gets.chomp

  begin
    reader = PDF::Reader.new(filename)
    full_text = ""
    reader.pages.each { |page| full_text += page.text }
    kelimeler = full_text.split(/\s+/)
    puts "PDF'deki kelime sayısı: #{kelimeler.length}"
  rescue Errno::ENOENT
    puts "❌ Dosya bulunamadı. Lütfen doğru dosya adını girin."
  rescue => e
    puts "❌ Bir hata oluştu: #{e.message}"
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
