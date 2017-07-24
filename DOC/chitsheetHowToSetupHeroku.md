
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

6. Save  git status/add/commit/push

  -  git status
  -  git add -A
  -   git commit -m "Setup start script and heroku port"
  -   git push  # Can be just push, because "remote origin master" has been set earlier in the course.
    Example of the "push" output:
    remote: Resolving deltas: 100% (3/3), completed with 3 local objects.
      To github.com:MrV01/node-course-2-web-server.git
      eb91afa..f0762d6  master -> master

  7.   Create heroku application and add new remote "heroku" to the current git repository.
    bash command:      heroku create
    Example output:

    ✔ ~/Documents/PROG/HTML5/sites/completeNodeJsDeveloperCourse2/node-web-server [master|✚ 1]
23:35 $ heroku create
heroku-cli: Updating to 6.12.17-aa05cb0... 11.1 MB/11.1 MB
Creating app... done, tranquil-basin-54519
https://tranquil-basin-54519.herokuapp.com/ | https://git.heroku.com/tranquil-basin-54519.git
✔ ~/Documents/PROG/HTML5/sites/completeNodeJsDeveloperCourse2/node-web-server [master|✚ 1]
23:37 $  

8. Push  git repository to brand  remote "heroku"

  Command:  git push heroku

  Example output:
23:43 $ git push heroku
Counting objects: 32, done.
Delta compression using up to 4 threads.
Compressing objects: 100% (30/30), done.
Writing objects: 100% (32/32), 14.30 KiB | 0 bytes/s, done.
Total 32 (delta 11), reused 0 (delta 0)
remote: Compressing source files... done.
remote: Building source:
remote:
remote: -----> Node.js app detected
remote:
remote: -----> Creating runtime environment
remote:
remote:        NPM_CONFIG_LOGLEVEL=error
remote:        NPM_CONFIG_PRODUCTION=true
remote:        NODE_VERBOSE=false
remote:        NODE_ENV=production
remote:        NODE_MODULES_CACHE=true
remote:
remote: -----> Installing binaries
remote:        engines.node (package.json):  unspecified
remote:        engines.npm (package.json):   unspecified (use default)
remote:
remote:        Resolving node version 6.x via semver.io...
remote:        Downloading and installing node 6.11.1...
remote:        Detected package-lock.json: defaulting npm to version 5.x.x
remote:        Resolving npm version 5.x.x via semver.io...
remote:        Downloading and installing npm 5.3.0 (replacing version 3.10.10)...
remote:
remote: -----> Restoring cache
remote:        Skipping cache restore (new-signature)
remote:
remote: -----> Building dependencies
remote:        Installing node modules (package.json)
remote:        added 69 packages in 3.406s
remote:
remote: -----> Caching build
remote:        Clearing previous node cache
remote:        Saving 2 cacheDirectories (default):
remote:        - node_modules
remote:        - bower_components (nothing to cache)
remote:
remote: -----> Build succeeded!
remote: -----> Discovering process types
remote:        Procfile declares types     -> (none)
remote:        Default types for buildpack -> web
remote:
remote: -----> Compressing...
remote:        Done: 16.8M
remote: -----> Launching...
remote:        Released v3
remote:        https://tranquil-basin-54519.herokuapp.com/ deployed to Heroku
remote:
remote: Verifying deploy... done.
To https://git.heroku.com/tranquil-basin-54519.git
* [new branch]      master -> master
✔ ~/Documents/PROG/HTML5/sites/completeNodeJsDeveloperCourse2/node-web-server [master|✚ 1]
23:44 $

9. We've got  Heroku - generated  URL https://git.heroku.com/tranquil-basin-54519.git
 for our application running/deployed on Heroku. Now open the application in the browser.

Command:      heroku open

Example of the output:
23:44 $ heroku open
✔ ~/Documents/PROG/HTML5/sites/completeNodeJsDeveloperCourse2/node-web-server [master|✚ 1]
23:47 $
