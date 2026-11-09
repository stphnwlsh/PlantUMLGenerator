#!/usr/bin/env bash
#
# Turns every PlantUML file (*.puml) in this repository into PNG and SVG images,
# saved next to the file they came from. Needs Docker and nothing else.
#
#   ./generate.sh                 every diagram in the repository
#   ./generate.sh Diagrams/Foo.puml   just the ones you name

set -euo pipefail

cd "$(dirname "$0")"

image="${PLANTUML_IMAGE:-plantuml-generator}"

files=()
if [[ $# -gt 0 ]]; then
  files=("$@")
else
  while IFS= read -r -d '' file; do
    files+=("$file")
  done < <(find . -name '*.puml' -not -path './.git/*' -print0)
fi

if [[ ${#files[@]} -eq 0 ]]; then
  echo "No .puml files found. Nothing to draw, so I'm putting the kettle on."
  exit 0
fi

echo "Building the $image image..."
docker build --quiet --tag "$image" . > /dev/null

for format in png svg; do
  echo "Drawing ${#files[@]} diagram(s) as $format..."
  docker run --rm \
    --user "$(id -u):$(id -g)" \
    --volume "$PWD:/data" \
    "$image" -t"$format" -failfast2 "${files[@]}"
done

echo "Done. The images are next to their .puml files."
