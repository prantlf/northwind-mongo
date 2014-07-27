for f in *.csv
do
    filename=$(basename "$f")
    extension="${filename##*.}"
    filename="${filename%.*}"
    filename=`echo "$filename" | sed 's/[^-]*/\u&/g'`
    filename=`echo "$filename" | sed 's/-//g'`
    mongoimport -d Northwind -c "$filename" --type csv --file "$f" --headerline
done
