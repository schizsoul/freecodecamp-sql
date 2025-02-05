#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"
clear
randnum=$(($RANDOM%1000))
tries=0
echo $randnum
echo Enter your username:
read inputuser

create_user() {
  echo -e "\nWelcome, $1! It looks like this is your first time here."
  create_user_result=$($PSQL "INSERT INTO records values('$1', NULL, NULL);")
}

fetch_record() {
  username_result=$($PSQL "SELECT username, games_played, best_game FROM records WHERE username='$1';")
  if [[ -z $username_result ]]
  then
    create_user $1
  else
    echo "$username_result" | while IFS="|" read -r username games_played best_game
    do
      echo -e "Welcome back, $username! You have played $games_played games, and your best game took $best_game guesses."
    done
  fi
}

update_record() {
  fetch_games_best=$($PSQL "SELECT games_played, best_game FROM records where username = '$inputuser';")
  echo "$fetch_games_best" | while IFS="|" read -r games_played best_game
  do
    games_played=$(($games_played+1))
    if [[ $1 > $best_game || -z $best_game ]]
    then
      best_game=$1
    fi
    update_record_result=$($PSQL "UPDATE records SET games_played = $games_played, best_game = $best_game WHERE username = '$inputuser';")
  done 
}

game() {
  if [[ $1 =~ [0-9]+ ]]
  then
    if [[ $1 == $2 ]]
    then
      echo "You guessed it in $tries tries. The secret number was $2. Nice job!"
      update_record $tries
    elif [[ $1 < $2 ]]
    then
      echo "It's higher than that, guess again:"
      read local_guess
      tries=$((tries+1))
      game $local_guess $2
    elif [[ $1 > $2 ]]
    then
      echo "It's lower than that, guess again:"
      read local_guess
      tries=$((tries+1))
      game $local_guess $2
    fi
  else
   echo That is not an integer, guess again:
   read local_guess
   game $local_guess $2
  fi
}

fetch_record $inputuser

echo -e "\nGuess the secret number between 1 and 1000:"
read guess
tries=$((tries+1))
game $guess $randnum