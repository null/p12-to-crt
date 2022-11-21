#!/bin/bash

dir="./certificates"
for filename in $dir/*.p12; do
				filebasename=$(basename -- "$filename")
				filebasename="${filebasename%.*}"
				targetcertname=$dir/$filebasename.crt
				targetkeyname=$dir/$filebasename.key
				echo -e "\n\nConverting: \n$filebasename\n"
				openssl pkcs12 -in  "$filename" -out "$targetcertname" -nodes
				#extract private KEY
				sed -n "/-----BEGIN PRIVATE KEY-----/,/-----END PRIVATE KEY-----/p" $targetcertname > $targetkeyname
				#extract first of three certificates - change if needed
				sed   "/-----END CERTIFICATE-----/q"  $targetcertname > temp.txt
				cat temp.txt > $targetcertname
				rm temp.txt
				echo -e "\n\nConverted to: \n  $targetcertname and \n  $targetkeyname"
done