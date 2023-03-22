cdist-type__ejabberd_user(7)
============================

NAME
----
cdist-type__ejabberd_user - Manage XMPP accounts in ejabberd.


DESCRIPTION
-----------
This cdist type can be used to register or unregister XMPP accounts in ejabberd.

Please note that changing passwords is only supported if
`mod_admin_extra <https://docs.ejabberd.im/admin/configuration/modules/#mod-admin-extra>`_
is enabled in ejabberd's configuration.


REQUIRED PARAMETERS
-------------------
None.


OPTIONAL PARAMETERS
-------------------
password
   the password to set for the user.

   Required if ``--state present``
state
   One of:

   ``present``
      the user is present
   ``absent``
      the user is absent


BOOLEAN PARAMETERS
------------------
None.


EXAMPLES
--------

.. code-block:: sh

   # Create an admin user
   __ejabberd_user admin@example.com --password hunter2


SEE ALSO
--------
:strong:`cdist-type__ejabberd_server`\ (7)


AUTHORS
-------
Dennis Camera <dennis.camera--@--ssrq-sds-fds.ch>


COPYING
-------
Copyright \(C) 2022 Dennis Camera.
You can redistribute it and/or modify it under the terms of the GNU General
Public License as published by the Free Software Foundation, either version 3 of
the License, or (at your option) any later version.
