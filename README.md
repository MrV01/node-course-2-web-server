
1. λ npm install express@4.15.3 --save

2. λ nodemon server.js

3. http://localhost:3000

4. HandlebarsJS  vie engine:
    λ npm install hbs@4.0.1 --save

5. Start nodemon , which is watching additional extentions of files  .js AND  .hbs AND html:
  λ nodemon server.js -e js,hbs,html  

6. Git  . Adding Version Control  to the project.

6.1.  λ git init
Initialized empty Git repository in C:/Users/Vlad/Documents/PROG/HTML5/sites/completeNodeJsDeveloperCourse2/node-web-server/.git/

C:\Users\Vlad\Documents\PROG\HTML5\sites\completeNodeJsDeveloperCourse2\node-web-server (master) (node-web-server@1.0.0)

6.2.  λ git status
On branch master

Initial commit

Untracked files:
  (use "git add <file>..." to include in what will be committed)

        README.md
        node_modules/
        package-lock.json
        package.json
        public/
        server.js
        server.log
        views/

nothing added to commit but untracked files present (use "git add" to track)

6.3. Create .gitignore file and
        git add files

6.4. git commit -m "Initial commit"

λ git commit -m "Initial commit"
[master (root-commit) 8910ae5] Initial commit
11 files changed, 751 insertions(+)
create mode 100644 .gitignore
create mode 100644 README.md
create mode 100644 package-lock.json
create mode 100644 package.json
create mode 100644 public/help.html
create mode 100644 server.js
create mode 100644 views/about.hbs
create mode 100644 views/home.hbs
create mode 100644 views/maintenance.hbs
create mode 100644 views/partials/footer.hbs
create mode 100644 views/partials/header.hbs

7.  GitHub amd Heroku application deployment.
