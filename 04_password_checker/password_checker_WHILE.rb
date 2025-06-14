correct_password = "12345"
attempt = 0
max_attempts = 3

while attempt < max_attempts
  print "Enter your password: "
  user_input = gets.chomp

  if user_input == correct_password
    puts "Login successful, password correct!"
    break
  else
    attempt += 1
    if attempt < max_attempts
      puts "Şifre yanlış, tekrar deneyiniz (Kalan hakkınız: #{max_attempts - attempt})"
    else
      puts "Giriş başarısız! Maksimum deneme hakkınızı kullandınız."
    end
  end
end
