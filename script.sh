rm -rf ./release
mkdir release
output=$(helm package .)
version=$(echo $output | sed 's/.*-\(.*\)\.tgz$/\1/')
mv $(echo $output | sed 's/.*\///') ./release
helm repo index . --url 'https://raw.githubusercontent.com/BautistaTosolini/helm-chart/$version/' --merge index.yaml