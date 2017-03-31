require 'random_name_generator'
require_relative '../app/models/criminal.rb'
require_relative '../app/models/criminal_capture.rb'
require_relative '../app/models/rat_sighting.rb'
require_relative '../app/models/user.rb'
require 'pry'




class GamePlay

  @@game_rat = RatSighting.get_random_rat
  @@game_suspects = Criminal.get_random_suspects
  @@game_suspects_names = @@game_suspects.map {|suspect| suspect[:name]}
  @@game_mastermind = Criminal.select_mastermind
  @@guess_counter = 1
  @@player = "unknown"

  # def initialize
  #   @views = GamePlayView.new
  # end
  #
  # def run
  #   views.welcome
  #   self.create_new_user
  # end

  def self.ascii
      puts <<-Heredoc
              _..----.._    _
            .'  .--.    "-.(0)
'-.__.-'"'=:|   ,  _)_ \__ . c\'-..
             '''------'---''---'-"



      Heredoc
  end

  def self.ascii_two
    puts <<-Heredoc
              _..----.._    _
            .'  .--.    "-.(0)
 _.-''.-'"'=:|   ,  _)_ \__ . c\'-..
             '''------'---''---'-"



    Heredoc
  end

  def self.ascii_three
    puts <<-Heredoc
              _..----.._    _
            .'  .--.    "-.(0)
  '-.__.-'"'=:|   ,  _)_ \__ . c\'-..
             '''------'---''---'-"



    Heredoc
  end

  def self.ascii_four
    puts <<-Heredoc
                  _..----.._    _
                .'  .--.    "-.(0)
    _.-''.-'"'=:|   ,  _)_ \__ . c\'-..
                 '''------'---''---'-"



    Heredoc
  end

  def self.ascii_five
    puts <<-Heredoc
                  _..----.._    _
                .'  .--.    "-.(0)
      '-.__.-'"'=:|   ,  _)_ \__ . c\'-..
                 '''------'---''---'-"



    Heredoc
  end

  def self.ascii_six
    puts <<-Heredoc
                      _..----.._    _
                    .'  .--.    "-.(0)
        _.-''.-'"'=:|   ,  _)_ \__ . c\'-..
                     '''------'---''---'-"



    Heredoc
  end

  def self.ascii_seven
    puts <<-Heredoc
                      _..----.._    _
                    .'  .--.    "-.(0)
          '-.__.-'"'=:|   ,  _)_ \__ . c\'-..
                     '''------'---''---'-"



    Heredoc
  end

  def self.ascii_eight
    puts <<-Heredoc
                      _..----.._    _
                    .'  .--.    "-.(0)
        _.-''.-'"'=:|   ,  _)_ \__ . c\'-..
                     '''------'---''---'-"



    Heredoc
  end

  def self.ascii_nine
    puts <<-Heredoc
                        _..----.._    _
                      .'  .--.    "-.(0)
            '-.__.-'"'=:|   ,  _)_ \__ . c\'-..
                       '''------'---''---'-"



    Heredoc
  end

  def self.ascii_ten
    puts <<-Heredoc
                            _..----.._    _
                          .'  .--.    "-.(0)
              _.-''.-'"'=:|   ,  _)_ \__ . c\'-..
                           '''------'---''---'-"



    Heredoc
  end

  def self.ascii_eleven
    puts <<-Heredoc
                            _..----.._    _
                          .'  .--.    "-.(0)
                '-.__.-'"'=:|   ,  _)_ \__ . c\'-..
                           '''------'---''---'-"



    Heredoc
  end

  def self.ascii_twelve
    puts <<-Heredoc
                                _..----.._    _
                              .'  .--.    "-.(0)
                  _.-''.-'"'=:|   ,  _)_ \__ . c\'-..
                               '''------'---''---'-"



    Heredoc
  end

  def self.animation
    self.ascii
    sleep(0.2)
    system "clear"
    self.ascii_two
    sleep(0.2)
    system "clear"
    self.ascii_three
    sleep(0.2)
    system "clear"
    self.ascii_four
    sleep(0.2)
    system "clear"
    self.ascii_five
    sleep(0.2)

    system "clear"
    self.ascii_six
    sleep(0.2)

    system "clear"
    self.ascii_seven
    sleep(0.2)

    system "clear"
    self.ascii_eight
    sleep(0.2)

    system "clear"
    self.ascii_nine
    sleep(0.2)

    system "clear"
    self.ascii_ten
    sleep(0.2)

    system "clear"
    self.ascii_eleven
    sleep(0.2)
    system "clear"

    self.ascii_twelve
    sleep(0.2)
  end


  def self.welcome
    system "clear"
    self.animation
    system "clear"
    puts "***********************************************************************"
    puts "***********************************************************************"
    puts "***********************************************************************"
    puts "                          WELCOME TO FIND THE"
    puts "

                                            88
                    8b,dPPYba, ,adPPYYba, MM88MMM
                    88P'     "'8 ""     `Y8   88
                    88         ,adPPPPP88   88
                    88         88,    ,88   88,
                    88         `"8bbdP"Y8   "Y888"'
    puts ""
    puts ""
    puts ""
    puts "        #{ascii}"
    puts "***********************************************************************"
    puts "***********************************************************************"
    puts "***********************************************************************"
    puts ""
    puts "Hello agent, please input your first name!"
  end

