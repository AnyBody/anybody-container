
package_names=("$@")

echo -e "Section: misc\nPriority: optional\nStandards-Version: 3.9.2\n\nPackage: {{PACKAGE_NAME}}\nVersion: 99:99\nMaintainer: Morten Lund <mel@anybodytech.com>\nArchitecture: all\nDescription: Dummy package" > dummy-package.equivs 

for package_name in "${package_names[@]}"
do
    cp dummy-package.equivs "$package_name.equivs"
    sed -i "s/{{PACKAGE_NAME}}/$package_name/g" "$package_name.equivs"
    equivs-build "$package_name.equivs"
done


