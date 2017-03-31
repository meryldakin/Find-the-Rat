require 'pry'
require 'CSV'

class Adapter::CriminalInfo
  @@criminal_array =
  [{:name=>"Pablo Escobar",
    :crime_type=>"Organized Crime",
    :birthday=>"01 December 1949",
    :death_date=>"02 December 1993",
    :century=>"20th",
    :link_to_page=>"http://www.thefamouspeople.com/profiles/pablo-escobar-6711.php",
    :most_notorious_for=>
     "Often referred as the ‘King of coke,’ he was a notorious Colombian drug lord. He was considered as the most flagrant, influential and wealthiest criminal in the history of cocaine trafficking.\n",
    :trivia=>
     "During 1990s, the government expropriated his luxurious estate ‘Hacienda Napoles’, the unfinished Greek-style citadel and the zoo under the law ‘extinción de dominio’ and handed them over to the low-income families. The property was reformed to a theme park encompassed by four luxury hotels alongside the zoo and a tropical park.",
   },
   {:name=>"Ted Bundy",
    :crime_type=>"Murder",
    :birthday=>"24 November 1946",
    :death_date=>"24 January 1989",
    :century=>"20th",
    :link_to_page=>"http://www.thefamouspeople.com/profiles/ted-bundy-6703.php",
    :most_notorious_for=>
     "An American serial killer and rapist, who was active across the Unites States of America during the mid and late 1970s. He confessed to carrying out 30 killings besides committing other crimes.",
    :trivia=>
     "He was able to delay his execution for nearly 10 years through the long appeals process and tried to take his case up to the U.S Supreme Court but ultimately he couldn’t overturn his death sentence.",
  },
   {:name=>"Whitey Bulger",
    :crime_type=>"Organized Crime",
    :birthday=>"03 September 1929",
    :death_date=>nil,
    :century=>"20th",
    :link_to_page=>"http://www.thefamouspeople.com/profiles/whitey-bulger-5588.php",
    :most_notorious_for=>
     "This violent mob boss, who ruled Boston’s underground mob world during the 70s and 80s, has an exciting criminal life. The FBI, too, relied on him for information and was supportive of him in carrying out a number of crimes.",
    :trivia=>
     "He spent three years in Alcatraz Island prison off San Francisco’s shoreline, after attempting to escape from the Atlanta prison in November 1959."
    },
   {:name=>"Ed Gein",
    :crime_type=>"Murder",
    :birthday=>"27 August 1906",
    :death_date=>"26 July 1984",
    :century=>"20th",
    :link_to_page=>"http://www.thefamouspeople.com/profiles/ed-gein-29946.php",
    :most_notorious_for=>
     "Infamously known as the ‘Butcher of Plainfield’, he was an American murderer and body snatcher.",
    :trivia=>
     "His story had a major impact on movies, literature and music. Several movies based on his were made, such as ‘Deranged’ (1974),’ and In the Light of the Moon’ (2000)."
    },
   {:name=>"Billy the Kid",
    :crime_type=>"Murder",
    :birthday=>"17 November 1859",
    :death_date=>"14 July 1881",
    :century=>"19th",
    :link_to_page=>"http://www.thefamouspeople.com/profiles/billy-the-kid-6647.php",
    :most_notorious_for=>
     "He was both a folk hero and a notorious outlaw who was rumored to have killed 27 men though it is generally believed that he killed eight. A frontier outlaw in the American Old West, he is believed to have been a ruthless and cunning young man, highly skilled in using firearms.\n",
    :trivia=>
     "His short, yet dramatic life continues to capture the imagination of authors and screenwriters to this day. He has been the subject and inspiration for many films, books, and songs."
  },
   {:name=>"Richard Ramirez",
    :crime_type=>"Murder",
    :birthday=>"29 February 1960",
    :death_date=>"07 June 2013",
    :century=>"20th",
    :link_to_page=>"http://www.thefamouspeople.com/profiles/richard-ramirez-6730.php",
    :most_notorious_for=>
     "An American serial killer, rapist, and burglar dubbed as the “Night Stalker” before his identity was exposed.",
    :trivia=>
     "As a Satanist, he became quite popular among the other followers of the cult, and had several fans who were fascinated with him. One of them, freelance magazine editor Doreen Lioy, fell in love with the killer and married him in California's San Quentin State Prison in October 1996."
    },
   {:name=>"Al Capone",
    :crime_type=>"Organized Crime",
    :birthday=>"17 January 1899",
    :death_date=>"25 January 1947",
    :century=>"20th",
    :link_to_page=>"http://www.thefamouspeople.com/profiles/alphonse-gabriel-capone-626.php",
    :most_notorious_for=>
     "One of the most notorious gangsters of all time. He even donated large amounts money earned through his crime business to charity, however he totally damaged his reputation with the cold-blooded St. Valentine’s Massacre. ",
    :trivia=>
     "His style of wearing the fedora hat has been a popular trend, and is being followed by many till date."
    },
   {:name=>"Richard Kuklinski",
    :crime_type=>"Organized Crime",
    :birthday=>"11 May 1935",
    :death_date=>"05 March 2006",
    :century=>"20th",
    :link_to_page=>"http://www.thefamouspeople.com/profiles/richard-kuklinski-31348.php",
    :most_notorious_for=>
     "He was an American killer who was sentenced for the murder of five people.\nHe was famously given the nickname 'Iceman' for his method of freezing a victim which masked the time of death.",
    :trivia=>
     "The 2012 film 'The Iceman' was based on Anthony Bruno's book 'The Iceman: True Story of a Cold-Blooded Killer'. Michael Shannon played the criminal in the movie, Winona Ryder played his wife, and Chris Evans portrayed \"Mr. Softee\"."
    },
   {:name=>"Jesse James",
    :crime_type=>"Robbery",
    :birthday=>"05 September 1847",
    :death_date=>"03 April 1882",
    :century=>"19th",
    :link_to_page=>"http://www.thefamouspeople.com/profiles/jesse-james-3887.php",
    :most_notorious_for=>
     "Legendary bank robber, train robber and a gang leader from the 19th century America.",
    :trivia=>
     "His mother Zerelda Samuel wrote a book dedicating it to his son, ‘In Loving Memory of my Beloved Son, Murdered by a Traitor and Coward Whose Name is not Worthy to Appear Here.’"
    },
   {:name=>"John Gotti",
    :crime_type=>"Organized Crime",
    :birthday=>"27 October 1940",
    :death_date=>"10 June 2002",
    :century=>"20th",
    :link_to_page=>"http://www.thefamouspeople.com/profiles/john-joseph-gotti-jr-1911.php",
    :most_notorious_for=>
     "American mafia and the head of one of the most powerful American mafia families - Gambino. He was constantly involved with murders, conspiracy to commit murders, loan sharking, heroin dealing, racketeering, obstruction of justice, illegal gambling, committing underground crimes, tax evasion, etc.",
    :trivia=>
     "The American press constantly depicted him as a ruthless mobster and therefore this mafia don used to try and keep a normal public image to play down press and also used to offer coffee to FBI agents sent to handle his case."
    },
   {:name=>"Lucky Luciano",
    :crime_type=>"Organized Crime",
    :birthday=>"11 November 1897",
    :death_date=>"26 January 1962",
    :century=>"20th",
    :link_to_page=>"http://www.thefamouspeople.com/profiles/lucky-luciano-6650.php",
    :most_notorious_for=>
     "Sicilian-born American mobster considered the father of modern Organized Crime in the United States. As the head of the modern Genovese crime family, he played an instrumental role in the development of the National Crime Syndicate in the United States.",
    :trivia=>
     "Aggressive and shrewd, he started his own gang as a teenager and was also a member of the old Five Points Gang. But his interest was not limited to petty crimes; he  also offered protection to Jewish youngsters from Italian and Irish gangs for 10 cents per week."
    },
   {:name=>"John Dillinger",
    :crime_type=>"Organized Crime",
    :birthday=>"22 June 1903",
    :death_date=>"22 July 1934",
    :century=>"20th",
    :link_to_page=>"http://www.thefamouspeople.com/profiles/john-dillinger-6663.php",
    :most_notorious_for=>
     "He was a notorious American gangster who operated what was known as the Terror Gang. His gang was accused of involvement in several major criminal activities including 24 bank robberies. ",
    :trivia=>"Nicknamed \"The Jackrabbit\""
    },
   {:name=>"Hawley Harvey Cripplen",
    :crime_type=>"Murder",
    :birthday=>"11 September 1862",
    :death_date=>"23 November 1910",
    :century=>"19th-20th",
    :link_to_page=>"http://www.thefamouspeople.com/profiles/hawley-harvey-crippen-5438.php",
    :most_notorious_for=>
     "An American homeopath convicted of killing his wife and became the first criminal to be caught with the aid of wireless communication.",
    :trivia=>
     "He told the inspector that his spouse ran away with one of her lovers to Chicago and also that he created this false account of her death in order to avoid all the embarrassment."
    },
   {:name=>"Frank James",
    :crime_type=>"Robbery",
    :birthday=>"10 January 1843",
    :death_date=>"18 February 1915",
    :century=>"19th-20th",
    :link_to_page=>"http://www.thefamouspeople.com/profiles/frank-james-4781.php",
    :most_notorious_for=>
     "An American soldier, guerrilla and outlaw and the older brother of a more famous outlaw.",
    :trivia=>
     "This outlaw declared once, \"If there is ever another war in the country, it will be between capital and labor. I mean between greed and manhood.”"
    },
   {:name=>"Willie Sutton",
    :crime_type=>"Robbery",
    :birthday=>"30 June 1901",
    :death_date=>"02 November 1980",
    :century=>"20th",
    :link_to_page=>"http://www.thefamouspeople.com/profiles/willie-sutton-3413.php",
    :most_notorious_for=>
     "An American bank robber notorious for his prolific criminal career which lasted for forty years. He is estimated to have robbed over 100 banks, stealing around $2 million.",
    :trivia=>
     "He was a master of disguise who often impersonated a postal telegraph messenger, police officer or maintenance man."
    },
   {:name=>"Carlos Marcello",
    :crime_type=>"Organized Crime",
    :birthday=>"06 February 1910",
    :death_date=>"03 March 1993",
    :century=>"20th",
    :link_to_page=>"http://www.thefamouspeople.com/profiles/carlos-marcello-6838.php",
    :most_notorious_for=>
     "An Italian-American crime boss operating in New Orleans region of Louisiana. He was of Sicilian origin and came to the United States of America with his parents when he was just one year old.",
    :trivia=>
     "When President Kennedy was assassinated in 1963, it was believed that he was the man behind it."
    },
   {:name=>"H.H. Holmes",
    :crime_type=>"Murder",
    :birthday=>"16 May 1861",
    :death_date=>"1896",
    :century=>"19th",
    :link_to_page=>"http://www.thefamouspeople.com/profiles/h-h-holmes-29982.php",
    :most_notorious_for=>
     "An infamous American serial killer who was active during the last quarter of the 19th century. Often referred to as ‘America’s first serial killer’,he confessed to having committed 27 murders, while different estimates claim that the number could be anything between 20 and 200.",
    :trivia=>
     "The most popular books written on him are: ‘The Devil in the White City; Murder, Magic, and Madness at the Fair that Changed America’ by Erik Larson (2003), ‘The Torture Doctor’ by David Franke (1975), ‘American Gothic’ by Robert Bloch (1974) and ‘Depraved: The Shocking True Story of America’s First Serial Killer’ by Harold Schechter (1994) among others."
    },
   {:name=>"Larry Hoover",
    :crime_type=>"Organized Crime",
    :birthday=>"25 December 1950",
    :death_date=>"n/a",
    :century=>"20th",
    :link_to_page=>"http://www.thefamouspeople.com/profiles/larry-hoover-31351.php",
    :most_notorious_for=>
     "Founder and former leader of a Chicago street gang, Black Gangster Disciple Nation, now known as Gangster Disciples.",
    :trivia=>"He is considered Chicago’s biggest gangster since Al Capone."
    },
   {:name=>"Charles Manson",
    :crime_type=>"Murder",
    :birthday=>"12 November 1934",
    :death_date=>"n/a",
    :century=>"20th",
    :link_to_page=>"http://www.thefamouspeople.com/profiles/charles-manson-3419.php",
    :most_notorious_for=>
     "He is the founder of a hippie group involved in several high profile murder cases like Hinman murder case, murder of film actress Sharon Tate and supermarket executive Leno LaBianca",
    :trivia=>
     "As the son of a prostitute, he became involved with a number of burglary cases when he was very young."
    },
   {:name=>"Paul Castellano",
    :crime_type=>"Organized Crime",
    :birthday=>"26 June 1915",
    :death_date=>"16 November 1985",
    :century=>"20th",
    :link_to_page=>"http://www.thefamouspeople.com/profiles/paul-castellano-3396.php",
    :most_notorious_for=>
     "Popularly known as ‘The Howard Hughes of the Mob’, ‘The Pope’ and ‘The Chicken Man’, he was the head of the Gambino crime family which used to operate mafia activities in New York City.",
    :trivia=>
     "This infamous person constructed a 17-room mansion in New York. Resembling the White House in Washington, D.C., this house consisted of an Olympic size swimming pool."
   },
   {:name=>"William M. Tweed",
    :crime_type=>"Crooked Politics",
    :birthday=>"03 April 1823",
    :death_date=>"12 April 1878",
    :century=>"19th",
    :link_to_page=>"http://www.thefamouspeople.com/profiles/william-m-tweed-6658.php",
    :most_notorious_for=>
     "A seedy character very deeply involved in political corruption. An alderman’s committee in 1877 estimated that he stole between $25 million and $45 million from New York City taxpayers though according to later estimates, he might have stolen as much as $200 million.",
    :trivia=>
     "He was the boss of Tammany Hall, the Democratic Party political machine that played a major role in the politics of 19th century New York City and State."
    },
   {:name=>"Aldrich Ames",
    :crime_type=>"Espionage",
    :birthday=>"26 May 1941",
    :death_date=>"n/a",
    :century=>"20th",
    :link_to_page=>"https://www.fbi.gov/history/famous-cases/aldrich-ames",
    :most_notorious_for=>
     "At the time of his arrest, he was a 31-year veteran of the Central Intelligence Agency (CIA), who had been spying for the Russians since 1985.",
    :trivia=>
     "He was portrayed by American actor Joseph DiMartino in the television program Mysteries at the Museum which chronicled his story and the infamous mailbox used as a signal."
    },
   {:name=>"Alvin \"Creepy\" Karpis",
    :crime_type=>"Robbery",
    :birthday=>"August 10, 1907",
    :death_date=>"August 26, 1979",
    :century=>"20th",
    :link_to_page=>"https://www.fbi.gov/history/famous-cases/barker-karpis-gang",
    :most_notorious_for=>
     "Robbed banks and trains and engineered two major kidnappings of rich business executives in the 1930s.",
    :trivia=>
     "A Depression-era gangster nicknamed \"Creepy\" for his sinister smile and called \"Ray\" by his gang members"
    },
   {:name=>"Giacomo Casanova",
    :crime_type=>"Espionage",
    :birthday=>"1725",
    :death_date=>"1798",
    :century=>"18th",
    :link_to_page=>"https://en.wikipedia.org/wiki/Giacomo_Casanova",
    :most_notorious_for=>
     "Between the years of 1774 and 1782, he worked as a spy for the Venetian Inquisitors of State. It is not known what his role involved as his famous diary ended the year he began his work. In 1782 he was exiled from Venice for spreading libel against one of the City patricians.",
    :trivia=>"After exile, he became a librarian!"
    },
   {:name=>"Klaus Fuchs",
    :crime_type=>"Espionage",
    :birthday=>"1911",
    :death_date=>"1988",
    :century=>"19th",
    :link_to_page=>"https://en.wikipedia.org/wiki/Klaus_Fuchs",
    :most_notorious_for=>
     "He was a German theoretical physicist and atomic spy who, in 1950, was convicted of supplying information from the American, British, and Canadian Manhattan Project to the Soviet Union during and shortly after the Second World War. ",
    :trivia=>
     "At some point he was appointed deputy director of the Institute for Nuclear Research in Rossendorf, where he served until he retired."
    },
   {:name=>"Major John Andre",
    :crime_type=>"Espionage",
    :birthday=>"1750",
    :death_date=>"1780",
    :century=>"18th",
    :link_to_page=>"https://en.wikipedia.org/wiki/John_Andr%C3%A9",
    :most_notorious_for=>
     "He was placed in charge of the British Secret Intelligence. By the next year (1780) he had begun to plot with American General Benedict Arnold, who commanded West Point.",
    :trivia=>"He was put on trial before a board of senior officers, and then hanged."
    },
   {:name=>"Nathan Hale",
    :crime_type=>"Espionage",
    :birthday=>"1755",
    :death_date=>"1776",
    :century=>"18th",
    :link_to_page=>"https://en.wikipedia.org/wiki/Nathan_Hale",
    :most_notorious_for=>
     "He was an American soldier and spy for the Continental Army during the American Revolutionary War.",
    :trivia=>
     "He has long been considered an American hero and, in 1985, he was officially designated the state hero of Connecticut."
    },
   {:name=>"Richard Sorge",
    :crime_type=>"Espionage",
    :birthday=>"1895",
    :death_date=>"1944",
    :century=>"19th",
    :link_to_page=>"https://en.wikipedia.org/wiki/Richard_Sorge",
    :most_notorious_for=>
     "He is considered to have been one of the best Soviet spies in Japan before and during World War II, which has gained him fame among spies, and espionage enthusiasts.",
    :trivia=>"After being fired from a teaching and mining job, he fled to the Soviet Union where he was recruited as a spy for the Russians, and under the cover of being a journalist, was sent to various European countries to assess the possibility of communist uprisings taking place."
    }]


  def self.clear_criminals_table
    Criminal.delete_all
  end

  def self.seed_criminals
    clear_criminals_table
    @@criminal_array.each do |hash|
      # binding.pry
      Criminal.create(
        name: hash[:name],
        crime_type: hash[:crime_type],
        birthday: hash[:birthday],
        deathday: hash[:death_date],
        century: hash[:century],
        criminal_page_url: hash[:link_to_page],
        most_notorious_for: hash[:most_notorious_for],
        trivia: hash[:trivia]
        )

    end
  end


end
