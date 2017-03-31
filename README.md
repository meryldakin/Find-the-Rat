# Welcome to FIND THE RAT!



## Game Play

Mutant rats are taking over NYC! They're taking the form of notorious criminals and being tracked through 311 calls as they appear in various locations throughout the city. You are a special agent hired to catch these rats before they commit unspeakable crimes!

## Installation

1. Clone this repo to your local directory
2. Put terminal to full screen for maximum game-play
3. In your terminal, navigate to this directory and run "bundle install"
4. Run "rake db:migrate"
5. Run "rake db:seed"
6. Run "ruby bin/run.rb"
7. Catch the mutant rats!

## Under the Hood

Find the Rat uses a API from [NYC Open Data](https://data.cityofnewyork.us/Social-Services/Rat-Sightings/3q43-55fe/data) to get realtime rat sighting data. This API is updated daily through various complaints made by citizens of New York via 311.

The game also uses a database compiled by the makers manually of 28 historical criminals with information from [The Famous People](http://www.thefamouspeople.com/), [All That Is Interesting](www.all-that-is-interesting.com/famous-spies), and [Wikipedia](www.wikipedia.com).

#### Created by Naz Khan and Meryl Dakin, 2017, Flatiron School
