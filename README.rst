
===============
 Etherpad Lite
===============

Based on my first Docker experiments. This builds a container which has
etherpad lite installed and set up.



Interface
=========


Environment
-----------

When generating the settings, the following environment variables are taken
into account:

``EP_TITLE``
   Used to set the title when the settings are generated.

   Default: "Etherpad"

``EP_SESSION_KEY``
   Allows to specify the session key to be used when the settings are
   generated.

   Default: Random generated string value


.. note::

   The settings are only generated once and then stored in the data
   volume. This way the session key is persistent between different
   invocations.



Volumes
-------

Expects a data volume ``/data`` to be available. This volume will contain the
following things:

- `etherpad.db` is the sqlite database

- `etherpad-settings.json` is the generated configuration

  Main reason to have it in data is to persist the session key between
  invocations.

- `etherpad.log` contains the logs



Ports
-----

Exposes a port ``9001`` to reach the pads
