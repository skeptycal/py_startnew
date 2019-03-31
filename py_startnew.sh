#!/usr/bin/env bash
project_summary='
NAME
    py_startnew - initialize setup for new python project

SYNOPSIS
    py_startnew [OPTION]... [SOURCE] [-t=TARGET]

DESCRIPTION
     Initialize the setup for a new Python project in the TARGET directory
      using the SOURCE configuration file    written in JSON format. If no
      TARGET is specified    the current directory is attempted. If no
      SOURCE is given    py_startnew looks for the default configuration
      file (py_startnew.json) in the TARGET directory and in the system
      PATH.

    SOURCE  
        (JSON format) If no SOURCE is given py_startnew looks for the default
        configuration file (py_startnew.json) in the TARGET directory and
        then in the system PATH. If no file is located a choice is given
        to either enter interactive mode or quit.

    TARGET  Main project directory. Root directory for GIT repository and other
        features. If the project must be relocated in the future run the
        script <py_move_project.py> to take care of logistics. If no
        TARGET is provided the current directory is used.

    OPTIONS     
        -h  Help ... provide operational information (this screen)
        -v  Version ... the current version of the program
        -c  Check


    Mandatory  arguments  to  long  options are mandatory for short options
    too.
'
###############################################################################
# Initialization

# Interesting text colors ...
    MAIN='\x1B[38;5;229m'
    WARN='\x1B[38;5;203m'
    BLUE='\x1B[38;5;38m'
    ATTN='\X1B[38;5;178m'
    GREEN='\X1B[38;5;28m'

###############################################################################
# Design Steps (list found in design.md)

# Set version 0.0.1
version='0.0.1'
# Get SOURCE (interactive only for testing)
SOURCE=''
# Get TARGET (current only for testing)
TARGET=$(pwd)
# Create AUTHORS file ... format: Name <email> (url)
AUTHORS="Michael Treanor <skeptycal@gmail.com> (https://www.github.com/skeptycal)"
echo $AUTHORS >$TARGET/AUTHORS

# Create .gitignore from https://www.gitignore.io
gitignore='https://www.gitignore.io/api/c,r,go,qt,web,vue,gis,vim,gpg,lua,osx,node,perl,lamp,rust,java,hugo,hexo,test,text,venv,data,cuda,ruby,latex,pydev,batch,emacs,perl6,vuejs,flask,csharp,python,django,jekyll,dropbox,android,database,assembler,dotfilessh,virtualenv,powershell,dotsettings,pycharm+all,sublimetext,apachehadoop,visualstudio,androidstudio,microsoftoffice,jupyternotebook,jupyternotebooks,visualstudiocode'

curl -akjfo "$TARGET/.gitignore" $gitignore

# Setup GIT repo
git init
curl -u 'USER' https://api.github.com/user/repos -d '{"name":"REPO"}'

# Install npm and gulp-cli
brew install node
npm install --global gulp-cli

# Setup npm
npm config ls -l >.npmrc
npm init -y

# Setup Gulp
npm install gulp -D
npx -p touch nodetouch gulpfile.js
gulp --version

# Setup Travis CI - .travis.yml
# Setup GitHub repo ; keep variable
# Setup GIT submodule as needed ; keep variable
# Add requirements_dev.txt
requirements_dev="-r requirements.txt\ncoverage\nipdbipython\nflake8\nmock\npytest"

# Create README.md
#

###############################################################################
# start_py_project.sh
#
# Usage: start_py_project.sh [start_py_project.json] [OPTIONS]
#
# Parameters:
#
#   optional [start.json] file; if no name is given
#   setup is interactive
#
# @author    Michael Treanor  <skeptycal@gmail.com>
# @copyright 2019 (c) Michael Treanor
# @license   MIT <https://opensource.org/licenses/MIT>
# @link      http://www.github.com/skeptycal
#
###############################################################################
#
# References
#
# Compatible Command Line Options (POSIX):
# http://pubs.opengroup.org/onlinepubs/9699919799/functions/getopt.html
#
###############################################################################
#
# 34567890123456789012345678901234567890123456789012345678901234567890123456789
#
# .gitignore Setup
#

# Created by https://www.gitignore.io/api/c,r,go,qt,web,vue,gis,vim,gpg,lua,osx,node,perl,lamp,rust,java,hugo,hexo,test,text,venv,data,cuda,ruby,latex,pydev,batch,emacs,perl6,vuejs,flask,csharp,python,django,jekyll,dropbox,android,database,assembler,dotfilessh,virtualenv,powershell,dotsettings,pycharm+all,sublimetext,apachehadoop,visualstudio,androidstudio,microsoftoffice,jupyternotebook,jupyternotebooks,visualstudiocode
# Edit at https://www.gitignore.io/?templates=c,r,go,qt,web,vue,gis,vim,gpg,lua,osx,node,perl,lamp,rust,java,hugo,hexo,test,text,venv,data,cuda,ruby,latex,pydev,batch,emacs,perl6,vuejs,flask,csharp,python,django,jekyll,dropbox,android,database,assembler,dotfilessh,virtualenv,powershell,dotsettings,pycharm+all,sublimetext,apachehadoop,visualstudio,androidstudio,microsoftoffice,jupyternotebook,jupyternotebooks,visualstudiocode

'CURL EXIT CODES

There  are  a bunch of different error codes and their corresponding error
messages that may appear during bad conditions. At the time of this  writ-
ing
#   the exit codes are:

1      Unsupported  protocol.  This  build of curl has no support for this
    protocol.

2      Failed to initialize.

3      URL malformed. The syntax was not correct.

4      A feature or option that was needed to perform the desired  request
    was  not  enabled or was explicitly disabled at build-time. To make
    curl able to do this
#   you probably need another build of libcurl!

5      Couldn't resolve proxy. The given proxy host could not be resolved.

6 Couldn't resolve host. The given remote host was not resolved.

7      Failed to connect to host.

8      Weird server reply. The server sent data curl couldn't parse.

9 FTP access denied. The server denied login or denied access to the
particular resource or directory you wanted to reach. Most often
you tried to change to a directory that doesn't exist on the
    server.

10     FTP accept failed. While waiting for the  server  to  connect  back
    when an active FTP session is used
#   an error code was sent over the
    control connection or similar.
'
