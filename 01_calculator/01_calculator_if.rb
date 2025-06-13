# calculator_if.rb

puts "Birinci sayıyı giriniz:"
sayi1 = gets.to_f

puts "İkinci sayıyı giriniz:"
sayi2 = gets.to_f

puts "Hangi işlemin yapılmasını istersiniz? (+, -, /, *, **, %):"
islem = gets.chomp.strip

if islem == "+"
  puts "Sonuç: #{sayi1 + sayi2}"
elsif islem == "-"
  puts "Sonuç: #{sayi1 - sayi2}"
elsif islem == "/"
  if sayi2 == 0
    puts "Bir sayı sıfıra bölünemez!"
  else
    puts "Sonuç: #{sayi1 / sayi2}"
  end
elsif islem == "*"
  puts "Sonuç: #{sayi1 * sayi2}"
elsif islem == "**"
  puts "Sonuç: #{sayi1 ** sayi2}"
elsif islem == "%"
  puts "Sonuç: #{sayi1 % sayi2}"
else
  puts "Yanlış işlem komutu girdiniz!"
end
