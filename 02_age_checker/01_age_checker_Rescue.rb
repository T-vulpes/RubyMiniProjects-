print "Lütfen doğum yılınızı giriniz: "

begin
  dogum_yili = Integer(gets)
  yas = 2025 - dogum_yili
  puts "Yaşınız: #{yas}"
rescue
  puts "Hatalı giriş yaptınız! Lütfen sadece sayı girin."
end
