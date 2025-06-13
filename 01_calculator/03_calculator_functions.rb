# calculator_functions.rb

def toplam(a, b)
  a + b
end

def cikarma(a, b)
  a - b
end

def carpma(a, b)
  a * b
end

def bolme(a, b)
  return "Bir sayı sıfıra bölünemez!" if b == 0
  a / b
end

def us_alma(a, b)
  a ** b
end

def mod_alma(a, b)
  a % b
end

puts "Birinci sayıyı giriniz:"
sayi1 = gets.to_f

puts "İkinci sayıyı giriniz:"
sayi2 = gets.to_f

puts "Hangi işlemin yapılmasını istersiniz? (+, -, /, *, **, %):"
islem = gets.chomp.strip

case islem
when "+"
  puts "Sonuç: #{toplam(sayi1, sayi2)}"
when "-"
  puts "Sonuç: #{cikarma(sayi1, sayi2)}"
when "*"
  puts "Sonuç: #{carpma(sayi1, sayi2)}"
when "/"
  puts "Sonuç: #{bolme(sayi1, sayi2)}"
when "**"
  puts "Sonuç: #{us_alma(sayi1, sayi2)}"
when "%"
  puts "Sonuç: #{mod_alma(sayi1, sayi2)}"
else
  puts "Yanlış işlem komutu girdiniz!"
end
