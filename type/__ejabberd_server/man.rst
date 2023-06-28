cdist-type__ejabberd_server(7)
==============================

NAME
----
cdist-type__ejabberd_server - Install and configure an ejabberd server


DESCRIPTION
-----------
This space intentionally left blank.


REQUIRED PARAMETERS
-------------------
config-source
   local path to the ``ejabberd.yml`` file to install on the target.


OPTIONAL PARAMETERS
-------------------
interface
   the IP address of the interface ejabberd should listen on for internal
   (cluster) communication.

   The ``ejabberdctl.cfg`` variables ``INET_DIST_INTERFACE`` and
   ``ERL_EPMD_ADDRESS`` will be set to this value.

   Defaults to: ``127.0.0.1`` (for security reasons in single-server setups)
node-name
   the name of the Erlang node.

   Defaults to: ``ejabberd@localhost``


BOOLEAN PARAMETERS
------------------
None.


EXAMPLES
--------

.. code-block:: sh

   # Install ejabberd using the configuration from ~/.skonfig/files/ejabberd.yml
   __ejabberd_server \
      --config-source "${__files:?}/ejabberd.yml"


   # Install ejabberd from the Debian backports repository
   __apt_backports

   read -r lsb_codename _ <"${__global:?}/explorer/lsb_codename"

   require=__apt_backports/ \
   __apt_pin erlang-backports \
      --package 'erlang*' \
      --distribution "${lsb_codename:?}-backports" \
      --priority 600

   require=__apt_backports/ \
   __apt_pin ejabberd-backports \
      --package 'ejabberd*' \
      --distribution "${lsb_codename:?}-backports" \
      --priority 600

   require='__apt_pin/erlang-backports __apt_pin/ejabberd-backports' \
   __ejabberd_server \
      --config-source "${__files:?}/ejabberd.yml"


SEE ALSO
--------
:strong:`cdist-type__ejabberd_user`\ (7)


AUTHORS
-------
Dennis Camera <dennis.camera--@--riiengineering.ch>


COPYING
-------
Copyright \(C) 2022-2023 Dennis Camera.
You can redistribute it and/or modify it under the terms of the GNU General
Public License as published by the Free Software Foundation, either version 3 of
the License, or (at your option) any later version.
