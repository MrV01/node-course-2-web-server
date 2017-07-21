#
# Auto-launching ssh-agent on Git for Windows
# Heavily modified  https://help.github.com/articles/working-with-ssh-key-passphrases/
#
###  ssh-agent  variables names
### SSH_AUTH_SOCK
### SSH_AGENT_PID
            ### INFO from docs.
            ## ssh-agent -s  Generate Bourne shell commands on stdout.
            ## ssh-agent -k  Kill the current agent (given by the SSH_AGENT_PID environment variable).
            ##
            # agent_run_state: 0=agent running w/ key; 1=agent w/o key; 2= agent not running
            agent_run_state=$(ssh-add -l >| /dev/null 2>&1; echo $?)
            if [ ! "$SSH_AUTH_SOCK" ] || [ "$agent_run_state" = 2 ]; then
                  ### Start new ssh-agent, nothing is running in "$SSH_AGENT_PID", nobody clean
                  eval  "$(ssh-agent -s )"
            elif [ "$SSH_AUTH_SOCK" ] && [ "$agent_run_state" = 0 ]; then
                  ### Delete all identities from  running  ssh-agent
                  ssh-add -D
            fi
### Watch the environment variables  SSH_AUTH_SOCK, SSH_AGENT_PID
echo "Agent ssh-agent: $SSH_AGENT_PID $SSH_AUTH_SOCK"
echo "List of SSH keys (should be empty) : $(ssh-add -l)"
### Now select  which private key to use with the agent , and add it  in.
### Menu of SSH public keys.
### https://askubuntu.com/questions/1705/how-can-i-create-a-select-menu-in-a-shell-script
###
PS3='Please enter your choice of SSH key to use with GitHub: '
options=("MrV01id_rsa" "artgotme2id_rsa" "v-3-vid_rsa" "Kill ssh-agent" "Quit")
select opt in "${options[@]}"
do
    case $opt in
        "MrV01id_rsa")
            echo "Adding MrV01id_rsa to access github"
            ssh-add  ~/.ssh/$opt
            break
            ;;
        "artgotme2id_rsa")
            echo "Adding artgotme2id_rsa to access github"
            ssh-add  ~/.ssh/$opt
            break
            ;;
        "v-3-vid_rsa")
            echo "Adding v-3-vid_rsa to access github"
            ssh-add  ~/.ssh/$opt
            break
            ;;
        "Kill ssh-agent")
            echo "Killing ssh-agent"
            ssh-agent -k
            break
            ;;
        "Quit")
            break
            ;;
        *) echo invalid option;;
    esac
done

echo "List of identities  in the ssh-agent ( should be one)"
ssh-add -l
echo "Test github connection for the chosen identity"
ssh -T git@github.com
