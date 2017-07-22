
1. Created free profile on Heroku.

2.  Installed heroku CLI (not sure) . Skipped Git 2.8 installation though :-(())
   λ heroku --help
   Usage: heroku COMMAND [--app APP] [command-specific-options]
Help topics, type "heroku help TOPIC" for more details:
  heroku access         # manage user access to apps
  heroku addons         # manage add-ons
  heroku apps           # manage apps
  heroku authorizations # OAuth authorizations
  heroku buildpacks     # manage the buildpacks for an app
  heroku certs          # a topic for the ssl plugin
  heroku ci             # run an application test suite on Heroku
  heroku clients        # OAuth clients on the platform
  heroku config         # manage app config vars
  heroku domains        # manage the domains for an app
  heroku drains         # list all log drains
  heroku features       # manage optional features
  heroku git            # manage local git repository for app
  heroku keys           # manage ssh keys
  heroku labs           # experimental features
  heroku local          # run heroku app locally
  heroku logs           # display recent log output
  heroku maintenance    # manage maintenance mode for an app
  heroku members        # manage organization members
  heroku notifications  # display notifications
  heroku orgs           # manage organizations
  heroku pg             # manage postgresql databases
  heroku pipelines      # manage collections of apps in pipelines
  heroku plugins        # manage plugins
  heroku ps             # manage dynos (dynos, workers)
  heroku redis          # manage heroku redis instances
  heroku regions        # list available regions
  heroku releases       # manage app releases
  heroku run            # run a one-off process inside a Heroku dyno
  heroku sessions       # OAuth sessions
  heroku spaces         # manage heroku private spaces
  heroku status         # status of the Heroku platform
  heroku teams          # manage teams
  heroku update         # update heroku-cli

2. heroku login

Enter your Heroku credentials:
Email: VladV454@gmail.com
Password: ********************
Logged in as vladv454@gmail.com

3. Push public SSH key to Heroku

λ heroku keys:add  "C:\Users\Vlad\.ssh\MrV01id_rsa.pub"
Uploading C:\Users\Vlad\.ssh\MrV01id_rsa.pub SSH key... done

λ heroku keys
=== vladv454@gmail.com keys
ssh-rsa AAAAB3NzaC...VKpwsefw== VladV454@gmail.com

4. Test Heroku keys:

    Run bash, select private key,  run ssh -v git@heroku.com

    λ bash
Agent pid 3792
Agent ssh-agent: 3792 /tmp/ssh-nJO7IRmE0PWV/agent.6944
List of SSH keys (should be empty) : The agent has no identities.
1) MrV01id_rsa      3) v-3-vid_rsa      5) Quit
2) artgotme2id_rsa  4) Kill ssh-agent
Please enter your choice of SSH key to use with GitHub: 1
Adding MrV01id_rsa to access github
Enter passphrase for /c/Users/Vlad/.ssh/MrV01id_rsa:
Identity added: /c/Users/Vlad/.ssh/MrV01id_rsa (/c/Users/Vlad/.ssh/MrV01id_rsa)
List of identities  in the ssh-agent ( should be one)
4096 SHA256:Kvpn0wWVqDScAx5N4z15vVHcxvPAZlBo2KQgn0tC1KQ /c/Users/Vlad/.ssh/MrV01id_rsa (RSA)
Test github connection for the chosen identity
Hi MrV01! You've successfully authenticated, but GitHub does not provide shell access.
Vlad@Vlad-HPlaptop ~/Documents/PROG/HTML5
λ ssh -v git@heroku.com
..........................................
debug1: kex: server->client cipher: aes128-ctr MAC: hmac-sha2-256-etm@openssh.com compression: none
debug1: kex: client->server cipher: aes128-ctr MAC: hmac-sha2-256-etm@openssh.com compression: none
debug1: expecting SSH2_MSG_KEX_ECDH_REPLY
debug1: Server host key: ssh-rsa SHA256:8tF0wX2WquK45aGKs/Bh1dKmBXH08vxUe0VCJJWOA/o
debug1: Host 'heroku.com' is known and matches the RSA host key.
debug1: Found key in /c/Users/Vlad/.ssh/known_hosts:9
Warning: Permanently added the RSA host key for IP address '50.19.85.154' to the list of known hosts.
debug1: rekey after 4294967296 blocks
debug1: SSH2_MSG_NEWKEYS sent
debug1: expecting SSH2_MSG_NEWKEYS
debug1: rekey after 4294967296 blocks
debug1: SSH2_MSG_NEWKEYS received
debug1: SSH2_MSG_SERVICE_ACCEPT received
debug1: Authentications that can continue: publickey
debug1: Next authentication method: publickey
debug1: Offering RSA public key: /c/Users/Vlad/.ssh/MrV01id_rsa
debug1: Server accepts key: pkalg ssh-rsa blen 535
debug1: Authentication succeeded (publickey).
Authenticated to heroku.com ([50.19.85.154]:22).
debug1: channel 0: new [client-session]
debug1: Entering interactive session.
debug1: pledge: network
PTY allocation request failed on channel 0
shell request failed on channel 0

====================================================================
5.  Make heroku - related  modifications in the application.

  - Tell to app (server.js) which listening port will be assigned  by heroku.
  const port = process.env.PORT || 3000; // Heroku  deployment  port or default

  -- Specify start script in the package.json
  "scripts": {
      .. ,
     "start": "node server.js"
   }.

Now we are ready to deply app to Heroku ( and have local/remote  command to start application)
Command:   npm start
Example output:
> node-web-server@1.0.0 start C:\Users\Vlad\Documents\PROG\HTML5\sites\completeNodeJsDeveloperCourse2\node-web-server
> node server.js

Node server.js ExpressJS Server is up on port 3000

6. Save  git add/commit/push
