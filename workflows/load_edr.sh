set -e
cd $(dirname $0)


if [ $# -eq 0 ]
  then
    echo "No arguments supplied"
    exit -1
else
  export filename=$1
fi
echo $filename
embulk run edr_xml.yml.liquid
