#!/bin/bash

# Get logged-in users
users=$(who)

# Save the system information in a variable
system_info="
System Time: $system_time
Hostname: $hostname
Kernel Version: $kernel
Distribution: $distribution
CPU: $cpu_info
Memory: $memory_info
Disk Space: $disk_info
Uptime: $uptime
Logged-In Users:
$users
"
final='{"data" : "'
enddd='"}'
final="$final $system_info $enddd"
# Write the system information to the output file
echo "$final" > "output_file.txt"

# Display a message to confirm the data has been saved
echo "System information saved to output_file.txt"

curl -X POST http://172.18.0.12:8000/post-text/ -H 'Content-Type: application/json' -d "$final"