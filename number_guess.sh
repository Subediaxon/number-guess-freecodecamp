#!/bin/bash
PSQL="psql -X --username=freecodecamp --dbname=number_guess --no-align --tuples-only -c"

#MAIN FUNCTION
function MAIN_FUNCTION(){

  #Asking for a username
  echo "Enter your username:" 
  read INPUT_NAME

  #GENERATIN RANDOM NUMBER
  SECRET_NUMBER=$((RANDOM % 1000))

  #Checking if name is less than 22 characters and not empty
  if [[ -z $INPUT_NAME ]];then
    echo -e "\nName cannot be empty. \n!!! TRY AGAIN !!!\n\n"
    MAIN_FUNCTION

  elif [[ $INPUT_NAME =~ ^[A-Za-z0-9]{1,22}$ ]];then
    #Checking if that username exists
    USER_FETCHED=$($PSQL "SELECT games_played, best_game, user_id FROM games WHERE username='$INPUT_NAME'")

    if [[ -z $USER_FETCHED ]]
    then
      echo "Welcome, $INPUT_NAME! It looks like this is your first time here."
      INSERT_GAMES=$($PSQL "INSERT INTO games(username) VALUES('$INPUT_NAME')")
      USER_ID=$($PSQL "SELECT user_id FROM games WHERE username='$INPUT_NAME'")
      
      #TAKING USER INPUT FOR RANDOM NUMBER
      echo "Guess the secret number between 1 and 1000: " 
      read USER_GUESS
      
      #calling the required function and inserting value in database
      if RANDOM_GUESSER $USER_GUESS;then
        INSERT_FUNC 0 $USER_ID
      fi
      
    else
        USER_ID=$($PSQL "SELECT user_id FROM games WHERE username='$INPUT_NAME'")
        GAMES_PLAYED=$($PSQL "SELECT games_played FROM games WHERE username='$INPUT_NAME'")
        BEST_GAME=$($PSQL "SELECT best_game FROM games WHERE username='$INPUT_NAME'")
      
        echo "Welcome back, $INPUT_NAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
        
        #TAKING USER INPUT FOR RANDOM NUMBER
        echo "Guess the secret number between 1 and 1000: " 
        read USER_GUESS
        
        #Calling the required function and inserting value in database
        if RANDOM_GUESSER $USER_GUESS;then
          INSERT_FUNC $GAMES_PLAYED $USER_ID
        fi        
    fi
  else
    echo -e "\nName Cannot be longer than 22 characters. \n !!! TRY AGAIN !!! \n\n"
    MAIN_FUNCTION
  fi
}

#function to guess the number
function RANDOM_GUESSER(){
    
  if [[ $USER_GUESS  =~ ^[0-9]+$ ]];then
    COUNT=1
    while [ $USER_GUESS -ne $SECRET_NUMBER ]
    do
      if [ $USER_GUESS -lt $SECRET_NUMBER ]; then
        echo -e "It's higher than that, guess again: "
      else
        echo -e "It's lower than that, guess again: "
      fi
      ((COUNT++))
      read USER_GUESS
    done
    
    echo -e "You guessed it in $COUNT tries. The secret number was $SECRET_NUMBER. Nice job!\n\n"
  else
    echo "That is not an integer, guess again:"
  fi
}

#Function to insert value into scores table
function INSERT_FUNC(){

  INSERT_GAMES_PLAYED=$($PSQL "UPDATE games SET games_played=games_played + 1 WHERE user_id=$2")
  INSERT_SCORES=$($PSQL "INSERT INTO scores(user_id, score) VALUES($2, $COUNT)")

  if [[ $INSERT_SCORES == "INSERT 0 1" ]];then  

    #UPDATE BEST GAME if new score is less than previous ones  
    BEST_GAME_AGAIN=$($PSQL "SELECT best_game FROM games WHERE user_id=$2")
    if [[ $COUNT -lt BEST_GAME_AGAIN ]];then
      BEST_GAME_NEW_UPDATE=$($PSQL "UPDATE games SET best_game=$COUNT WHERE user_id=$2 ")
    fi

  else
    echo "Something went wrong please try again"
  fi

}


#PROGRAM BEGINS HERE
MAIN_FUNCTION 