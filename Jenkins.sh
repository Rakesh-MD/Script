#! /bin/bash

sudo apt update
sudo apt install openjdk-11-jre -y
curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key | sudo tee \
  /usr/share/keyrings/jenkins-keyring.asc > /dev/null
echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] \
  https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
  /etc/apt/sources.list.d/jenkins.list > /dev/null

sudo apt-get update
sudo apt install -y maven
sudo apt-get install jenkins -y
sudo systemctl enable jenkins
sudo systemctl start jenkins
# sudo systemctl status jenkins

# Check Jenkins service status
jenkins_status=$(sudo systemctl status jenkins)

# Check if the service is active
if [[ $jenkins_status =~ "Active: active" ]]; then
    echo "Jenkins is active."
else
    echo "Jenkins is not active. Check the status:"
    echo "$jenkins_status"
fi

# Display initial admin password
echo "Wait for a moment.......!"
echo "Initial admin Password :"
echo "------------------------"
sudo cat /var/lib/jenkins/secrets/initialAdminPassword

echo "Successfully Installed Jenkins...!!!"
echo "To Access Jenkins--->  http://<your-server-ip>:8080   "