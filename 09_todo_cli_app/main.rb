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

# 📋 Retrieve all usernames from the list
def get_all_users(file_name)
  users = []
  File.readlines(file_name).each do |line|
    if line.start_with?("User:")
      name = line.split(":")[1].strip
      users << name unless users.include?(name)
    end
  end
  users
end

# ❌ Delete all plans of a selected user
def delete_user_plans(file_name, selected_user)
  new_lines = []
  delete_mode = false

  File.readlines(file_name).each do |line|
    if line.start_with?("User:")
      if line.include?(selected_user)
        delete_mode = true
        next
      else
        delete_mode = false
      end
    end

    if delete_mode
      next if line.include?("-" * 5)
      next
    end

    new_lines << line
  end

  File.open(file_name, "w") do |file|
    file.puts new_lines
  end

  puts "\n✅ All plans of '#{selected_user}' have been deleted!"
end

# 📂 Show all plans
def show_plans(file_name)
  if File.exist?(file_name)
    puts "\n📄 Saved Plans:"
    puts File.read(file_name)
  else
    puts "No saved plans found."
  end
end

# 🔁 Main program loop
puts "📝 Please enter your name:"
name = gets.chomp

puts "\n📌 Welcome to the ToDoList, #{name}"
current_time = Time.now
formatted_date = current_time.strftime("%d/%m/%Y")
puts "📅 Today's date: #{formatted_date}"

loop do
  puts "\nSelect an option:"
  puts "1 - Add plan"
  puts "2 - View all plans"
  puts "3 - Delete a user's plans"
  puts "4 - Exit"
  print "Your choice: "
  option = gets.to_i

  case option
  when 1
    my_list = List.new
    loop do
      print "Enter your plan: "
      plan = gets.chomp
      my_list.add(plan)

      print "Do you want to add another? (yes/no): "
      answer = gets.chomp.downcase
      break if answer == "no"
    end
    my_list.save_to_file(name, formatted_date)
    puts "✅ Plans saved successfully."

  when 2
    show_plans("list.txt")

  when 3
    if File.exist?("list.txt")
      puts "\n🔍 Existing Users:"
      users = get_all_users("list.txt")
      users.each_with_index do |user, index|
        puts "#{index + 1}. #{user}"
      end

      print "\nEnter the username whose plans you want to delete: "
      target = gets.chomp

      if users.include?(target)
        delete_user_plans("list.txt", target)
      else
        puts "❌ User not found."
      end
    else
      puts "No user data found yet."
    end

  when 4
    puts "\n👋 Goodbye, #{name}!"
    break

  else
    puts "⚠️ Please enter a number between 1 and 4."
  end
end
