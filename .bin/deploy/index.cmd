@ECHO off
@chcp 65001

SET dp0=%~dp0
REM https://my-ihq-prf.github.io/pub/resume.AntonyukAndriy.14.12.2021.html

REM https://prf-aa.github.io/pub/resume.AntonyukAndriy.14.12.2021.html

CD /D "%dp0%..\.."

@REM git init

SET repo=git@github.com:andrey-hilux/vscode.extension.usefulPanel.git

git config core.sshCommand "'C:\Windows\System32\OpenSSH\ssh.exe' -i 'C:\Users\TNT\.ssh\id_rsa'"
git config core.autocrlf true

git config user.email "50883513+andrey-hilux@users.noreply.github.com"
git config user.name "andrey-hilux"

git remote set-url origin %repo%

@REM create a temporary branch
git checkout --orphan tmp-main

git rm -r --cached .bkps -f

git add .

git commit -m "main ✨ HOW TO commit"

@REM Rename the current branch to main
git branch -M main

git remote add origin %repo%

@REM Force push main branch to Git server
git push origin main -u -f
git commit --allow-empty -m "Trigger rebuild"

CD /D "%dp0%"

@REM index.cmd