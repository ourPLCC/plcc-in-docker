#!/bin/bash

set -ue

IMAGES_TO_RELEASE=ourplcc/plcc-in-docker:build

# Create a release commit.
standard-version

# Get the new version from the git tag.
VERSION="$(git describe --abbrev=0)"

# Get the PLCC_VERSION by running our new image and inspecting PLCC's VERSION file.
PLCC_VERSION="$(docker run -it --rm ourplcc/plcc-in-docker:build cat /plcc/VERSION)"
# Strip leading and trailing whitespace.
PLCC_VERSION=$(sed -e 's/^[[:space:]]*//' -e 's/[[:space:]]*$//' <<<${PLCC_VERSION})

# Print commands for tagging docker images.
echo "# Review CHANGELOG, your git log, and git tags."
echo "# When you are satisfied, run the following commands to publish the release."

VERSION_1_2_3="${VERSION#v}"
VERSION_FULL="${VERSION_1_2_3}-plcc${PLCC_VERSION}"
VERSION_1_2="${VERSION_1_2_3%.*}"
VERSION_1="${VERSION_1_2%.*}"
IFS=' ' read -ra IMAGES <<< "$IMAGES_TO_RELEASE"
for IMAGE in "${IMAGES[@]}"; do
  BASE="${IMAGE%:*}"
  docker tag "${IMAGE}" "${BASE}:${VERSION_FULL}" && \
  docker tag "${IMAGE}" "${BASE}:${VERSION_1_2_3}" && \
  docker tag "${IMAGE}" "${BASE}:${VERSION_1_2}" && \
  docker tag "${IMAGE}" "${BASE}:${VERSION_1}" && \
  docker tag "${IMAGE}" "${BASE}:latest"
done

# Print commands to publish git commits and tags
echo "git push --follow-tags origin master"

# Print commands for publishing docker images.
IFS=' ' read -ra IMAGES <<< "$IMAGES_TO_RELEASE"
for IMAGE in "${IMAGES[@]}"; do
  BASE="${IMAGE%:*}"
  cat <<EOF
docker push "${BASE}:${VERSION_FULL}"
docker push "${BASE}:${VERSION_1_2_3}"
docker push "${BASE}:${VERSION_1_2}"
docker push "${BASE}:${VERSION_1}"
docker push "${BASE}:latest"
EOF
done
