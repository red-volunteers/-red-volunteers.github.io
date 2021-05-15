#!/bin/bash

cd volunteers
curl  -XGET http://www.buymeadesichai.com/rvwb/api/volunteer-list/ > list_temp.json
grep -v '^$' list_temp.json > list.json 
rm -f list_temp.json

for var in {1..23}
do
     curl  -XGET http://www.buymeadesichai.com/rvwb/api/volunteer-list/$var > $var_temp.json
	 grep -v '^$' $var_temp.json > $var.json 
	 rm -f $var_temp.json
done
cd ../hospital
curl  -XGET http://www.buymeadesichai.com/rvwb/api/hospital-list/ > list_temp.json
grep -v '^$' list_temp.json > list.json 
rm -f list_temp.json

for var in {1..23}
do
     curl  -XGET http://www.buymeadesichai.com/rvwb/api/hospital-list/$var > $var_temp.json
	 grep -v '^$' $var_temp.json > $var.json 
	 rm -f $var_temp.json
done
cd ..

git add -A 
git commit -m "update"
#git push -f

