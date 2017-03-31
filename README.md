# Welcome to FIND THE RAT!



## Game Play

Mutant rats are taking over NYC! They're taking the form of notorious criminals and being tracked through 311 calls as they appear in various locations throughout the city. You are a special agent hired to catch these rats before they commit unspeakable crimes!

## Installation

1. Fork this repository
2. Clone to your local directory
3. In your terminal, navigate to this directory and run "bundle install"
4. Run "rake db:migrate"
5. Run "rake db:seed"
6. Run "ruby bin/run.rb"
7. Catch the mutant rats!

## Under the Hood

Find the Rat uses a API from Open NYC to get realtime rat sighting data. This API is updated daily through various complaints made by citizens of New York via 311.

The game also uses a database compiled by the makers manually of 28 historical criminals with information from [http://www.thefamouspeople.com/](The Famous People), [www.all-that-is-interesting.com/famous-spies](All That Is Interesting), and [www.wikipedia.com](Wikipedia).

#### Created by Naz Khan and Meryl Dakin, 2017, Flatiron School
