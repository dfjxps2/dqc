#!/bin/sh

LOAD_EXP_SQL=/tmp/load_checkerror_detail_exp.sql
MYSQL_HOST=localhost
MYSQL_USER=root
MYSQL_PASSWORD=root

rm -f $LOAD_EXP_SQL
echo "truncate table dg_dqc.m07_checkerror_detail_his_exp;" >> $LOAD_EXP_SQL

hdfs dfs -ls /user/hive/warehouse/dg_dqc.db/m07_checkerror_detail_his|while read C1 C2 C3 C4 C5 C6 C7 C8
do
	if [ ! -z "$C8" ]; then
		PART_ID=`echo $C8|sed 's/.*dqid=\([a-z]\{1,\}\)/\1/'`
		echo "insert into dg_dqc.m07_checkerror_detail_his_exp select * from dg_dqc.m07_checkerror_detail_his where dqid='$PART_ID' limit 1000;" >> $LOAD_EXP_SQL
	fi
done

hive -f $LOAD_EXP_SQL

mysql -u${MYSQL_USER} -p${MYSQL_PASSWORD}  << EOF
truncate table dg_dqc.m07_checkerror_detail_his;
truncate table dg_dqc.m07_checkerror_sum;
EOF

sqoop export --connect jdbc:mysql://${MYSQL_HOST}:3306/dg_dqc --table m07_checkerror_detail_his --username $MYSQL_USER --password $MYSQL_PASSWORD --export-dir /user/hive/warehouse/dg_dqc.db/m07_checkerror_detail_his_exp --fields-terminated-by '\t'

sqoop export --connect jdbc:mysql://${MYSQL_HOST}:3306/dg_dqc --table m07_checkerror_sum --username $MYSQL_USER --password $MYSQL_PASSWORD --export-dir /user/hive/warehouse/dg_dqc.db/m07_checkerror_sum --fields-terminated-by '\t'


