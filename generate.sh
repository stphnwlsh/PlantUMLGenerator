#!/bin/bash

docker build . -t plantuml

for path in $(ls *.puml **/*.puml)
do    
    echo $path;
    $(cat $path | docker run --rm -i plantuml -tpng > $path.png);
    $(cat $path | docker run --rm -i plantuml -tsvg > $path.svg);
done