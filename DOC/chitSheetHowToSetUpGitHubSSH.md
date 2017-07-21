
1. run  git bash on Windows.
2. cd to the directory where the project is located.
3. Check  if there any SSH key exists  "ls -al ~/.ssh/"

Example:
00:31 $ ls -al ~/.ssh/
total 51
drwxr-xr-x 1 Vlad 197121    0 Jul  4 17:03 .
drwxr-xr-x 1 Vlad 197121    0 Jul  4 17:03 ..
-rw-r--r-- 1 Vlad 197121  133 Jul 21 00:29 agent.env
-rw-r--r-- 1 Vlad 197121   58 Jul  4 17:03 config
-rw-r--r-- 1 Vlad 197121 1679 May 17 16:08 github_rsa
-rw-r--r-- 1 Vlad 197121  400 May 17 16:08 github_rsa.pub
-rw-r--r-- 1 Vlad 197121 3326 May 12 14:30 id_rsa
-rw-r--r-- 1 Vlad 197121  744 May 12 14:30 id_rsa.pub
-rw-r--r-- 1 Vlad 197121 1852 May 12 16:21 known_hosts
✔ ~/Documents/PROG/HTML5/sites/completeNodeJsDeveloperCourse2/node-web-server [master L|●1]

4.   Generate SSH key pair if nothing there.
  ssh-keygen -t rsa -b 4096 -C 'v3vladimirov@gmail.com'
  password: no passphrase

Example:

00:38 $ ssh-keygen -t rsa -b 4096 -C 'v3vladimirov@gmail.com'
Generating public/private rsa key pair.
Enter file in which to save the key (/c/Users/Vlad/.ssh/id_rsa): /c/Users/Vlad/.ssh/v3vid_rsa
Enter passphrase (empty for no passphrase):
Enter same passphrase again:
Your identification has been saved in /c/Users/Vlad/.ssh/v3vid_rsa.
Your public key has been saved in /c/Users/Vlad/.ssh/v3vid_rsa.pub.
The key fingerprint is:
SHA256:aG4/6Nq+9UKcvcMOxm/YXO9n2VF1aXlmhr72Sx4pSGo v3vladimirov@gmail.com
The key's randomart image is:
+---[RSA 4096]----+
|               .o|
|              .+B|
|             ..++|
|       .      . .|
|      o.So .   ..|
|     o .+ + o o..|
|      oo=E + + =+|
|     o.+=+B   =.*|
|    .+=..=+. ..=.|
+----[SHA256]-----+
✔ ~/Documents/PROG/HTML5/sites/completeNodeJsDeveloperCourse2/node-web-server [master L|●1…1]
00:43 $

5.  Start ssh-agent   .
  eval "$(ssh-agent -s)"

  Example:

  00:43 $   eval "$(ssh-agent -s)"
Agent pid 2032
✔ ~/Documents/PROG/HTML5/sites/completeNodeJsDeveloperCourse2/node-web-server [master L|●1…1]
00:47 $

6.  Tell to ssh-agent where the SSH private key located.  ssh-add ~/.ssh/id_rsa

Example:  (passphrase was: 123456AAA)
00:47 $ ssh-add ~/.ssh/id_rsa
Enter passphrase for /c/Users/Vlad/.ssh/id_rsa:
Identity added: /c/Users/Vlad/.ssh/id_rsa (/c/Users/Vlad/.ssh/id_rsa)
✔ ~/Documents/PROG/HTML5/sites/completeNodeJsDeveloperCourse2/node-web-server [master L|●1…1]

7. Configure GitHub account ( and create if necessary )

   Pull requests -> Click on profile picture -> click on settings -> SSH and GPG keys

   Add Public SSH key with e-mail matching to the GitHub profile list of SSH keys:
   ( here VladV454@gmail.com )
   ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQC/t2TfN00cugQp1oyM9An2IsIQfFdz5ZVh40AsWcKaboXRbfXbcTfwWmeKvoiR3k39VSwfhC6C/aqlkbEGpO12PYRAMzXNd3SkiCU3q+1trMwQzpl2zbjxDR/8T9usUmjYDboz9gqGa3u4i2rThYChugXDd8nu/R2Yukuaz3DkIGmsX7KBZ7eUuh4uB5XMNFnNAyu2KqPy8xv4E9AHJL7/t0I0uEzxUtgAB9FN6QFggmeKU2NHyKqxVhT2jaS6umT08NNWYsHuakisVgbg0txzzuKf0sIf9tMWm+MAJx6hTbieEYATe+q2tuCfvzolUhQ2Q4SUe5NVEeBQsyp8y4IKFyCmnXxZOAOy5HViRe4wv9X3L9/JE8ENO/fwb0o23oX87DH2Qr/cBeUj1d47hWkSsiS5mkneVhRaRrL18E5h1Qj7bNTW+WJB5MCuAdu4w+g8B6W6wO+NK0Wx7KGDcchuHfvTRC/99Hb+kHFGkye4QqxOSo3M7idJcrSm5CqthvLN1Od4I4hw5xT0eWiCJEYGO4X65Oo7OvuqcWOVEQ4zN2v56zMf9ZPA8Uc6Z6ZUw1pSH3tZb6UXF7PoNpcMe+adIlHPw3WhJLzFJ7rb6MsT+vDJaouBdudUesRwd3G59+q7cIAs4Jube/N5NcdMM5oq9zY9bJvSV0nguSVKpwsefw== VladV454@gmail.com

8. Test if connection works:  ssh -T git@github.com

Example:
01:14 $ ssh -T git@github.com
Hi MrV01! You've successfully authenticated, but GitHub does not provide shell access.
✘-1 ~/Documents/PROG/HTML5/sites/completeNodeJsDeveloperCourse2/node-web-server [master L|●1…1]
01:14 $

If you do not see the message "You've successfully authenticated, but GitHub does not provide shell access."   SSH connection works fine.   Now time to create project  repository on GitHub ( step 9)

9. Create GitHub repository for the project. node-course-2-web-serve

- Now push git repository from computer to Git Hub.

git remote add origin git@github.com:MrV01/node-course-2-web-server.git
git push -u origin master


 ( Other option is to create new repository on your computer .  If no code have been created yet.
   echo "# node-course-2-web-server" >> README.md
   git init
   git add README.md
   git commit -m "first commit"
   git remote add origin git@github.com:MrV01/node-course-2-web-server.git
   git push -u origin master
    )

Example:

01:30 $ git remote add origin git@github.com:MrV01/node-course-2-web-server.git
✔ ~/Documents/PROG/HTML5/sites/completeNodeJsDeveloperCourse2/node-web-server [master L|✔]
01:30 $ git push -u origin master
Counting objects: 21, done.
Delta compression using up to 4 threads.
Compressing objects: 100% (19/19), done.
Writing objects: 100% (21/21), 10.20 KiB | 0 bytes/s, done.
Total 21 (delta 5), reused 0 (delta 0)
remote: Resolving deltas: 100% (5/5), done.
To github.com:MrV01/node-course-2-web-server.git
* [new branch]      master -> master
Branch master set up to track remote branch master from origin.
✔ ~/Documents/PROG/HTML5/sites/completeNodeJsDeveloperCourse2/node-web-server [master|✔]
01:30 $
