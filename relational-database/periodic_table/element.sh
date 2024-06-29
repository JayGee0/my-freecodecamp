#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"
if [ -z $1 ]
then
  echo "Please provide an element as an argument."
else
  ATOMIC_NUMBER=""
  if [[ $1 =~ ^[0-9]+$ ]]
  then
    ATOMIC_NUMBER_LOOKUP=$($PSQL "SELECT * FROM elements WHERE atomic_number=$1")
    if [ ! -z $ATOMIC_NUMBER_LOOKUP ]
    then
      ATOMIC_NUMBER=$1
    fi
  else
    SYMBOL_LOOKUP=$($PSQL "SELECT atomic_number FROM elements WHERE symbol='$1'")
    if [ ! -z $SYMBOL_LOOKUP ]
    then
      ATOMIC_NUMBER=$SYMBOL_LOOKUP
    else
      NAME_LOOKUP=$($PSQL "SELECT atomic_number FROM elements WHERE name='$1'")
      if [ ! -z $NAME_LOOKUP ]
      then
        ATOMIC_NUMBER=$NAME_LOOKUP
      fi
    fi
  fi


  if [ -z $ATOMIC_NUMBER ]
  then
    echo "I could not find that element in the database."
  else
    echo "$($PSQL "SELECT name,symbol,atomic_mass,melting_point_celsius,boiling_point_celsius,type FROM elements FULL JOIN properties USING(atomic_number) FULL JOIN types USING(type_id) WHERE atomic_number=$ATOMIC_NUMBER")" | while IFS='|' read NAME SYMBOL MASS MELTING BOILING TYPE
    do
      echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $MASS amu. $NAME has a melting point of $MELTING celsius and a boiling point of $BOILING celsius." 

    done
  fi

fi




