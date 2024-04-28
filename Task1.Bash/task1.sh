#!/bin/bash

FILE="task1.log"
FIRST_ARG=$1
SECOND_ARG=$2

function create_log_file {
  touch  $FILE
  echo "Log file available"
}

function make_users_dirs {
  USERS=$(cut -f 1 -d: /etc/passwd)

  ROOT_DIR=""
  if [ -n "$FIRST_ARG" ] && [ "$FIRST_ARG" == "-d" ]; then
    if [ -d "$SECOND_ARG" ]; then
      ROOT_DIR="$SECOND_ARG"
    else
      echo "The path to the root directory is incorrect. Please try again"
      exit 1
    fi
  else
    echo "Please enter the path to the root directory"
    read ROOT_DIR
    if [ ! -d $ROOT_DIR ]; then
      echo "The path to the root directory is incorrect. Please try again"
    fi
  fi

  for user in $USERS
  do
    mkdir "$ROOT_DIR/$user"
    sudo chown  $user "$ROOT_DIR/$user"
    sudo chmod 755 "$ROOT_DIR/$user"
  done
}

create_log_file 2>&1 | tee --append $FILE
make_users_dirs 2>&1 | tee --append $FILE
