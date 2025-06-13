print "Vize notunuzu giriniz: "
vize = gets.to_f

print "Final notunuzu giriniz: "
final = gets.to_f 
ort = (vize * 0.4) + (final * 0.6)

puts "Ortalamanız: #{ort.round(2)}"

case ort
when 85..100
  puts "Tebrikler! Harf notunuz: AA"
when 70...85
  puts "Başarılısınız. Harf notunuz: BA"
when 65...70
  puts "İyi bir sonuç. Harf notunuz: BB"
when 55...65
  puts "Ortalamanın biraz üzerinde. Harf notunuz: CB"
when 45...55
  puts "Geçtiniz. Harf notunuz: CC"
when 30...45
  puts "Koşullu geçtiniz. Harf notunuz: DC"
when 0...30
  puts "Maalesef kaldınız. Harf notunuz: FF"
else
  puts "Geçersiz not girişi!"
end
