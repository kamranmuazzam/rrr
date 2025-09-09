#!/bin/bash

# Define the version variable
old_version="1.4"
version="1.4"
LC_CTYPE=C find . -maxdepth 3 -type f -exec perl -pi -e "s/$old_version/$version/g" {} +

git config --global user.name "Kamran"
git config --global user.email kamranmuazzam@gmail.com

git pull
git add --all
git commit -m "$version"
git push -u origin main
# git push origin main --force
gh release create v$version --title "Version $version" --notes "releasing $version, kudos"
gh release edit v$version --draft=false


# git tag v1.4
# git push origin v1.4