#!/bin/bash

credentials=("root,root" "admin,admin" "user1,password1" "user2,password2" "admin,123" "admin123,1234" "linux,linux" "root123,123")


for credential in ${credentials[@]}; do
          echo $credential >> credentials.csv
  done
