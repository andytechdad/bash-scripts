goss_latest=$(curl --silent "https://api.github.com/repos/aelsabbahy/goss/releases/latest" | grep '"tag_name":' |  sed -E 's/.*"([^"]+)".*/\1/')
echo "Latest version of Goss is $goss_latest"
mkdir -p $goss_latest
echo "Downloading from github.com...."
curl -L https://github.com/aelsabbahy/goss/releases/download/$goss_latest/goss-linux-amd64 -o $goss_latest/goss-linux-amd64
ls -l $goss_latest/
mkdir -p sources/sources/goss/$goss_latest
cp $goss_latest/goss-linux-amd64 sources/goss/$goss_latest

spectool --directory SOURCES -g SPECS/goss.spec
rpmbuild --define "_topdir $(pwd)" -bb SPECS/goss.spec
