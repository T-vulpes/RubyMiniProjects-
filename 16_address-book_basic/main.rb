require 'tk'

def read_file_content
  File.exist?("addressbook.txt") ? File.read("addressbook.txt") : "No saved entries yet."
end

def valid_email?(email)
  email.include?("@") && email.match?(/\A[^@\s]+@[^@\s]+\.[^@\s]+\z/)
end

def valid_phone?(phone)
  phone.match?(/\A\d{11}\z/)
end

def save_entry(name, phone, email, text_widget)
  unless valid_email?(email)
    Tk.messageBox(type: "ok", icon: "error", title: "Invalid Email", message: "Please enter a valid email address (must include '@').")
    return
  end

  unless valid_phone?(phone)
    Tk.messageBox(type: "ok", icon: "error", title: "Invalid Phone", message: "Phone number must be exactly 11 digits.")
    return
  end

  return if name.empty?

  File.open("addressbook.txt", "a") do |file|
    file.puts "Name: #{name}"
    file.puts "Phone: #{phone}"
    file.puts "Email: #{email}"
    file.puts "----"
  end

  text_widget.delete("1.0", "end")
  text_widget.insert("end", read_file_content)

  $name_entry.delete(0, "end")
  $phone_entry.delete(0, "end")
  $email_entry.delete(0, "end")

  Tk.messageBox(type: "ok", icon: "info", title: "Success!", message: "Entry saved!")
end

# === GUI ===
root = TkRoot.new { title "Address Book" }
root.configure("background" => "#000000")

TkLabel.new(root) do
  text "Address Book"
  font "Arial 16 bold"
  foreground "white"
  background "#000000"
  pack(pady: 10)
end

text_widget = TkText.new(root) do
  width 55
  height 18
  font "Consolas 10"
  background "#111111"
  foreground "#00FFAA"
  insertbackground "#FFFFFF"
  relief "flat"
  wrap "word"
  pack(pady: 10)
end
text_widget.insert("end", read_file_content)

entry_frame = TkFrame.new(root) do
  background "#000000"
  pack(pady: 5)
end

def create_labeled_entry(frame, label_text, width = 25)
  TkLabel.new(frame) do
    text label_text
    foreground "white"
    background "#000000"
    font "Arial 10"
    pack(side: "left", padx: 5)
  end

  entry = TkEntry.new(frame) do
    width width
    font "Arial 10"
    background "#222222"
    foreground "#FFFFFF"
    insertbackground "#FFFFFF"
    relief "flat"
    pack(side: "left", padx: 5)
  end

  entry
end

$name_entry = create_labeled_entry(entry_frame, "Name:")
$phone_entry = create_labeled_entry(entry_frame, "Phone:")
$email_entry = create_labeled_entry(entry_frame, "Email:")

TkButton.new(root) do
  text "Save Entry"
  font "Arial 10 bold"
  background "#CC0000"
  foreground "white"
  activebackground "#FF0000"
  activeforeground "white"
  relief "flat"
  command {
    save_entry($name_entry.get, $phone_entry.get, $email_entry.get, text_widget)
  }
  pack(pady: 15)
end

Tk.mainloop
