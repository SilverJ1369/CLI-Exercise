require_relative 'api.rb'
require_relative 'user.rb'
require_relative 'auth.rb'


class CLI
  def run
    User.seed
    greet
    sign_in
    until menu == 'exit'
    end
    goodbye
  end

  def greet
    puts "Welcome to the scraper CLI"
  end

  def sign_in
    is_authenticated = false

    until is_authenticated
      puts "Please enter your username: "
      username = gets.chomp
      puts "Please enter your password: "
      password = gets.chomp

      is_authenticated = Auth.authenticate_user(username, password, User.all)

      if is_authenticated
        puts "Welcome #{username}!"
      else
        puts "Invalid username or password. Please try again."
      end
    end
  end
  
  
  def menu
    puts "\nPlease enter the number that corresponds to the category of books you wish to see, or enter 'exit' to quit."
    puts "\n Categories: \n 1. Philosophy \n 2. Science \n 3. Psychology \n 4. History \n 5. Health"
    cat = gets.chomp.to_i
    get_books(cat)
    cat
  end
  def get_books(cat)
    API.get_data(cat)
  end
  def goodbye
    puts "Until next time!"
  end
end
