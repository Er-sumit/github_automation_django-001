sleep 30
sudo yum update -y
git clone --branch feature/cicd https://github.com/Er-sumit/github_automation_django-001.git /src
me=`whoami`
sudo chown -Rf $me /src
sudo yum install python3-pip -y
export PATH=$PATH:/usr/local/bin
echo "export PATH=$PATH:/usr/local/bin" >> ~/.bash_profile
sleep 1
source ~/.bash_profile
#pip3 install --upgrade pip
pip3 install -r /tmp/requirements.txt
mkdir -p /src
cd /src
django-admin startproject newproject
cd /src/newproject
python3 manage.py makemigrations
python3 manage.py migrate

echo $APP_SECRET >> /src/newproject/newproject/.env