#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"
PSQL_DB="psql --username=freecodecamp --dbname=postgres -t --no-align -c"


# Get username
echo Enter your username:
read USERNAME

# Get user data
USER_INFO=$($PSQL "SELECT games_played, best_game FROM users WHERE username='$USERNAME';")

if [[ -z $USER_INFO ]]
then
  echo "Welcome, $USERNAME! It looks like this is your first time here."
  INSERT_NEW_USER=true
else
  IFS="|" read GAMES_PLAYED BEST_GAME <<< "$USER_INFO"

  if [[ -z $BEST_GAME ]]
  then
    BEST_GAME=0
  fi

  echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."  INSERT_NEW_USER=false
fi

# Generate secret number
SECRET_NUMBER=$(( RANDOM % 1000 + 1 ))
GUESS_COUNT=0

echo "Guess the secret number between 1 and 1000:"

while true
do
  read GUESS

  # Validate integer
  if ! [[ $GUESS =~ ^[0-9]+$ ]]
  then
    echo "That is not an integer, guess again:"
    continue
  fi

  ((GUESS_COUNT++))

  if [[ $GUESS -gt $SECRET_NUMBER ]]
  then
    echo "It's lower than that, guess again:"
  elif [[ $GUESS -lt $SECRET_NUMBER ]]
  then
    echo "It's higher than that, guess again:"
  else
    echo "You guessed it in $GUESS_COUNT tries. The secret number was $SECRET_NUMBER. Nice job!"
    break
  fi
done

# Update database
if [[ $INSERT_NEW_USER == true ]]
then
  $PSQL "INSERT INTO users(username, games_played, best_game)
  VALUES('$USERNAME', 1, $GUESS_COUNT);"
else
  $PSQL "UPDATE users
  SET games_played = games_played + 1,
      best_game = CASE
        WHEN best_game IS NULL OR $GUESS_COUNT < best_game THEN $GUESS_COUNT
        ELSE best_game
      END
  WHERE username='$USERNAME';"
fi
