require 'random_name_generator'
require_relative '../app/models/Criminal.rb'
require_relative '../app/models/CriminalCapture.rb'
require_relative '../app/models/RatSighting.rb'
require_relative '../app/models/User.rb'
require 'pry'

class GamePlay

  @@game_rat = RatSighting.get_random_rat
  @@game_suspects = Criminal.get_random_suspects
  @@game_suspects_names = @@game_suspects.map {|suspect| suspect[:name]}
  @@game_mastermind = Criminal.select_mastermind

  def self.welcome
    puts "Hello agent, please input your full name!"
  end

  def self.create_new_user
    input = gets.chomp
    player = User.create(name: input, agent_name: "x")
    puts "Hello, #{player.name}! Your codename is #{player.assign_agent_name}"
  end

  def self.mission_statement
    puts "A notorious criminal is posing as a rat in New York City! We've scraped the data from the
    latest 311 calls on rat sightings, so that we can uncover the culprit behind this mastermind scheme! Your job is to
    use the clues from a classified FBI database that we provide you to identify the villain masquerading as a mere NYC rat!"
  end

  def self.options
    puts "Type 'help' to see the rules of the game or 'start' to see the first rat!"
    if user_input == 'help'
      help
    elsif user_input == 'start'
      start_game
    else
      puts "I did not understand that command, agent! Please type 'help' or 'start'!"
      user_input
      options
    end
  end

  def self.help
    puts "Pay attention, agent! Your job is to find the criminal that is masquerading as a rat! You will be given
    a list of suspects and a clue to help you narrow your search. You will be given four chances with a new clue each time
    to find the mastermind! If your deductive skills suffice to pinpoint the correct criminal, that criminal will be
    added to your casefile and you will forever be honored! If you are incorrect, the criminal will continue to run
    free and wreak havoc on the city! Each rat is being located in real-time through 311 calls from distraught citizens of New York
    City. You too can report potential criminals pretending to be rats."
  end


  def self.start_game
    puts "A rat has been spotted at #{@@game_rat.timestamp}. It's identifying itself as #{@@game_rat.pseudonym}. Here's a list of notorious criminals who are known to prowl this area. Uncover #{@@game_rat.pseudonym}'s true identity by guessing the clues correctly!"
  end

  def self.suspects_list
    @@game_suspects_names.each {|suspect| puts suspect}
  end

  def self.make_a_guess
    suspects_list
    puts "Type the full name of the suspect to make a guess:"
    user_guess = gets.chomp
    if user_guess == @@game_mastermind[:name]
      correct_guess
    elsif user_guess != @@game_mastermind[:name]
      remove_suspect(user_guess)
      incorrect_guess
    else
      invalid_guess
    end

  end

  def self.correct_guess
    puts "you win!"
  end

  def self.incorrect_guess
    puts "try again, here's a clue!"
    make_a_guess
  end

  def self.invalid_guess
    puts "Not a valid entry, guess again"
    make_a_guess
  end

  def self.remove_suspect(suspect_name)
    @@game_suspects_names.delete(suspect_name)
  end

  def self.clue_1

  end
end
