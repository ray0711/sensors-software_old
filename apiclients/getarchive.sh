#!/bin/bash

urlbase="archive.luftdaten.info"

# remove index.html before fetching
rm archive.luftdaten.info/index.html -f

# mirror the archive via wget (brute force)
# wget -r -c -np -nc -N -k http://archive.luftdaten.info/
# sort dates reversed
# wget -r -c -np -nc -N -k "http://archive.luftdaten.info/?C=N;O=D"

# echo "stopping here."
# exit 0

#urlfile=$(mktemp tmp.currurl)

# do it by dates backwards from yesterday to one year ago
for dd in {1..365}
do
	fetchdate=$(date -I --date="$dd days ago")
	if [ -d "$urlbase/$fetchdate" ] ; then continue ; fi
#	echo "$fetchdate" >> "$urlfile"	
        wget --force-directories -r -c -np -N -k "$urlbase/$fetchdate"
# -nc
#--base="http://$urlbase/" 
# -i "$urlfile"
done


# cleanup
#rm "$urlfile"
