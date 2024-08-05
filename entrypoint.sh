#!/bin/sh
sh -c "git config --global --add safe.directory $PWD"

new_tag=$1

previous_tag=$(git tag --sort=-creatordate | sed -n 2p)
commit_summary="$(git log --oneline --pretty=tformat:"%h %s" $previous_tag..$new_tag)"
commit_summary="${commit_summary//'%'/'%25'}"
commit_summary="${commit_summary//$'\n'/'%0A'}"
commit_summary="${commit_summary//$'\r'/'%0D'}"
echo "${summary}=${commit_summary}" >> $GITHUB_OUTPUT
