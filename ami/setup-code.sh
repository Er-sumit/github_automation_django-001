sudo yum update -y
git clone --branch feature/cicd https://github.com/Er-sumit/github_automation_django-001.git /src
me=`whoami`
sudo chown -Rf $me /src
sudo yum install python3-pip -y
#pip3 install --upgrade pip
pip3 install -r /tmp/requirements.txt
cd /src
django-admin startproject newproject
cd /src/newproject
python3 manage.py makemigrations
python3 manage.py migrate

echo $APP_SECRET >> /src/newproject/newproject/.env