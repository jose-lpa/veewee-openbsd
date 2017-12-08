
ver=snapshots
echo "$ver"
rm -rf definitions/snapshots/ build_snapshots

cp build_v62 build_$ver
sed -i ''s/openbsd62/$ver/g'' build_$ver
cp -pR definitions/openbsd62 definitions/"$ver"
url=$(curl -s  https://ftp.icm.edu.pl/pub/OpenBSD/"$ver"/amd64/SHA256|grep install.*iso)
if ( [[ -z $url ]] ); then {
cant get SHA256 fingerprint, exiting
exit 2
}
sha=$(echo $url |cut -f4 -d' ')
iso=$(echo $url |cut -f2 -d' ' | tr -d \(,\))

sed -i ''s/iso_sha256.*$/iso_sha256\ =\>\ \"$sha\",/'' definitions/"$ver"/definition.rb
sed -i -e ''s/install62.iso/$iso/g'' build_$ver definitions/$ver/* -e ''s/6\.2/$ver/g'' 
