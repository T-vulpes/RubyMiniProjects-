loop do
  print "Doğum yılınızı girin: "
  begin
    year = Integer(gets)
    puts "Yaşınız: #{2025 - year}"
    break
  rescue
    puts "Geçersiz giriş, lütfen tekrar deneyin."
  end
end
