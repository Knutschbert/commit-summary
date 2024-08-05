#!/bin/sh
sh -c "git config --global --add safe.directory $PWD"

new_tag=$1

previous_tag=$(git tag --sort=-creatordate | sed -n 2p)
commit_summary="$(git log --oneline --pretty=tformat:"%h %s" $previous_tag..$new_tag)"

echo "summary<<$EOF" >> $GITHUB_OUTPUT
echo "${commit_summary}" >> $GITHUB_OUTPUT
echo "$EOF" >> $GITHUB_OUTPUT
