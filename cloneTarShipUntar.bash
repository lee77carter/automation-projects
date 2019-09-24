#!/usr/bin/bash

# This script worked well with an old server with no git services
# So it clones the repo on another server
# Creates a tarball
# Then ships it to the old server and unpacks the tarball for manual commands steps to be ran

# Variables #
stagingDir=/usr/lee77carter/doNotBackup
targetDir=/usr/lee77carter/build/doNotBackup
HOST=lee77carter.gogurl.com
tarFile=lee77carter.tar
version=r_1.1.SP1_HF8
tarDir=cooldirectory

# Create Tarball #
sudo -E -u lee77carter /bin/tar cvf $stagingDir/$tarFile ../$tarDir

# Ship Tarball to Old Server #
echo "Transferring tarball to old server"
sudo -E -u lee77carter scp $targetDir/$tarFile $HOST:/usr/lee77carter/build/doNotBackup/.
echo "Transfer Complete"
     				
# Unpack & run build: 
cd $stagingDir
/bin/tar xvf $tarFile
/bin/mv $tarDir $version
cd $version

# Now log in and run those manual commands on that old pesky system
