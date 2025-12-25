#!/bin/bash

set -e

#for i in $(ls); do
#    if [ "$i" = "docs" ]; then
#        continue
#    fi
#	if [ -d $i ]; then
#		cd $i
#		if [ -e SKIP ]; then
#			echo Copying $i deb file
#			cp -f ../../*.deb pool/main/
#			rm SKIP
#		else
#			echo Skipping copying $i due to no SKIP file.
#		fi
#		cd ..
#	fi
#done

# dpkg-scanpackages pool /dev/null > dists/stable/main/binary-arm64/Packages
# gzip -k -f dists/stable/main/binary-arm64/Packages

apt-ftparchive packages pool/main > dists/stable/main/binary-arm64/Packages
gzip -kf dists/stable/main/binary-arm64/Packages

git add .
git commit -m "Updating APT package $1"
git push origin HEAD:main --force
