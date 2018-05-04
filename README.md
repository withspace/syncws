# syncws

A command line util to live-sync your local directory to remote server

## Installation

1. Make sure you have the following utils installed: `git`, `rsync`, `fswatch`.
1. Add execution permissions to the script file: `chmod +x ./syncws.sh`
1. Copy `syncws.sh` to your path directory, for example `cp ./syncws.sh /usr/local/bin/syncws`

## Usage

Prerequisites:

- Make sure your working directory is a Git repository (the tool uses `.gitignore` file to determine which files should be synced).
- Make sure you have set up SSH keys to the remote server, so that you can login via SSH without a password (see the instruction [here](https://www.digitalocean.com/community/tutorials/how-to-set-up-ssh-keys--2)).

Usage: 

```bash
syncws [user]@[host-or-ip]:[remote-dir]
```

Example:

```bash
syncws user@127.0.0.1:/tmp/mydir
```

The content of your current working directory (except files excluded in `.gitignore` file) will be synced to the directory on provided host.
