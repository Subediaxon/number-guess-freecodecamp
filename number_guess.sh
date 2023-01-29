#!/bin/bash
PSQL="psql -X --username=freecodecamp --dbname=number_guess --no-align --tuples-only -c"

#GENERATIN RANDOM NUMBER
RANDOM_NUM=$((RANDOM % 1000))
echo "RANDOM: $RANDOM_NUM"

#Asking for a username
echo "Enter your username:"
read NAME_ENTERED

function RANDOM_GUESSER(){
  
  #TAKING USER INPUT FOR RANDOM NUMBER
  echo -e "\nGuess the secret number between 1 and 1000:"
  read USER_GUESS
  
  COUNT=0
  while [ $USER_GUESS -ne $RANDOM_NUM ]
  do
    if [ $USER_GUESS -lt $RANDOM_NUM ]; then
      echo -e "\nIt's higher than that, guess again:"
    else
      echo -e "\nIt's lower than that, guess again:"
    fi
    ((COUNT++))
    read USER_GUESS
  done
  
  echo -e "\nYou guessed it in $COUNT tries. The secret number was $RANDOM_NUM. Nice job!"
  INSERT_SCORES=$($PSQL "INSERT INTO scores(username, scores) VALUES('$NAME_ENTERED', $COUNT)")
}

#Checking if that username exists
USERNAME_FETCHED=$($PSQL "SELECT username, games_played, best_game FROM games WHERE username='$NAME_ENTERED'")

if [[ -z $USERNAME_FETCHED ]]
then
  echo -e  "\nWelcome, $USERNAME ! It looks like this is your first time here.\n"
  
else
  echo $USERNAME_FETCHED | while read USERNAME GAMES_PLAYED BEST_GAME 
  do
    echo -e "\nWelcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took BEST_GAME guesses.\n"
  done 
fi

RANDOM_GUESSER


