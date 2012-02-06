Java packaging scripts
======================

This is a no-install version of the scripts I maintain in Debian java-package package.
You may currently find it on Debian unstable (sid) or in the Debian git repository (git+ssh://git.debian.org/git/pkg-java/java-package.git)

The scripts create a Debian package from a Java(TM) SE distribution.
It works currently with the following Java(TM) SE JREs, JDKs and APIs:
 Oracle(TM) 1.6 Standard Edition (starting with update 10)
 Oracle(TM) 1.7 Standard Edition


Usage
-----

Install the debhelper and fakeroot packages:

> apt-get install debhelper fakeroot

Download the java-package scripts:

> git clone git@github.com:cedricpineau/java-package.git && cd java-package

Download a supported Java(TM) SE JRE or JDK or API tar.gz or self-extracting archive from http://www.oracle.com/technetwork/java/javase/downloads

> J2SE_PACKAGE_LIBDIR=./lib ./make-jpkg *downloaded-archive*
