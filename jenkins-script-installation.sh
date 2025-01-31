vdsmv dsv dcs.v nd;ak v , ddv/"Dvd\

dxac;kvndk;pvnv
dcsv /,ck;vl ncx;volkda
dxakc nvdxlcb vdsuc v
then 
    echo "Jenkins is install"
    exit 1
    else

case $OS in
Ubuntu)
     sudo apt update
sudo apt search openjdk
sudo apt install openjdk-11-jdk -y
java -version
ufw allow 8080/tcp   2& > /dev/null 
wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo apt-key add -
sudo sh -c 'echo deb https://pkg.jenkins.io/debian-stable binary/ > \
    /etc/apt/sources.list.d/jenkins.list'
sudo apt-get update -y
sudo apt-get install jenkins -y
systemctl start jenkins 
systemctl enable jenkins

;;

CentOS) 
  
sudo wget -O /etc/yum.repos.d/jenkins.repo \
    https://pkg.jenkins.io/redhat-stable/jenkins.repo
sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key
sudo yum upgrade -y
sudo yum install jenkins java-11-openjdk-devel -y
sudo systemctl daemon-reload
systemctl start jenkins 
systemctl enable jenkins
firewall-cmd --permanent --add-port=8080/tcp   2& > /dev/null 
firewall-cmd --reload 2& > /dev/null

;;


Amazon)
  
sudo wget -O /etc/yum.repos.d/jenkins.repo \
    https://pkg.jenkins.io/redhat-stable/jenkins.repo
sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key
sudo yum upgrade -y
sudo yum install jenkins java-1.8.0 -y
sudo systemctl daemon-reload
systemctl start jenkins 
systemctl enable jenkins
firewall-cmd --permanent --add-port=8080/tcp   2& > /dev/null   
firewall-cmd --reload 2& > /dev/null

;;

*)
   echo "your operating system is UNKNOWN"
   exit 1
   ;;
esac 

fi
