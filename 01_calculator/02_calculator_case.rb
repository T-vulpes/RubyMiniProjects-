# calculator_case.rb

puts "Birinci sayıyı giriniz:"
sayi1 = gets.to_f

puts "İkinci sayıyı giriniz:"
sayi2 = gets.to_f

puts "Hangi işlemin yapılmasını istersiniz? (+, -, /, *, **, %):"
islem = gets.chomp.strip

case islem
when "+"
  puts "Sonuç: #{sayi1 + sayi2}"
when "-"
  puts "Sonuç: #{sayi1 - sayi2}"
when "/"
  if sayi2 == 0
    puts "Bir sayı sıfıra bölünemez!"
  else
    puts "Sonuç: #{sayi1 / sayi2}"
  end
when "*"
  puts "Sonuç: #{sayi1 * sayi2}"
when "**"
  puts "Sonuç: #{sayi1 ** sayi2}"
when "%"
  puts "Sonuç: #{sayi1 % sayi2}"
else
  puts "Yanlış işlem komutu girdiniz!"
end
