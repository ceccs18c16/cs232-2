#!/bin/bash

pdftotext -layout results1CHN.pdf results1CHN.txt

grep --no-group-separator -A3 "CHN18CS" results1CHN.txt > results1cs.txt

pdftotext -layout results2CHN.pdf results2CHN.txt

grep --no-group-separator -A3 "CHN18CS" results2CHN.txt > results2cs.txt


tr  '\n' ' ' < results1cs.txt > results1nn.txt
sed 's/\t//g' results1nn.txt > results1na.txt
awk '{$1=$1;print}' results1na.txt > results1nn.txt
sed 's/CHN/\nCHN/g' results1nn.txt > results1na.txt
tr  ',' ' ' < results1na.txt > results1.txt

tr  '\n' ' ' < results2cs.txt > results2nn.txt
sed 's/\t//g' results2nn.txt > results2na.txt
awk '{$1=$1;print}' results2na.txt > results2nn.txt
sed 's/CHN/\nCHN/g' results2nn.txt > results2na.txt
tr  ',' ' ' < results2na.txt > results2.txt



sed -i 's/(O)/ 10/g' results1.txt
sed -i 's/(A+)/ 9/g' results1.txt 
sed -i 's/(A)/ 8.5/g' results1.txt
sed -i 's/(B+)/ 8/g' results1.txt
sed -i 's/(B)/ 7/g' results1.txt
sed -i 's/(C)/ 6/g' results1.txt
sed -i 's/(P)/ 5/g' results1.txt
sed -i 's/(F)/ 0/g' results1.txt
sed -i 's/(FE)/ 0/g' results1.txt
sed -i 's/(I)/ 0/g' results1.txt
sed -i 's/(Absent)/ 0/g' results1.txt

sed -i 's/(O)/ 10/g' results2.txt
sed -i 's/(A+)/ 9/g' results2.txt 
sed -i 's/(A)/ 8.5/g' results2.txt
sed -i 's/(B+)/ 8/g' results2.txt
sed -i 's/(B)/ 7/g' results2.txt
sed -i 's/(C)/ 6/g' results2.txt
sed -i 's/(P)/ 5/g' results2.txt
sed -i 's/(F)/ 0/g' results2.txt
sed -i 's/(FE)/ 0/g' results2.txt
sed -i 's/(I)/ 0/g' results2.txt
sed -i 's/(Absent)/ 0/g' results2.txt


awk  '{  
	print $1,$3,$5,$7,$9,$11,$13,$15,$17,$19
 }' results1.txt > gps1.txt 

awk  '{  
	print $1,$3,$5,$7,$9,$11,$13,$15,$17,$19
 }' results2.txt > gps2.txt 


awk '{
	sum = 0
	flag = 0
	fails = 0
	for(var =2; var<=NF; var++)
	{	
		if($var == 0) 
		{
			flag = 1
			fails = fails + 1
		}
		sum += $var
	}
	cgpa1 = sum/9
	if (flag == 0) {	
	 	printf("%s %0.2f\n",$1,cgpa1)
	}
	if (flag == 1) {
		printf(cgpa1=0)
	}
}' gps1.txt > cgpa_raws1.txt

awk '{
	sum = 0
	flag = 0
	fails = 0
	for(var =2; var<=NF; var++)
	{	
		if($var == 0) 
		{
			flag = 1
			fails = fails + 1
		}
		sum += $var
	}
	cgpa2 = sum/9
	if (flag == 0) {	
	 	printf("%s %0.2f\n",$1,cgpa2)
	}
	if (flag == 1) {
		printf(cgpa2=0)
	}
}' gps2.txt > cgpa_raws2.txt



awk'{
      sgpa=(cgpa1 + cgpa2)/2
      printf("%s %0.2f\n",$1,sgpa)
       
    }' cgpa_raws1.txt cgpa_raws2.txt > sgpa_raw.txt


join students.txt  sgpa_raw.txt > sgpa.txt