def options
  puts "Type 'help' to see the rules, 'exit' to leave the game or 'start' to see the first rat!"
  user_input = gets.chomp
  if user_input == 'help'
    help
  elsif user_input == 'start'
    start_game
  elsif user_input == 'exit'
    leave
  else
    puts "I did not understand that command, agent! Please type 'help' or 'start'!"
    user_input
    options
  end
end

  def self.launch_website(website)
    Launchy.open(website)
  end

  def self.continue
    print ">>>> Press any key to continue..."
    STDIN.getch
    print "                                   \r"
    puts "                                                                     "
  end

  def self.create_new_user
    input = gets.chomp
    @@player = User.create
    @@player.name = input.capitalize
    @@player.assign_agent_name
    @@player.save
    puts "Hello, #{@@player.name}! For this dangerous mission, we're assigning you the codename #{@@player.agent_name.upcase}."
    self.continue
  end


  def self.mission_statement
    system "clear"
    puts "-----------CASEFILE FOR AGENT #{@@player.agent_name.upcase}------------"
    # puts "
    # A notorious criminal is posing as a RAT in New York City! We've scraped the data from the
    # latest 311 calls on rat sightings so that we can uncover the culprit behind this mastermind scheme!
    # Your job is to use the clues from a classified FBI database to identify the villain masquerading as a mere NYC rat!
    # "
    puts "
    > Oh noes! Mutant rats have taken over New York City!

    > We don't know why but they seem to have taken the form of some of the most
    notorious criminal masterminds the world has ever seen!

    > Our only hope is the brilliant data we acquired via 311 reps working day
    and night logging complaints from our fellow citizens of the RAT SIGHTINGS.

    > Your mission, should you choose to accept it, is to use the clues from a
    classified FBI database to identify the mutant rat based on behavioral
    patterns resembling a famous criminal!
    "
    puts "-----------------------------------------------------------------------"
  end

  def self.options
    puts "<><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><>"
    puts "Type 'help' to see the rules, 'exit' to leave the game or 'start' to see the first rat!"
    puts "<><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><>"
    user_input = gets.chomp
    if user_input == 'help'
      help
      user_input
      options
    elsif user_input == 'start'
      start_game
    elsif user_input == 'exit'
      leave
    else
      puts "I did not understand that command, agent! Please type 'help' or 'start'!"
      user_input
      options
    end
  end

  def self.goodbye
    puts <<-Heredoc
   d888b   .d88b.   .d88b.  d8888b. d8888b. db    db d88888b
  88' Y8b .8P  Y8. .8P  Y8. 88  `8D 88  `8D `8b  d8' 88'
  88      88    88 88    88 88   88 88oooY'  `8bd8'  88ooooo
  88  ooo 88    88 88    88 88   88 88~~~b.    88    88~~~~~
  88. ~8~ `8b  d8' `8b  d8' 88  .8D 88   8D    88    88.
   Y888P   `Y88P'   `Y88P'  Y8888D' Y8888P'    YP    Y88888P'


    Heredoc
  end

  def self.byemouse
    puts <<-Heredoc


             __             _,-"~^"-.
           _// )      _,-"~`         `.
         ." ( /`"-,-"`                 ;
        / 6                             ;
       /           ,             ,-"     ;
      (,__.--.      \           /        ;
       //'   /`-.\   |          |        `._________
         _.-'_/`  )  )--...,,,___\     \-----------,)
       ((("~` _.-'.-'           __`-.   )         //
             ((("`             (((---~"`         //
                                                ((________________
                                                `----""""~~~~^^^```



    Heredoc

  end

  def self.leave
    puts "+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
    puts "Why are you leaving?! We need your help! Fine.. =["
    puts ""
    self.goodbye
    puts ""
    self.byemouse
    puts "+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
  end

  def self.help
    puts "-----------------------------------------------------------------------"
    puts "
    1. You will be given a list of suspects and a clue to help you narrow your search.
    2. You will be given four chances with a new clue each time to find the mastermind!
    3. Each rat is being located in real-time through 311 calls from distraught citizens of New York City.
    4. You too can be a hero: catch the criminal here and report mutant rats by calling 311!
    "
    self.continue
    puts "-----------------------------------------------------------------------"
  end

  def self.start_game
    system "clear"
    puts "-----------------------------------------------------------------------"
    puts "
    RAT SIGHTING:
    A rat has been spotted at #{@@game_rat.timestamp}."
    sleep(2)
    puts "-----------------------------------------------------------------------"
    puts "We're sending his last known coordinates, #{@@game_rat.latitude}, #{@@game_rat.longitude} to your browser window.
    Make sure to navigate back to the terminal after you've checked out the location."
    self.continue
    self.launch_website("https://www.google.com/maps/place/#{@@game_rat.address_format}")
    puts "-----------------------------------------------------------------------"
    puts "Looks like he's been lurking around #{@@game_rat.address}..."
    self.continue
    puts "
    He is operating under the code name #{@@game_rat.pseudonym.upcase}.
    You will be shown a list of potential criminals #{@@game_rat.pseudonym.upcase} is morphing into.
    Use the clues to discover his true identity before he escapes...

    "
    puts "-----------------------------------------------------------------------"
    self.continue
    clue_1
    self.continue
    self.make_a_guess
  end

  def self.suspects_list
    puts "SUSPECT LIST"
    @@game_suspects_names.each do |suspect|
      puts  "- #{suspect}"
    end
  end

  def self.make_a_guess
    suspects_list
    puts "======================================================================="
    puts "Type the full name of the suspect to make a guess:"
    puts "======================================================================="
    user_guess = gets.chomp
    if user_guess == @@game_mastermind[:name]
      correct_guess
    elsif user_guess == 'exit'
      self.leave
    elsif @@game_suspects_names.include?(user_guess) && user_guess != @@game_mastermind[:name]
      remove_suspect(user_guess)
      if @@guess_counter < 5
        puts "Wrong villain! Continue on to receive the next clue."
        self.continue
      end
      incorrect_guess
    else
      puts "====================================================================="
      puts "Stop goofing off and CATCH THE CRIMINAL!"
      puts "(We didn't recognize that input, try typing the name again.)"
      puts "====================================================================="
      make_a_guess
    end

  end

  def self.captured_criminals
    CriminalCapture.where(user_id: @@player.id)
  end

  def self.correct_guess
    puts ""
    puts "***********************************************************************"
    puts ""
    puts "            * You got him! You win! OMG ur so good! *                 "
    puts ""
    puts "***********************************************************************"
    puts ""
    puts "Congratulations, Agent #{@@player.agent_name}!"
    puts "You captured the mutant rat #{@@game_rat.pseudonym.upcase} parading around as #{@@game_mastermind.name.upcase}, thwarting his schemes!"
    puts ""
    self.continue
    self.mastermind_stats
    self.continue
    self.launch_website(@@game_mastermind.criminal_page_url)
  end

  def self.mastermind_stats
    system "clear"
    puts "***********************************************************************"
    puts "************************ MASTERMIND STATS *****************************"
    puts "***********************************************************************"
    puts "                                                       "
    puts "#{@@game_mastermind.name}:"
    puts "Born #{@@game_mastermind.birthday}"
    puts "He operated in the #{@@game_mastermind.century} century."
    puts "KNOWN FOR:"
    puts ">> #{@@game_mastermind.most_notorious_for}"
    puts "DID YOU KNOW?"
    puts ">> #{@@game_mastermind.trivia}"
    puts "                                                       "
  end


  def self.incorrect_guess
    case @@guess_counter
    when 1
      clue_2
      @@guess_counter += 1
      make_a_guess
    when 2
      clue_3
      @@guess_counter += 1
      make_a_guess
    when 3
      clue_4
      @@guess_counter += 1
      make_a_guess
    when 4
      puts "One last chance to find the villain!"
      clue_5
      @@guess_counter += 1
      make_a_guess
    else
      puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
      puts "                          You lose! SRY!"
      puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
      self.continue
      puts "The mastermind was #{@@game_mastermind.name}."
      self.mastermind_stats
      self.continue
      self.launch_website(@@game_mastermind.criminal_page_url)
    end
  end

  def self.invalid_guess
    puts "Not a valid entry, guess again."
    make_a_guess
  end

  def self.remove_suspect(suspect_name)
    @@game_suspects_names.delete(suspect_name)
  end

  def self.clue_1
    system "clear"
    puts "                                                       "
    puts "******************************* CLUE 1 ********************************"
    puts "                                                       "
    puts "Here's your first clue! The mastermind is specialized in #{@@game_mastermind.crime_type}!"
    puts "                                                       "
    puts "***********************************************************************"
  end

  def self.clue_2
    system "clear"
    puts "                                                       "
    puts "******************************* CLUE 2 ********************************"
    puts "                                                       "
    puts "OK, we got another clue for you! The criminal operated in the #{@@game_mastermind.century} century."
    puts "                                                       "
    puts "***********************************************************************"
  end

  def self.clue_3
    system "clear"
    puts "                                                       "
    puts "******************************* CLUE 3 ********************************"
    puts "                                                       "
    puts "We're cutting it close...he's gonna get away! The criminal was born on #{@@game_mastermind.birthday}."
    puts "                                                       "
    puts "***********************************************************************"
  end

  def self.clue_4
    system "clear"
    puts "                                                       "
    puts "******************************* CLUE 4 ********************************"
    puts "                                                       "
    puts "Trivia about this criminal: #{@@game_mastermind.trivia}"
    puts "                                                       "
    puts "***********************************************************************"
  end

  def self.clue_5
    system "clear"
    puts "                                                       "
    puts "******************************* CLUE 5 ********************************"
    puts "                                                       "
    puts "LAST CHANCE TO CATCH THE VILLAIN! Notorious for: #{@@game_mastermind.most_notorious_for}"
    puts "                                                       "
    puts "***********************************************************************"
  end

end
