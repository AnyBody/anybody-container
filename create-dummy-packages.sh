#!/bin/bash
# put last argument in package_version and all other arguments in package_names
package_version=${!#}
package_names=("${@:1:$(($#-1))}")

echo "Package version: $package_version"
echo "Package names: ${package_names[@]}"

# Loop over all package names and create a dummy package for each

for package_name in "${package_names[@]}"
do
    echo -e "Section: misc\nPriority: optional\nStandards-Version: 3.9.2\n\nPackage: $package_name\nVersion: $package_version\nMaintainer: Morten Lund <mel@anybodytech.com>\nArchitecture: all\nDescription: Dummy package" > "$package_name.equivs" 
    equivs-build "$package_name.equivs"
done


