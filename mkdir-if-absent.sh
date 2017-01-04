TAG="mkdir-if-absent ---> "

targetDir=$1

echo -e "$TAG mkdir $targetDir\n"

if [ -d "$targetDir" ]; then
    rmdir "$targetDir"
    mkdir "$targetDir"
else
    mkdir "$targetDir"
fi