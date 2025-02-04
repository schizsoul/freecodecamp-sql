#!/bin/bash
PSQL="psql -X --username=freecodecamp --dbname=periodic_table --tuples-only -c"

PROCESS_RESULT() {
  if [[ -z $1 ]]
  then
    echo I could not find that element in the database.
  else
    # The element with atomic number 1 is Hydrogen (H). It's a nonmetal,
    # with a mass of 1.008 amu. Hydrogen has a melting point of -259.1 celsius
    # and a boiling point of -252.9 celsius.
    echo "$1" | while read AMU BAR NAME BAR SYM BAR TYPE BAR AMM BAR MPC BAR BPC
      do
        echo "The element with atomic number $AMU is $NAME ($SYM). It's a $TYPE, with a mass of $AMM amu. $NAME has a melting point of $MPC celsius and a boiling point of $BPC celsius."
      done
  fi
}

EVALUATE_ARG() {
  if [[ $1 =~ ^[A-Z][a-z]?$ ]]
  then
  #  echo You entered an element symbol.
    SYMBOL_RESULT=$($PSQL "SELECT atomic_number, name, symbol, type, atomic_mass, melting_point_celsius, boiling_point_celsius FROM elements INNER JOIN properties USING(atomic_number) RIGHT JOIN types USING(type_id) WHERE symbol = '$1';")
    PROCESS_RESULT "$SYMBOL_RESULT"
  elif [[ $1 =~ ^[0-9][0-9]?[0-9]?$ && $1 != 0 ]]
  then
  #  echo You entered an atomic number.
    ATOMIC_NUM_RESULT=$($PSQL "SELECT atomic_number, name, symbol, type, atomic_mass, melting_point_celsius, boiling_point_celsius FROM elements INNER JOIN properties USING(atomic_number) RIGHT JOIN types USING(type_id) WHERE atomic_number = $1;")
    PROCESS_RESULT "$ATOMIC_NUM_RESULT"
  elif [[ $1 =~ ^[A-Za-z]{3,}$ ]]
  then
  #  echo You entered an element name.
   NAME_RESULT=$($PSQL "SELECT atomic_number, name, symbol, type, atomic_mass, melting_point_celsius, boiling_point_celsius FROM elements INNER JOIN properties USING(atomic_number) RIGHT JOIN types USING(type_id) WHERE name = '$1';")
    PROCESS_RESULT "$NAME_RESULT"
  else
    echo I could not find that element in the database.
    exit 1
  fi
}

if [[ -z $1 ]]
then
  echo Please provide an element as an argument.
else
  EVALUATE_ARG "$1"
fi


