#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=postgres -t --no-align -c"
echo "Enter your username:"
read USERNAME

NAME_LOOKUP=$($PSQL "SELECT * FROM users WHERE name='$USERNAME'");
if [ -z $NAME_LOOKUP ]
then
  echo "Welcome, $USERNAME! It looks like this is your first time here."
  MAKE_USER=$($PSQL "INSERT INTO users(name) VALUES('$USERNAME')")
else

  GAMES_PLAYED=$($PSQL "SELECT COUNT(*) FROM games JOIN users USING(user_id) WHERE name='$USERNAME'")
  BEST_GAME=$($PSQL "SELECT MIN(guesses) FROM games JOIN users USING(user_id) WHERE name='$USERNAME'")

  echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
fi
USER_ID=$($PSQL "SELECT user_id FROM users WHERE name='$USERNAME'")

RANDOM_NUM=$((1 + $RANDOM % 1000))
echo "Guess the secret number between 1 and 1000:"
GUESSES=0
GUESS=0
while [[ $GUESS -ne $RANDOM_NUM ]]
do
  GUESSES=$(($GUESSES+1))
  read GUESS
  
  if [[ ! $GUESS =~ ^[0-9]+$ ]]
  then
    echo "That is not an integer, guess again:"
  else

    if [[ $GUESS -ne $RANDOM_NUM ]]
    then
      if [[ $GUESS -lt $RANDOM_NUM ]]
      then
        echo "It's higher than that, guess again:"
      else
        echo "It's lower than that, guess again:"
      fi
    fi

  fi
done

echo "You guessed it in $GUESSES tries. The secret number was $RANDOM_NUM. Nice job!"

SAVE_GAME=$($PSQL "INSERT INTO games(user_id, guesses) VALUES($USER_ID, $GUESSES)")