********************************
Packer, Vagrant and Salt Example
********************************

This is an example configuration which builds a Debian `Vagrant
<http://www.vagrantup.com/>`_ box using `Packer
<http://www.packer.io/>`_ and provisions it using `Salt
<http://www.saltstack.com/community/>`_. It will use `VirtualBox
<https://www.virtualbox.org/>`_ as provider.

You have to install Packer, Vagrant and VirtualBox before you can
continue.

Create the Vagrant box with Packer
==================================

First validate the Packer template::

    $ cd packer
    $ packer validate debian7.json

Now build the image::

    $ packer build debian7.json
    $ cd ..

Add the Vagrant box
===================

Add the Vagrant box created by Packer::

    $ vagrant box add --name debian7 debian7.box

After that you should see the new box in the list of all Vagrant boxes::

    $ vagrant box list
    debian7         (virtualbox, 0)

Run the Vagrant box
===================

Now start the Vagrant box using the ``up`` command::

    $ vagrant up

After the box has been created and booted login using the ``ssh`` command::

    $ vagrant ssh

If you look around you will recognize that the directory ``/vagrant`` on
the guest is a shared folder pointing to the directory on the host that
contains the ``Vagrantfile``.

Salt has installed a few Debian packages on the guest. One of them was
the Apache webserver. Port 80 of the guest has been forwarded to port
8000 on your machine. So if you open http://127.0.0.1:8000/ you should
see a "Vagrant Box" page which has also been created by Salt.

If you are finished log out from the guest and shutdown the box with the
``halt`` command::

    $ vagrant halt

And of course you can destroy the box if you want to::

    $ vagrant destroy

Sharing the Vagrant box with others
===================================

You can share any running Vagrant box with other people. But first you
have to create a `Vagrant Cloud <https://vagrantcloud.com/>`_ account.
After that log in on the command line::

    $ vagrant login

Then create an URL to share the running guest with other people::

    $ vagrant share
