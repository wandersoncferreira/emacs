# Experiment using different emacs profiles

The idea is to isolate specific configuration to specific goals.

You need to install [chemacs](https://github.com/plexus/chemacs) which
is a profiler switch.

```shell
$ git clone https://github.com/plexus/chemacs.git
$ cd chemacs
$ ./install.sh
OK      Creating symlink ~/.emacs -> /home/arne/chemacs/.emacs
```


Then you execute the `init.sh` file from this folder.

1. Create the necessary profile file to chemacs switcher
2. Open named daemonized Emacs instances
3. Create aliases to **emacs-{profile-name}**: Open a GUI instance with the provided profile
4. Create alises to **et-{profile-name}**: Open a Terminal instance with the provided profile

The benefits of this setup is instant access to emacs instances with
your desired profile.