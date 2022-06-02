sleep 30
sudo yum update -y
git clone --branch feature/cicd https://github.com/Er-sumit/github_automation_django-001.git /src
me=`whoami`
sudo chown -Rf $me /src
sudo yum install python3-pip -y

echo "installing git"
sudo yum install git -y

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

sudo chown -Rf ec2-user newproject/
# script to create unique id for app secret key
echo 'import uuid' > /tmp/generate_secret.py
echo 'print(uuid.uuid4())' >> /tmp/generate_secret.py
secret_key=`python3 /tmp/generate_secret.py`
echo "SECRET_KEY='$secret_key'" >> /src/newproject/newproject/.env
echo $APP_SECRET >> /src/newproject/newproject/.env