#!/bin/bash
start=2
end=5
network="172.18.0."

# Create a CSV file for the results
echo "IP,Port,Username,Password" > successful_logins.csv

# Loop to test IPs within the specified range
for ((i=$start; i<=$end; i++)); do
          ip=$network$i
            echo "Testing IP: $ip"

              # Loop through a list of ports to test
                for port in 22 2222; do
                            # Test if the IP and port are reachable using nc
                                if nc -z -w 1 $ip $port; then
                                              echo "Port $port on IP $ip is open, testing SSH login..."
                                                    # Loop through usernames and passwords and attempt SSH login
                                                          while IFS=, read -r username password; do
                                                                          # Use sshpass and ssh to attempt login
                                                                                  if sshpass -p $password ssh -o StrictHostKeyChecking=no -p $port $username@$ip "exit" > /dev/null 2>&1; then
                                                                                                    echo "Successful SSH login on IP $ip, Port $port with Username: $username, Password: $password"
                                                                                                              echo "$ip,$port,$username,$password" >> successful_logins.csv
                                                                                                                      fi
                                                                                                                            done < credentials.csv
                                                                                                                               fi

  done
                                                                                                                         done

