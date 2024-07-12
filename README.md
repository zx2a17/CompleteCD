# complte-cd
This repository is the place where I put together a complete CD pipeline (CI later on as well if I can manage)

The plan is as follows

1) use terraform and github action to provision and configure the infrastructure completely
   - this should also include installing the necessary packages that the application need to run
  
2) based on the previous node JS app I have deployed as practice, deploy this application automatically and allow a true end to end CD pipeline

This readme will also contain the steps that I used to set up a fresh repo to do such thing.

as all projects are built on top of previous work we are going to use the HashiCorp demo as we learn the best practice
https://developer.hashicorp.com/terraform/tutorials/automation/github-actions

in short - creating a pull request will perform terraform plan, where merging to main will a terraform apply

but I am going to change it to trigger it with labels

copied across the gitigore file, tfplan and apply yml files, then made changes so those trigger only on labels of PR of "TFplan" and "TFapply"







# nodejs-aws-codedeploy-pipeline

How to set ci/cd for nodejs app with aws codeDeploy and aws codePipeline

<a href="https://www.buymeacoffee.com/scaleupsaas"><img src="https://img.buymeacoffee.com/button-api/?text=Buy me a coffee&emoji=&slug=scaleupsaas&button_colour=BD5FFF&font_colour=ffffff&font_family=Cookie&outline_colour=000000&coffee_colour=FFDD00" /></a>

## Installation instructions

### 1. Launch amazon linux server in aws

### 2. ssh to linux to install packages

```sh
ssh -i <key.pem> ec2-user@<ip-address> -v
```

### 3. Update and Upgrade linux machine and install node, nvm and pm2

```sh
sudo yum update
```

```sh
sudo yum upgrade
```

```sh
sudo yum install -y git htop wget
```

#### 3.1 install node

To **install** or **update** nvm, you should run the [install script][2]. To do that, you may either download and run the script manually, or use the following cURL or Wget command:
```sh
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
```
Or
```sh
wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
```

Running either of the above commands downloads a script and runs it. The script clones the nvm repository to `~/.nvm`, and attempts to add the source lines from the snippet below to the correct profile file (`~/.bash_profile`, `~/.zshrc`, `~/.profile`, or `~/.bashrc`).

#### 3.2 Copy & Past (each line separately)
<a id="profile_snippet"></a>
```sh
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
```

#### 3.3 Verify that nvm has been installed

```sh
nvm --version
```

#### 3.4 Install node

```sh
nvm install --lts # Latest stable node js server version
```

#### 3.5 Check nodejs installed
```sh
node --version
```

#### 3.6 Check npm installed
```sh
npm -v
```

### 4. Clone nodejs-aws-codedeploy-pipeline repository

```sh
cd /home/ec2-user
```

```sh
git clone https://github.com/zx2a17/complete-cd.git
```

### 5. Run node app.js  (Make sure everything working)

```sh
cd nodejs-aws-codedeploy-pipeline
```

```sh
npm install
```

```sh
node app.js
```

### 6. Install pm2
```sh
npm install -g pm2 # may require sudo
```

### 7. Set node, pm2 and npm available to root

```sh
sudo ln -s "$(which node)" /sbin/node
```
```sh
sudo ln -s "$(which npm)" /sbin/npm
```
```sh
sudo ln -s "$(which pm2)" /sbin/pm2
```

### 8 Starting the app as sudo (Run nodejs in background and when server restart)
```sh
sudo pm2 start app.js --name=nodejs-express-app
```
```sh
sudo pm2 save     # saves the running processes
                  # if not saved, pm2 will forget
                  # the running apps on next boot
```

#### 8.1 IMPORTANT: If you want pm2 to start on system boot
```sh
sudo pm2 startup # starts pm2 on computer boot
```

### 9. Install aws code deploy agent 
```sh
sudo yum install -y ruby 
```

```sh
wget https://aws-codedeploy-us-east-1.s3.us-east-1.amazonaws.com/latest/install
```

```sh
chmod +x ./install
```
```sh
sudo ./install auto
```
```sh
sudo service codedeploy-agent start
```

### 10. Continue in AWS console...

Watch the rest of the youtube video...
https://www.youtube.com/watch?v=cxTg29ze1D0&t=1043s&ab_channel=Scale-UpSaaS


