## Veewee OpenBSD box generation ##

Generates a Vagrant VM with OpenBSD.

### Requisites ###

- Ruby 1.9.3.
- [Bundler](http://bundler.io/)

### Building box ###

Execute the `build` script or manually run the commands written in it.

### Running box ###

```shell
vagrant init 'openbsd53'
vagrant up
```

You should be able now to do `vagrant ssh` to access your OpenBSD 5.3 VM.

