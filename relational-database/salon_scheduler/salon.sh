#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=salon -t -c"
function MAIN_MENU {
  GET_SERVICES=$($PSQL "SELECT * FROM services");
  echo "$GET_SERVICES" | while read SERVICE_ID BAR NAME
  do
    echo "$SERVICE_ID) $NAME"
  done

  echo -e "\nSelect service:"
  read SERVICE_ID_SELECTED
  GET_SERVICE=$($PSQL "SELECT * FROM services WHERE service_id=$SERVICE_ID_SELECTED")
  if [[ -z $GET_SERVICE ]]
  then
    MAIN_MENU
  else
    echo -e "\nEnter phone number:"
    read CUSTOMER_PHONE
    CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'")
    if [[ -z $CUSTOMER_ID ]]
    then
      echo -e "\nCustomer not found, please enter your name:"
      read CUSTOMER_NAME
      INSERT_CUSTOMER_RESULT=$($PSQL "INSERT INTO customers(phone,name) VALUES('$CUSTOMER_PHONE','$CUSTOMER_NAME')")
      CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'")
    fi
    
    echo -e "\nEnter a time for your appointment:"
    read SERVICE_TIME
    INSERT_APPOINTMENT_RESULT=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES($CUSTOMER_ID, $SERVICE_ID_SELECTED, '$SERVICE_TIME')")

    SERVICE_NAME=$($PSQL "SELECT services.name FROM appointments INNER JOIN customers USING(customer_id) INNER JOIN services USING(service_id) WHERE service_id=$SERVICE_ID_SELECTED AND customer_id=$CUSTOMER_ID and time='$SERVICE_TIME'")
    CUSTOMER_NAME=$($PSQL "SELECT customers.name FROM appointments INNER JOIN customers USING(customer_id) INNER JOIN services USING(service_id) WHERE service_id=$SERVICE_ID_SELECTED AND customer_id=$CUSTOMER_ID and time='$SERVICE_TIME'")
    echo "I have put you down for a $(echo $SERVICE_NAME | sed -E 's/^ *| *$//') at $SERVICE_TIME, $(echo $CUSTOMER_NAME | sed -E 's/^ *| *$//')."
  fi
}

MAIN_MENU