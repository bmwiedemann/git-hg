# git-hg #

*Description*: A set of scripts for checking out and tracking a mercurial project
from git. Push supported added as well although it is still experimental.

*Author*: Cosmin Stejerean (offbytwo), simplified for Linux distributions by bmwiedemann

*License*: MIT

## Dependencies ##

Mercurial (`hg`) and `hg-fast-export` must be installed and in your `$PATH`.

On Windows, you will also need a copy of Mercurial for Python, available at [the Mercurial downloads page](http://mercurial.selenic.com/downloads/)

## Installation ##

Either add `/path/to/this/checkout/bin` to your `$PATH`, or symbolic link
`/path/to/this/checkout/bin/git-hg` into a directory on your `$PATH`.

Alternatively you can execute

        $ make
        $ sudo make install

to install the script in `/usr/local` (you
can change the destination by passing eg `PREFIX=/usr` to *both* `make`
invocations)

## Usage ##

- Clone an hg repo, including ones over HTTP:

        $ git-hg clone http://some/random/hg/repo [local-git-repo-name]

- Fetch updates from the hg repo:

        $ git-hg fetch

    or optionally:

        $ git-hg pull # same as git-hg-fetch && git merge hg/branch_name

- Checkout a new branch from hg:

        $ git-hg checkout branch_name
        
- Push changes back to hg, optionally to a specific destination:

		$ git-hg push [destination]

## Structure ##

`.git/hgcheckout` - contains a bare mercurial checkout of the specified repo

`.git/hgremote` - contains a bare git repo clones from the mercurial one, this
                  is added as a remote called "hg" in the base repo
