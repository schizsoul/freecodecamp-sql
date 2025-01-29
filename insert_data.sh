#!/bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.
truncatedb="$($PSQL "TRUNCATE TABLE games, teams")"
# Function to insert a team if it doesn't already exist
insert_team() {
  local team_name=$1
  local get_team=$($PSQL "SELECT team_id FROM teams WHERE name = '$team_name'")

  if [[ -z $get_team ]]; then
    # Team does not exist, insert it
    local insert_team=$($PSQL "INSERT INTO teams (name) VALUES('$team_name')")
    if [[ $insert_team == 'INSERT 0 1' ]]; then
      echo "INSERT TEAM MESSAGE: $team_name inserted"
    else
      echo "INSERT TEAM MESSAGE: Error inserting $team_name"
    fi
  else
    echo "INSERT TEAM MESSAGE: $team_name already exists"
  fi
}

# Function to retrieve a team's ID
get_team_id() {
  local team_name=$1
  echo $($PSQL "SELECT team_id FROM teams WHERE name='$team_name'")
}

# Function to insert a game record
insert_game() {
  local year=$1
  local round=$2
  local winner_id=$3
  local opponent_id=$4
  local winner_goals=$5
  local opponent_goals=$6

  local insert_result=$($PSQL "INSERT INTO games (year, round, winner_id, opponent_id, winner_goals, opponent_goals) VALUES($year, '$round', $winner_id, $opponent_id, $winner_goals, $opponent_goals)")

  if [[ $insert_result == 'INSERT 0 1' ]]; then
    echo "INSERT GAME MESSAGE: Inserted game: $year | $round | Winner ID: $winner_id | Opponent ID: $opponent_id | Score: $winner_goals-$opponent_goals"
  else
    echo "INSERT GAME MESSAGE: Error inserting game: $year, $round"
  fi
}

# Function to process the CSV file
process_games_file() {
  while IFS=',' read -r year round winner opponent winnerg oppg; do
    # Skip the header row
    if [[ $winner != 'winner' && $opponent != 'opponent' && $year != 'year' && $round != 'round' && $winnerg != 'winner_goals' && $oppg != 'opponent_goals' ]]; then
      # Insert teams if they don't exist
      insert_team "$winner"
      insert_team "$opponent"

      # Get team IDs
      winner_id=$(get_team_id "$winner")
      opponent_id=$(get_team_id "$opponent")

      # Insert game record
      insert_game "$year" "$round" "$winner_id" "$opponent_id" "$winnerg" "$oppg"
    fi
  done < games.csv
}

# Run the function
process_games_file





seedetails="$($PSQL "select COUNT(*) from teams")"
echo -e $seedetails
