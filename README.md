hosted on a debian server
`install.sh` installed the server
## setup ufw firewall
https://www.digitalocean.com/community/tutorials/how-to-set-up-a-firewall-with-ufw-on-ubuntu-14-04
https://www.digitalocean.com/community/tutorials/ufw-essentials-common-firewall-rules-and-commands
Enable UFW
Copy user.rules.backup into `/etc/ufw/user.rules`
run `ufw reload`

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


The last line outputs an ssh key e.g.

 ```
-----BEGIN RSA PRIVATE KEY-----
...
...
...
-----END RSA PRIVATE KEY-----

```
Copy the key into the jenkins configuration section:

[jenkins configuration -> publish over ssh  -> key ](https://aletheia-infrastructure.org/configure#section72)

Fill in the other deployment details as per [ssh plugin docs](https://wiki.jenkins.io/display/JENKINS/Publish+Over+SSH+Plugin)

and click "Test Configuration", this should succeed.

