apt-get update  
echo "Install git"
apt-get install -y git
echo "Install Python3"
apt-get install -y python3
echo "Install pip3"
apt-get install -y python3-pip

echo "Install postgresql-client"
apt-get install -y postgresql-client


git clone --branch feature/cicd https://github.com/Er-sumit/github_automation_django-001.git /feature_src

git clone --branch {{ user `github_branch` }} https://github.com/Er-sumit/github_automation_django-001.git /src

pip3 install -r /feature_src/requirements.txt





