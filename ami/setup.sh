yum update  
export PATH=$PATH:/usr/local/bin
# Install the following packages:   

echo "Install git"
yum install -y git
echo "Install Python3"
yum install -y python3
echo "Install pip3"
yum install -y python3-pip

echo "Install postgresql-client"
yum install -y postgresql-client

mkdir /src
rm -r /src
git clone --branch feature/cicd https://github.com/Er-sumit/github_automation_django-001.git /src

pip3 install -r /src/requirements.txt

# write SUPER_SECRET in /src/src/config.py
echo $SUPER_SECRET >> /src/django-project/mysite/.env
echo $PACKER_BUILDER_AWS_REGION >> /src/django-project/mysite/.env
echo $VARS >> /src/django-project/mysite/.env




