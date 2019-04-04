set hive.exec.dynamic.partition=true;
set hive.exec.dynamic.partition.mode=nonstrict;

drop table if exists dg_dqc.tmp_chk_detail_his;
create table dg_dqc.tmp_chk_detail_his like dg_dqc.m07_checkerror_detail_his;

from (
	select 
	t.dqid new_dqid
	,t.tx_date as new_date
	,t.pk_val new_pk_val
	,t.field_val new_field_val
	,t.error_flag
	,h.dqid cur_dqid
	,h.tx_date as cur_date
	,h.pk_val cur_pk_val
	,h.field_val cur_field_val
	from dg_dqc.m07_checkerror_detail t full outer join dg_dqc.m07_checkerror_detail_his h
	on t.dqid = h.dqid and t.pk_val = h.pk_val
) t1
insert into dg_dqc.tmp_chk_detail_his partition(dqid)	-- new error
select 
	new_pk_val
	,new_field_val
	,new_date
	,new_dqid
where
	error_flag = '1'
	and cur_date is null
insert into dg_dqc.tmp_chk_detail_his partition(dqid)	-- duplicated error
select 
	new_pk_val
	,new_field_val
	,cur_date
	,new_dqid
where
	error_flag = '1'
	and cur_date is not null
insert into dg_dqc.tmp_chk_detail_his partition(dqid)	-- missing error
select 
	cur_pk_val
	,cur_field_val
	,cur_date
	,cur_dqid
where
	error_flag is null
	and cur_date is not null
;

drop table dg_dqc.m07_checkerror_detail_his;
alter table dg_dqc.tmp_chk_detail_his rename to dg_dqc.m07_checkerror_detail_his;

truncate table dg_dqc.m07_checkerror_sum;
insert into dg_dqc.m07_checkerror_sum
select dqid, tx_date, count(*)
from dg_dqc.m07_checkerror_detail_his
group by dqid, tx_date
;
