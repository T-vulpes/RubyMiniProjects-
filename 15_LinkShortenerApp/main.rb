require 'tk'
require 'securerandom'
require 'webrick'

$links = {}

# --- Server ---
Thread.new do
  server = WEBrick::HTTPServer.new(Port: 8000, AccessLog: [], Logger: WEBrick::Log.new(File::NULL))
  server.mount_proc '/' do |req, res|
    code = req.path[1..]
    if $links.key?(code)
      res.set_redirect(WEBrick::HTTPStatus::MovedPermanently, $links[code])
    else
      res.status = 404
      res.body = "Short URL not found"
    end
  end
  trap("INT") { server.shutdown }
  server.start
end

#

root = TkRoot.new { title "Colorful Link Shortener" }
root.configure("background" => "#222222")

TkLabel.new(root) do
  text "Enter a URL to shorten:"
  foreground "white"
  background "#222222"
  font "Arial 12 bold"
  pack { padx 15; pady 10 }
end

entry = TkEntry.new(root) do
  background "#333333"
  foreground "#00ffcc"
  insertbackground "#00ffcc" 
  font "Consolas 11"
  width 40
  pack { padx 20; pady 5 }
end

output_label = TkLabel.new(root) do
  text ""
  foreground "#00ffcc"
  background "#222222"
  font "Consolas 11 italic"
  pack { padx 15; pady 5 }
end

# Button
TkButton.new(root) do
  text "Shorten URL"
  background "#444444"
  foreground "white"
  activebackground "#00cc99"
  activeforeground "black"
  font "Arial 11 bold"
  borderwidth 3
  relief "groove"
  command {
    original = entry.get.strip
    if original.empty?
      Tk.messageBox(
        type: "ok",
        icon: "warning",
        title: "Error",
        message: "Please enter a URL!"
      )
    else
      code = SecureRandom.hex(3)
      $links[code] = original
      short_url = "http://localhost:8000/#{code}"
      output_label.text = "Shortened: #{short_url}"

      Tk.messageBox(
        type: "ok",
        icon: "info",
        title: "Success",
        message: "Shortened URL:\n#{short_url}"
      )
    end
  }
  pack { padx 15; pady 10 }
end

Tk.mainloop
