keepalive
=========
Keepalive is a *very* simple bash script that executes a process and respawns
it if it exits.

```sh
$ KEEP_LOG=my.log keepalive /bin/my-service --options foo
```

Signals
-------
Keepalive recognizes the following signals:

 * `HUP`: reopen log files
 * `TERM`: send TERM to process group (terminates service)

Change Log
----------
 * `1.1.0`: log support and reopen log on HUP
 * `1.0.1`: kill launched process on TERM
 * `1.0.0`: initial release
