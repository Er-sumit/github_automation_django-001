yum update -y
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
echo $APP_SECRET >> /testvarsasdfa
echo $PACKER_BUILDER_AWS_REGION >> /testvarsasdfa
echo $VARS >> /testvarsasdfa
echo "SECRET_KEY=${APP_SECRET}" >> /.envasdfa
echo "NEW_SECRETVARS=${NEW_SECRET}${VARS}" >> /testvarsasdfa
echo "NEW_SECRET=${NEW_SECRET}" >> /testvarsasdfa
echo "GITHUB_BRANCH=${GITHUB_BRANCH}" >> /testvarsasdfa

# #Django migrations
# cd /src/django-project
# python3 /src/django-project/manage.py makemigrations
# python3 /src/django-project/manage.py migrate
