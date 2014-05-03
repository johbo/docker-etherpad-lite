
===============
 Etherpad Lite
===============

Based on my first Docker experiments. This builds a container which has
etherpad lite installed and set up.


Dependencies
============

Expects a data volume ``/data`` to be available. This volume will contain the
sqlite database which holds all the pages.

Exposes a port ``9001`` to reach the pads.
