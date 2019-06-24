set -e
cd $(dirname $0)


if [ $# -eq 0 ]
  then
    echo "No arguments supplied using yesterday date"
    export date=`date -d "-2 days" +%Y-%m-%d`
else
  export date=$1
fi
echo $date
embulk run transactions.yml.liquid
