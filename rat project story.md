- Rat sightings in (each borough) all time --> spits out a list of boroughs and their sightings
- Most recent sighting
- How many rat sightings have occured in my area in the last 7 days?


- RAT SIGHTINGS TABLE
id | created_date | location_type | address location | lat | long | borough

- USER TABLE
ID | name | borough


****
Each user is a detective, we assign them an "agent name" at random when they sign up.
They tag rats and enter details about the casefile.

Objective:
- Based on the boroguh, choose form the sightings a random
sighting. They have to figure out the sightings

We randomly choose a sighting in the last 7 days. They have to figure out which sighting is the mastermind rat. They figure it out by

We give them a list of "suspects" - a row of data, a rat name is assigned to each row. \


Name generator: http://www.rubydoc.info/gems/random_name_generator/1.0.2

GAME FLOW

1. Welcome message
2. Assign a detective name
3. Give a scenario - a rat has appeared, rat has pseudonym, it gives timestamp and location of rat appearance
4. Gives a list of 7 suspects which are randomly generated from the table of the FBI most infamous
5. Gives one clue: Crime Type
6. User makes a guess from the names of "suspects" - rows from the FBI table
7. Either user wins or name is eliminated from the list and gives the user second clue: Dead or Alive
8. 3rd clue: Birthday
9. 4th clue: Crime location
10. User picks and wins or loses
11. Shows information about criminal & hotline to report rats


*** Need to use ASCII Rat somewhere in the CLI


3.28.17:
Next steps:
- Finish criminal database

- Keep writing CLI for game play
