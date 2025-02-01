#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=salon -t -c"

echo -e "\n~~~~ Welcome to Strand & Dand Rough Cuts ~~~~\n"

MAIN_MENU() {
  while true; do
    if [[ -z $1 ]]; then
      echo -e "Select the service you desire:\n"
    else
      echo -e "$1\n"
    fi

    # Display available services
    SERVICES_RESULT=$($PSQL "SELECT service_id, name FROM services ORDER BY service_id;")
    echo "$SERVICES_RESULT" | while read -r SERVICE_ID BAR SERVICE_NAME; do
      echo "$SERVICE_ID) $SERVICE_NAME"
    done

    echo -e "\nPress '0' to exit the salon."
    
    # Read and sanitize input
    read SERVICE_ID_SELECTED
    SERVICE_ID_SELECTED=$(echo "$SERVICE_ID_SELECTED" | sed 's/[^0-9]//g')  # Remove non-numeric characters

    if [[ "$SERVICE_ID_SELECTED" == "0" ]]; then
      echo -e "\nThank you for visiting. Goodbye!"
      exit 0
    fi

    # Validate selection
    SERVICE_OFFERED=$($PSQL "SELECT name FROM services WHERE service_id=$SERVICE_ID_SELECTED" | xargs)  # Trim whitespace

    if [[ -z "$SERVICE_OFFERED" ]]; then
      echo -e "\nInvalid selection. Please enter a valid service number."
    else
      echo -e "\nThank you for choosing: $SERVICE_OFFERED."
      ADD_APPOINTMENT "$SERVICE_ID_SELECTED"
      break
    fi
  done
}

ADD_CUSTOMER() {
  echo "What's your name:"
  read CUSTOMER_NAME 
  NEW_CUSTOMER=$($PSQL "INSERT INTO customers(phone, name) values('$1', '$CUSTOMER_NAME')")
}

ADD_APPOINTMENT() {
  SERVICE_NAME=$($PSQL "SELECT name FROM services WHERE service_id=$1" | xargs | sed 's/.*/\L&/')
  echo "What's your phone number?"
  read CUSTOMER_PHONE
  FETCH_CUSTOMER=$($PSQL "SELECT name, customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'")
  if [[ -z $FETCH_CUSTOMER ]]
  then
    ADD_CUSTOMER "$CUSTOMER_PHONE"
  fi
  FETCH_CUSTOMER=$($PSQL "SELECT name, customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'")
  read -r CUSTOMER_NAME BAR CUSTOMER_ID <<< "$FETCH_CUSTOMER"
  echo "At what time would you be coming in, $CUSTOMER_NAME?"
  read SERVICE_TIME
  INSERT_APPOINTMENT=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES($CUSTOMER_ID, $SERVICE_ID_SELECTED, '$SERVICE_TIME')")
  echo -e "\nI have put you down for a $SERVICE_NAME at $SERVICE_TIME, $CUSTOMER_NAME."
}

MAIN_MENU
