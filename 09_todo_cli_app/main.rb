class List
  attr_accessor :items

  def initialize
    @items = []
  end

  def add(item)
    @items << item
  end

  def save_to_file(user_name, date)
    File.open("list.txt", "a") do |file|
      file.puts "User: #{user_name}"
      file.puts "Date: #{date}"
      file.puts "Plans:"
      @items.each_with_index do |item, index|
        file.puts "#{index + 1}. #{item}"
      end
      file.puts "-" * 30
    end
  end
end

# 📋 Tüm kullanıcıları listeden çıkar
def tum_kullanicilari_getir(dosya_adi)
  kullanicilar = []
  File.readlines(dosya_adi).each do |satir|
    if satir.start_with?("Kullanıcı:")
      isim = satir.split(":")[1].strip
      kullanicilar << isim unless kullanicilar.include?(isim)
    end
  end
  kullanicilar
end

# ❌ Kullanıcıya ait tüm planları sil
def kullanici_planlarini_sil(dosya_adi, secilen_isim)
  yeni_satirlar = []
  silme_modu = false

  File.readlines(dosya_adi).each do |satir|
    if satir.start_with?("Kullanıcı:")
      if satir.include?(secilen_isim)
        silme_modu = true
        next
      else
        silme_modu = false
      end
    end

    if silme_modu
      next if satir.include?("-" * 5)
      next
    end

    yeni_satirlar << satir
  end

  File.open(dosya_adi, "w") do |file|
    file.puts yeni_satirlar
  end

  puts "\n✅ '#{secilen_isim}' kullanıcısının tüm planları silindi!"
end

# 📂 Planları göster
def planlari_goster(dosya_adi)
  if File.exist?(dosya_adi)
    puts "\n📄 Kayıtlı Planlar:"
    puts File.read(dosya_adi)
  else
    puts "Henüz plan kaydı bulunmuyor."
  end
end

# 🔁 Ana program akışı
puts "📝 İsminizi giriniz:"
name = gets.chomp

puts "\n📌 ToDoList'e Hoşgeldiniz sayın #{name}"
zaman = Time.now
formatted_date = zaman.strftime("%d/%m/%Y")
puts "📅 Bugünün tarihi: #{formatted_date}"

loop do
  puts "\nYapmak istediğiniz işlemi seçiniz:"
  puts "1 - Plan ekle"
  puts "2 - Planları görüntüle"
  puts "3 - Kullanıcının planlarını sil"
  puts "4 - Çıkış"
  print "Seçiminiz: "
  option = gets.to_i

  case option
  when 1
    my_list = List.new
    loop do
      print "Yeni plan girin: "
      plan = gets.chomp
      my_list.add(plan)

      print "Başka plan eklemek ister misiniz? (evet/hayır): "
      cevap = gets.chomp.downcase
      break if cevap == "hayır"
    end
    my_list.save_to_file(name, formatted_date)
    puts "✅ Planlar başarıyla kaydedildi."

  when 2
    planlari_goster("list.txt")

  when 3
    if File.exist?("list.txt")
      puts "\n🔍 Kayıtlı Kullanıcılar:"
      kullanicilar = tum_kullanicilari_getir("list.txt")
      kullanicilar.each_with_index do |k, i|
        puts "#{i + 1}. #{k}"
      end

      print "\nSilmek istediğiniz kullanıcı adını girin: "
      hedef = gets.chomp

      if kullanicilar.include?(hedef)
        kullanici_planlarini_sil("list.txt", hedef)
      else
        puts "❌ Bu kullanıcı bulunamadı."
      end
    else
      puts "Henüz kullanıcı verisi bulunamadı."
    end

  when 4
    puts "\n👋 Görüşmek üzere, #{name}!"
    break

  else
    puts "⚠️ Lütfen 1 ile 4 arasında bir değer girin."
  end
end
