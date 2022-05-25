yum update  
echo "Install git"
yum install -y git
echo "Install Python3"
yum install -y python3
echo "Install pip3"
yum install -y python3-pip

echo "Install postgresql-client"
yum install -y postgresql-client

mkdir /src
git clone --branch feature/cicd https://github.com/Er-sumit/github_automation_django-001.git /src/src

pip3 install -r /src/src/requirements.txt





