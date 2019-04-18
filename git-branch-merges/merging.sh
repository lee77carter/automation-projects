#!/bin/bash
# 
# A simple bash script that merges the release branch into the develop branch from the command-line
# 
# Test Branch Variables
REPO=myRepo
RLS_BRANCH=leeRlsBranch
DEV_BRANCH=leeDevBranch
LOGFILE=merging.txt

# Check-out repo/s: 
cd $REPO

# Check-out branches & merge: 
{ git checkout $RLS_BRANCH; git branch; git checkout $DEV_BRANCH; git branch; } > ../$LOGFILE 2>&1
git merge --no-ff $RLS_BRANCH >> ../$LOGFILE 2>&1

if ! git merge --no-ff $RLS_BRANCH
then
    echo "Opps! merge failed, you could have a conflict."
else
    echo "Release branch successfully merged into develop" >&2
fi

# Create a Pull Request (investigating....)

# Push commit
git push origin $DEV_BRANCH >> ../$LOGFILE 2>&1

if ! git push origin $DEV_BRANCH
then
    echo "Git push failed"
else
    echo"Git push successful" 
fi
