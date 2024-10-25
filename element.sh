#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"

if [[ -z $1 ]]; then
  echo "Please provide an element as an argument."
else
  # Determina si el argumento es un número
  if [[ $1 =~ ^[0-9]+$ ]]; then
    DATA=$($PSQL "SELECT atomic_number, symbol, name, atomic_mass, melting_point_celsius, boiling_point_celsius, type FROM elements INNER JOIN properties USING(atomic_number) INNER JOIN types USING(type_id) WHERE atomic_number = $1")
  else
    # Si no es un número, busca por símbolo o nombre
    DATA=$($PSQL "SELECT atomic_number, symbol, name, atomic_mass, melting_point_celsius, boiling_point_celsius, type FROM elements INNER JOIN properties USING(atomic_number) INNER JOIN types USING(type_id) WHERE symbol = INITCAP('$1') OR name = INITCAP('$1')")
  fi

  # Si no se encuentra el elemento
  if [[ -z $DATA ]]; then
    echo "I could not find that element in the database."
  else
    # Muestra la información del elemento
    echo "$DATA" | while IFS="|" read atomic_number symbol name atomic_mass melting_point_celsius boiling_point_celsius type; do
      echo "The element with atomic number $atomic_number is $name ($symbol). It's a $type, with a mass of $atomic_mass amu. $name has a melting point of $melting_point_celsius celsius and a boiling point of $boiling_point_celsius celsius."
    done
  fi
fi
