# Use the latest version of Ubuntu
FROM ubuntu:latest

# Update apt and install necessary packages
RUN apt-get update && \
    apt-get install -y openssh-server net-tools iputils-ping nmap

# Set up SSH
RUN mkdir /var/run/sshd

# Allow root login
RUN echo 'root123:root123' | chpasswd
RUN sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config

# SSH login fix. Otherwise user is kicked off after login
RUN sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd

ENV NOTVISIBLE "in users profile"
RUN echo "export VISIBLE=now" >> /etc/profile

# Start SSH service
CMD ["/usr/sbin/sshd", "-D"]
