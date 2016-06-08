keepalive
=========
Keepalive is a *very* simple bash script that executes a process and respawns
it if it exits.

```sh
$ keepalive --logfile my.log --user nobody /bin/my-service --options foo
```

Signals
-------
Keepalive recognizes the following signals:

 * `HUP`: reopen log files
 * `TERM`: send TERM to process group (terminates service)

Change Log
----------
 * `1.3.1`: fix issues killing process group
 * `1.3.0`: --user option
 * `1.2.0`: --logfile option
 * `1.1.0`: log support and reopen log on `HUP`
 * `1.0.1`: kill launched process on `TERM`
 * `1.0.0`: initial release
