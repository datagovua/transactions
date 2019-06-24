set -e
cd $(dirname $0)


if [ $# -eq 0 ]
  then
    echo "No arguments supplied"
    exit -1
else
  export zip_file=$1
  export xml_file=$2
fi
echo $filename

unzip -l $zip_file | grep $xml_file | cut -d " " -f3,4 | xargs
