#! /bin/bash

git submodule update --init --recursive;

pushd $(pwd) > /dev/null
cd plugins/

for file in *;
do
    if [ -d $file ]; then
	pushd $(pwd) > /dev/null
	cd $file
	for sub in $(ls -a);
	do
	    if [ -d $sub ] && [ "$sub" = ".svn" ]; then
		echo ""
		echo "svn update" $file
		svn update
	    fi
	done
	popd > /dev/null
    fi
done

popd > /dev/null
