# ec2manager
EC2 manager plugin for oh-my-zsh
## Instaltion
### For [oh-my-zsh](https://ohmyz.sh/ "Oh My Zsh") user
Checkout and install.

    cd ${ZSH_CUSTOM1:-$ZSH/custom}/plugins
    git clone https://github.com/tomcatzh/ec2manager

### Setup the enviroment
Create the server_list file in ${HOME}/.aws/, see the [server_list.sample](https://github.com/tomcatzh/ec2manager/blob/master/server_list.sample "Sample server list file") file.

    # Put this file to ${HOME}/.aws/server_list
    # Name  Region   Username    Instance-ID
    foobar  us-east-1   ec2-user    i-xxxxxxxxxxxxx

Use SSMSuUser.json to create the session type document for AWS SSM Session Manager. The document name should be "SSMSuUser". Every region you want to connect to should have this document. AWS CLI example:

    aws ssm create-document --content SSMSuUser.json --name "SSMSuUser" --document-type "Session" 

## Usage
Use conn command to connect the EC2 server by name, for example:

    conn foobar

Your can also use auto compiltion to help you enter the server names.
