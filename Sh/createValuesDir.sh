#! /bin/bash

cd app/src/main/res/
targetDir="values-de values-es values-fr values-in values-it values-ja values-ko values-pt values-ru values-th"
for valueDir in $targetDir
do
    echo $valueDir
    mkdir $valueDir
    cd $valueDir
    touch strings.xml
    echo '<?xml version="1.0" encoding="utf-8"?>' >> strings.xml
    echo '<resources>' >> strings.xml
    echo '</resources>' >> strings.xml
    cd ..
done
