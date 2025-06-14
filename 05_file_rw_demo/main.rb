def read_file
  begin
    File.open("volleyballplayers.txt", "r") do |file|
      puts "\n📄 File Content:"
      file.each_line do |line|
        puts line
        puts "————"
      end
    end
  rescue Errno::ENOENT
    puts "⚠ File not found!"
  end
end

# Function to append to the file
def write_to_file
  begin
    File.open("volleyballplayers.txt", "a") do |file|
      print "Enter player information (name,height,position): "
      player_info = gets.chomp
      file.write(player_info + "\n")
      puts "✅ Player added successfully!"
    end
  rescue
    puts "⚠ An error occurred while writing to the file."
  end
end

# Function to delete entire content of the file
def clear_file
  begin
    File.open("volleyballplayers.txt", "w") do |file|
      file.truncate(0)
    end
    puts "🗑 File content cleared successfully."
  rescue
    puts "⚠ An error occurred while clearing the file."
  end
end

# Function to delete a specific line
def delete_line
  begin
    lines = File.readlines("volleyballplayers.txt")

    puts "\n📄 Current File Content:"
    lines.each_with_index do |line, index|
      puts "#{index + 1}: #{line.strip}"
    end

    print "\nEnter the line number you want to delete: "
    line_to_delete = gets.to_i

    if line_to_delete < 1 || line_to_delete > lines.length
      puts "⚠ Invalid line number!"
      return
    end

    lines.delete_at(line_to_delete - 1)

    File.open("volleyballplayers.txt", "w") do |file|
      lines.each { |line| file.puts line }
    end

    puts "✅ Line deleted successfully."
  rescue Errno::ENOENT
    puts "⚠ File not found!"
  rescue
    puts "⚠ An unexpected error occurred."
  end
end

# Main menu
def main_menu
  loop do
    puts "\n📘 What would you like to do?"
    puts "1. Read the file"
    puts "2. Write to the file"
    puts "3. Clear file content"
    puts "4. Delete a specific line"
    puts "5. Exit"
    print "Your choice: "

    begin
      choice = gets.to_i
    rescue TypeError
      puts "⚠ Invalid input type!"
      next
    end

    case choice
    when 1
      read_file
    when 2
      write_to_file
    when 3
      clear_file
    when 4
      delete_line
    when 5
      puts "👋 Exiting the program..."
      break
    else
      puts "⚠ Invalid selection. Please enter a number between 1 and 5."
    end
  end
end

# Start the program
main_menu
