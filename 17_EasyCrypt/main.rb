require 'tk'

root = TkRoot.new { title "Dosya Şifreleme / Şifre Çözme" }

# Dosya yolu etiketi ve girişi
TkLabel.new(root) { text "Dosya Yolu:"; pack(pady: 5, anchor: 'w') }
file_entry = TkEntry.new(root) { width 40; pack(pady: 5) }

# Anahtar etiketi ve girişi
TkLabel.new(root) { text "Anahtar (sayı):"; pack(pady: 5, anchor: 'w') }
key_entry = TkEntry.new(root) { width 20; pack(pady: 5) }

# Sonuç mesaj etiketi
message_label = TkLabel.new(root) { text ""; pack(pady: 10) }

# Ortak şifreleme/çözme fonksiyonu
def process_file(file_path, key, mode, message_label)
  begin
    content = File.read(file_path)
  rescue
    message_label.text = "❌ Dosya okunamadı!"
    return
  end

  result = content.bytes.map { |byte| (byte ^ key).chr }.join

  new_file = case mode
             when :encrypt then file_path + ".enc"
             when :decrypt then file_path + ".dec"
             end

  begin
    File.write(new_file, result)
    message_label.text = "✅ İşlem tamam! Yeni dosya: #{new_file}"
  rescue
    message_label.text = "❌ Dosya yazılamadı!"
  end
end

# Şifrele butonu
encrypt_button = TkButton.new(root) do
  text "🔒 Şifrele"
  command proc {
    path = file_entry.get
    key = key_entry.get.to_i
    process_file(path, key, :encrypt, message_label)
  }
  pack(pady: 5)
end

# Şifre Çöz butonu
decrypt_button = TkButton.new(root) do
  text "🔓 Şifre Çöz"
  command proc {
    path = file_entry.get
    key = key_entry.get.to_i
    process_file(path, key, :decrypt, message_label)
  }
  pack(pady: 5)
end

Tk.mainloop
