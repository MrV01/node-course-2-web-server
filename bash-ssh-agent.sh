#
# Auto-launching ssh-agent on Git for Windows
### Usage:  source bash-ssh-agent.sh
###  Heavily modified  https://help.github.com/articles/working-with-ssh-key-passphrases/
###
###  ssh-agent  variables names
### SSH_AUTH_SOCK
### SSH_AGENT_PID
### INFO from docs.
## ssh-agent -s  Generate Bourne shell commands on stdout.
## ssh-agent -k  Kill the current agent (given by the SSH_AGENT_PID environment variable).
##
resetSSH-agent() {
            # agent_run_state: 0=agent running w/ key; 1=agent w/o key; 2= agent not running
            agent_run_state=$(ssh-add -l >| /dev/null 2>&1; echo $?)
            if [ ! "$SSH_AUTH_SOCK" ] || [ "$agent_run_state" = 2 ]; then
                  ### Start new ssh-agent, nothing is running in "$SSH_AGENT_PID", nobody clean
                  eval  "$(ssh-agent -s )"
            elif [ "$SSH_AUTH_SOCK" ] && [ "$agent_run_state" = 0 ];
            then
                  ### Delete all identities from  running  ssh-agent
                  ssh-add -D
            fi
}

### Watch the environment variables  SSH_AUTH_SOCK, SSH_AGENT_PID
statusSSH-agent() {
  echo "Agent ssh-agent: $SSH_AGENT_PID $SSH_AUTH_SOCK"
  echo "SSH keys in ssh-agent : $(ssh-add -l)"
}

generateSshKeyPair() {
  echo "Generating new SSH RSA key pair ..."
  read -p "Enter KeyPair name :"  keyName
  read -p "Enter Email :" emailName
  keyName=$HOME/.ssh/${keyName}
  read -p  "New KeyPair ${keyName}  E-mail ${emailName} (y/n) [y] : " yesno
  echo "${yesno}: ${keyName}  ${emailName}"
  if [ "$yesno" = "" ] || [ "$yesno" = "y" ]; then
      ssh-keygen -f ${keyName} -t rsa -b 4096 -C "${emailName}"
  fi
}

### Test SSH key Pair to GitHub
githubTest() {
    echo "Test github connection for the ssh-agent key pair"
    ssh -T git@github.com
}

###   resetSSH-agent  ### !!!!  commented out to  keep already loaded key  active
statusSSH-agent

### Now select  which private key to use with the agent , and add it  in.
### Menu of SSH public keys.
### https://askubuntu.com/questions/1705/how-can-i-create-a-select-menu-in-a-shell-script
###
PS3='Please choose SSH key to use with ssh-agent  OR ssh-agent control : '
options=("MrV01id_rsa" "artgotme2id_rsa" "v-3-vid_rsa" "ssh-agent Status" "ssh-agent Reset" "ssh-agent Kill" "Generate SSH key Pair " "GitHubTest"  "Quit")
select opt in "${options[@]}"
do
    case $opt in
        "MrV01id_rsa")
        echo "Adding $opt to ssh-agent"
        resetSSH-agent
         ssh-add  ~/.ssh/$opt
        ;;
         "v-3-vid_rsa")
         echo "Adding $opt to ssh-agent"
         resetSSH-agent
          ssh-add  ~/.ssh/$opt
         ;;
         "artgotme2id_rsa")
           echo "Adding $opt to ssh-agent"
           resetSSH-agent
            ssh-add  ~/.ssh/$opt
        ;;
        "ssh-agent Status")
            statusSSH-agent
        ;;
        "ssh-agent Reset")
            resetSSH-agent
         ;;
        "ssh-agent Kill")
            echo "Killing ssh-agent"
            ssh-agent -k
        ;;
        "Generate SSH key Pair ")
          generateSshKeyPair
        ;;
        "GitHubTest")
          echo "Testing SSH connection to GitHub"
          githubTest
        ;;
        "Quit")
            break
        ;;
        *) echo invalid option;;
    esac
done

statusSSH-agent
