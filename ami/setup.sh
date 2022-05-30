yum update  
export PATH=$PATH:/usr/local/bin
# Install the following packages:   

echo "Install git"
yum install -y git
echo "Install Python3"
yum install -y python3
echo "Install pip3"
yum install -y python3-pip
sleep 20

# echo "Install postgresql-client"
# yum install -y postgresql-client

mkdir /src
rm -r /src
git clone --branch feature/cicd https://github.com/Er-sumit/github_automation_django-001.git /src

#pip3 install -r /src/requirements.txt

# write SUPER_SECRET in /src/src/config.py
echo $APP_SECRET >> /src/django-project/mysite/testvars
echo $PACKER_BUILDER_AWS_REGION >> /src/django-project/mysite/testvars
echo $VARS >> /src/django-project/mysite/testvars
echo "SECRET_KEY=${APP_SECRET}" >> /src/django-project/mysite/.env
echo "NEW_SECRETVARS=${NEW_SECRET}${VARS}" >> /src/django-project/mysite/testvars
echo "NEW_SECRET=${NEW_SECRET}" >> /src/django-project/mysite/testvars
echo "GITHUB_BRANCH=${GITHUB_BRANCH}" >> /src/django-project/mysite/testvars

# #Django migrations
# cd /src/django-project
# python3 /src/django-project/manage.py makemigrations
# python3 /src/django-project/manage.py migrate
