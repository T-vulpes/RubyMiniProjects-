class UserInfo
  attr_accessor :username, :password
  def initialize(username, password)
    @username = username
    @password = password
  end

  def save_to_file
    File.open("usersinfo.txt", "a") do |file|
      file.puts "#{@username},#{@password}"
    end
  end
end

def register_user
  puts "\nRegister a new user"
  print "Enter username: "
  username = gets.chomp
  print "Enter password: "
  password = gets.chomp

  if username_exists?(username)
    puts "This username is already taken. Please choose another."
    return
  end

  user = UserInfo.new(username, password)
  user.save_to_file
  puts "User registered successfully!"
end

def username_exists?(username)
  begin
    File.foreach("usersinfo.txt") do |line|
      existing_username, _ = line.chomp.split(",")
      return true if existing_username == username
    end
  rescue Errno::ENOENT
    return false
  end
  false
end

def login
  begin
    print "\nUsername: "
    username_input = gets.chomp
    print "Password: "
    password_input = gets.chomp

    authenticated = false

    File.foreach("usersinfo.txt") do |line|
      username, password = line.chomp.split(",")
      if username_input == username && password_input == password
        authenticated = true
        break
      end
    end

    if authenticated
      puts "Login successful! Welcome, #{username_input}."
    else
      puts "Incorrect username or password."
    end
  rescue Errno::ENOENT
    puts "User file not found. Please register first."
  end
end

def show_users
  begin
    puts "\nRegistered Users:"
    File.foreach("usersinfo.txt") do |line|
      username, _ = line.chomp.split(",")
      puts "- #{username}"
    end
  rescue Errno::ENOENT
    puts "No users registered yet."
  end
end

def delete_user
  begin
    lines = File.readlines("usersinfo.txt")
    puts "\nRegistered Users:"
    lines.each_with_index do |line, index|
      username, _ = line.chomp.split(",")
      puts "#{index + 1}. #{username}"
    end

    print "\nEnter the number of the user you want to delete: "
    number = gets.to_i

    if number < 1 || number > lines.length
      puts "Invalid number!"
      return
    end

    deleted_line = lines.delete_at(number - 1)
    File.write("usersinfo.txt", lines.join)
    puts "User deleted: #{deleted_line.chomp}"
  rescue Errno::ENOENT
    puts "User file not found!"
  end
end

def main_menu
  loop do
    puts "\nMain Menu"
    puts "1. Log In"
    puts "2. Register"
    puts "3. Show Users"
    puts "4. Delete User"
    puts "5. Exit"
    print "Your choice: "
    choice = gets.to_i

    case choice
    when 1
      login
    when 2
      register_user
    when 3
      show_users
    when 4
      delete_user
    when 5
      puts "Exiting the program..."
      break
    else
      puts "Invalid option. Please choose 1-5."
    end
  end
end

main_menu
