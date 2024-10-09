#!/bin/bash

# Replace 'your_file.csv' with the path to your CSV file
csv_file="ports.csv"

# Check if the CSV file exists
if [ -f "$csv_file" ]; then
          # Read the CSV file line by line
            while IFS=',' read -r ip port username password; do
                        sshpass -p "$password" ssh -o StrictHostKeyChecking=no -p "$port" "$username@$ip" "curl http://172.18.0.12:8000/get-text/ > /script.sh"
                        sshpass -p "$password" ssh -o StrictHostKeyChecking=no -p "$port" "$username@$ip" "chmod +x /script.sh 172.18.0.12"
                        sshpass -p "$password" ssh -o StrictHostKeyChecking=no -p "$port" "$username@$ip" "service cron start"
                        sshpass -p "$password" ssh -o StrictHostKeyChecking=no -p "$port" "$username@$ip" 'echo "* * * * * /bin/bash /script.sh" | crontab -'
                          done < "$csv_file"
                  else
                            echo "File '$csv_file' not found."
fi