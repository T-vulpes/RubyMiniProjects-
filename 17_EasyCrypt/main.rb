require 'tk'

root = TkRoot.new { title "File Encrypt / Decrypt" }

TkLabel.new(root) { text "File Path:"; pack(pady: 5, anchor: 'w') }
file_entry = TkEntry.new(root) { width 40; pack(pady: 5) }

TkLabel.new(root) { text "Key (number):"; pack(pady: 5, anchor: 'w') }
key_entry = TkEntry.new(root) { width 20; pack(pady: 5) }

message_label = TkLabel.new(root) { text ""; pack(pady: 10) }

def process_file(file_path, key, mode, message_label)
  begin
    content = File.read(file_path)
  rescue
    message_label.text = "❌ Cannot read the file!"
    return
  end

  result = content.bytes.map { |byte| (byte ^ key).chr }.join

  new_file = case mode
             when :encrypt then file_path + ".enc"
             when :decrypt then file_path + ".dec"
             end

  begin
    File.write(new_file, result)
    message_label.text = "✅ Done! New file: #{new_file}"
  rescue
    message_label.text = "❌ Failed to write the file!"
  end
end

encrypt_button = TkButton.new(root) do
  text "🔒 Encrypt"
  command proc {
    path = file_entry.get
    key = key_entry.get.to_i
    process_file(path, key, :encrypt, message_label)
  }
  pack(pady: 5)
end

decrypt_button = TkButton.new(root) do
  text "🔓 Decrypt"
  command proc {
    path = file_entry.get
    key = key_entry.get.to_i
    process_file(path, key, :decrypt, message_label)
  }
  pack(pady: 5)
end

Tk.mainloop
