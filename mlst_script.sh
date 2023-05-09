#!/bin/bash

# Kill script if any commands fail
set -e
echo "Job Start at `date`"

sequence=/home/lww/raid/E.faecium_genome/geo_ef_head
mlst=/home/lww/raid/mlst
mlst_res=/home/lww/raid/E.faecium_genome/mlst_result

#pip install jsoncsv
cd $mlst		
for m in /home/lww/raid/E.faecium_genome/geo_ef_head/*.fasta
do ./mlst.py -i $m -o $mlst_res  -t /home/lww/raid/mlst/tmp -p /home/lww/raid/database/mlst_db -s efaecium
m1=${m##*/}
cat $mlst_res/data.json | jsoncsv | mkexcel > $mlst_res/$m1.csv
done
cd ${mlst_res}
cat ./*.csv > ./class_result/mlst_re_total.csv

#get time end the job
echo "Job finished at:" `date`
