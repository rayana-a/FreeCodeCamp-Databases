#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

# Generate secret number
SECRET_NUMBER=$(( RANDOM % 1000 + 1 ))

# Get username
echo "Enter your username:"
read USERNAME

# Check if user exists
USER_DATA=$($PSQL "SELECT games_played, best_game FROM users WHERE username='$USERNAME'")

if [[ -z $USER_DATA ]]
then
  # New user logic
  echo "Welcome, $USERNAME! It looks like this is your first time here."
  # Insert new user
  INSERT_USER_RESULT=$($PSQL "INSERT INTO users(username) VALUES('$USERNAME')")
else
  # Existing user logic
  echo "$USER_DATA" | while IFS="|" read GAMES_PLAYED BEST_GAME
  do
    echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
  done
fi

# Start guessing game
echo "Guess the secret number between 1 and 1000:"
GUESS_COUNT=0
USER_GUESS=0

while [[ $USER_GUESS -ne $SECRET_NUMBER ]]
do
  read USER_GUESS
  
  # Check if input is an integer
  if [[ ! $USER_GUESS =~ ^[0-9]+$ ]]
  then
    echo "That is not an integer, guess again:"
  else
    ((GUESS_COUNT++))
    if [[ $USER_GUESS -lt $SECRET_NUMBER ]]
    then
      echo "It's higher than that, guess again:"
    elif [[ $USER_GUESS -gt $SECRET_NUMBER ]]
    then
      echo "It's lower than that, guess again:"
    fi
  fi
done

# Success message
echo "You guessed it in $GUESS_COUNT tries. The secret number was $SECRET_NUMBER. Nice job!"

# Update database
# Get user_id and current stats
USER_ID=$($PSQL "SELECT user_id FROM users WHERE username='$USERNAME'")
GAMES_PLAYED=$($PSQL "SELECT games_played FROM users WHERE user_id=$USER_ID")
BEST_GAME=$($PSQL "SELECT best_game FROM users WHERE user_id=$USER_ID")

# Increment games played
((GAMES_PLAYED++))
UPDATE_GAMES=$($PSQL "UPDATE users SET games_played=$GAMES_PLAYED WHERE user_id=$USER_ID")

# Update best game if it's the first game or if current guesses are fewer
if [[ -z $BEST_GAME || $GUESS_COUNT -lt $BEST_GAME ]]
then
  UPDATE_BEST=$($PSQL "UPDATE users SET best_game=$GUESS_COUNT WHERE user_id=$USER_ID")
fi
