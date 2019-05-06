class VINEYARD::CLI
  # Runs fun_intro then sends user to menu
  def call
    fun_intro
    menu
  end

  def fun_intro

    			puts "                    "
    			puts "OH NO!!".bold.red
    			sleep 3
    			puts "You caught the last boat to Martha's Vineyard,
-----------
and don't have a place to sleep!".bold
    			sleep 3
    			puts "     ░░▄▀▀▀▄░▄▄░░░░░░╠▓░░░░
     ░░░▄▀▀▄█▄░▀▄░░░▓╬▓▓▓░░
     ░░▀░░░░█░▀▄░░░▓▓╬▓▓▓▓░
     ░░░░░░▐▌░░░░▀▀███████▀
     ▒▒▄██████▄▒▒▒▒▒▒▒▒▒▒▒▒".bold.cyan
    			puts "
Well I built this CLI app just for you...".bold
  end
# Iterates through @@all Hotels from the Hotel class and puts them into a list
  def list_events
    VINEYARD::Hotels.all.each_with_index do |event, index|
      puts "#{index +1}. #{event.name}".bold
      if index == 6
      break
      end
    end
  end
# Create's a new instance of the Scraper class' scrape_events method
# Offers user a choice as to what hotel they'd like to see more information about
# Calls on the Hotel class' open_in browser method if user wants to see webpage
  def menu
    VINEYARD::Scraper.new.scrape_events
    puts "                    "
    puts"            Here are some last minute hotel options".bold.red
    puts"              -------Please type a number".bold.cyan
    list_events

    input = ""
    input = gets.strip
    while input != "exit"

        if input.to_i-1 <= VINEYARD::Hotels.all.size
          hotel = VINEYARD::Hotels.all[input.to_i-1]

          puts ""
          puts "Address: #{hotel.address}".bold
          puts "Phone Number: #{hotel.phone}".bold
          puts "About: #{hotel.description}".bold.blue

          puts ""
          puts "'list' -            to see list again."
          puts "'exit' -            if you're actually on Nantucket."
          puts "'open' -            to open website in browser."

        input = gets.strip

        if input.downcase == "list"
        menu
      elsif input.downcase == "exit"
          exit
        elsif input.downcase == "open"
          VINEYARD::Hotels.open_in_browser
        else
          puts "Please choose from list...".bold.yellow
          sleep 1
          puts ""
          list_events
          end
        end
      end
    end





end
