## Setting Up GPG


### For macOS
In the local machine `~/.ssh/config` file, add the config for your remote SSH server, e.g.:

```
Host <remote-alias>
  Hostname <remote-host.domain.com>
  User <username>
  RemoteForward /run/user/<uid>/gnupg/S.gpg-agent /Users/<user>/.gnupg/S.gpg-agent.extra
```

The `/run/user/<uid/gnupg/S.gpg-agent` field is system dependent, if you want to verify what your system's is, on the remote machine run:
```
gpgconf --list-dir agent-socket
```

### Export public key from local machine to remote machine
On the local machine, run the following and replace `<remote-alias>` with your actual alias set up above:
```
gpg --export -a | ssh <remote-alias> 'gpg --import -'
```

### Troubleshooting

Restart the gpg-agent:
```
gpg-connect-agent reloadagent /bye
```

Remove the existing socket on the remote system:
```
rm /run/user/1000/gnupg/S.gpg-agent
```

### More reference:

Refer to https://gist.github.com/TimJDFletcher/85fafd023c81aabfad57454111c1564d
