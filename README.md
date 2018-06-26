hosted on a debian server
`install.sh` installed the server


## Add a jenkins deployment user
On the boxes that jenkins will be deploying to, create a deployment user 
with ssh login

```bash
sudo useradd -m jenkins-deployer
cd /home/jenkins-deployer
sudo su /home/jenkins-deployer
    mkdir .ssh
    chmod 700 .ssh  
    ssh-keygen -t rsa -N "" -f ~/.ssh/id_rsa
    cp .ssh/id_rsa.pub .ssh/authorized_keys
    chmod 600 .ssh/authorized_keys
    
    cat ~/.ssh/id_rsa

```