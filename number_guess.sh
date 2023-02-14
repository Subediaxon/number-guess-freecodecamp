#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

#GENERATING RANDOM NUMBER
SECRET=$((RANDOM % 1000))

echo -e "\nEnter your username: " 
read USERNAME

USER_CHECK=$($PSQL "SELECT games_played, best_game FROM scores WHERE username='$USERNAME'")
GAMES_PLAYED=$($PSQL "SELECT games_played FROM scores WHERE username='$USERNAME'")
BEST_GAME=$($PSQL "SELECT best_game FROM scores WHERE username='$USERNAME'")
  
if [[ -z $USER_CHECK ]]
then
  #ADDING NEW USERNAME
  INSERT_NEW_USERNAME=$($PSQL "INSERT INTO scores(username) VALUES('$USERNAME')")
  echo -e "\nWelcome, $USERNAME! It looks like this is your first time here."
else  
  echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
fi

echo -e "\nGuess the secret number between 1 and 1000:"
read GUESS

#function FIND_NUMBER(){
  if [[ $GUESS =~ ^[0-9]+ ]];then
    COUNT=1
    while [ $GUESS -ne $SECRET ]
    do 
      if [[ $GUESS -lt $SECRET ]]; then
        echo -e "\nIt's higher than that, guess again:"
      else 
        echo -e "\nIt's lower than that, guess again:"
      fi
      COUNT=$((COUNT+1))
      read GUESS
    done

    #INSERT INTO games table     
    INSERT_INTO_GAMES=$($PSQL "INSERT INTO games(username,score) VALUES('$USERNAME', $COUNT)");

    #SCORES TABLE UPDATE
    UPDATE_SCORE=$($PSQL "UPDATE scores SET games_played = games_played + 1 WHERE username='$USERNAME'")
    NEW_BEST_GAME=$($PSQL "SELECT MIN(score) FROM games WHERE username='$USERNAME'")

    UPDATE_BEST=$($PSQL "UPDATE scores SET best_game = $NEW_BEST_GAME WHERE username='$USERNAME'")
        
    echo "You guessed it in $COUNT tries. The secret number was $SECRET. Nice job!"

  else
    echo -e "\nThat is not an integer, guess again:"
  fi
#}

#FIND_NUMBER


