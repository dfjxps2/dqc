
-- 20190401
-- truncate table dg_dqc.m07_checkerror_detail;
-- load data local inpath '20190401/m07_checkerror_detail.dqid01.dat' into table dg_dqc.m07_checkerror_detail partition(dqid='dqid01');
-- load data local inpath '20190401/m07_checkerror_detail.dqid02.dat' into table dg_dqc.m07_checkerror_detail partition(dqid='dqid02');

-- 20190402
-- truncate table dg_dqc.m07_checkerror_detail;
-- load data local inpath '20190402/m07_checkerror_detail.dqid01.dat' into table dg_dqc.m07_checkerror_detail partition(dqid='dqid01');
-- load data local inpath '20190402/m07_checkerror_detail.dqid03.dat' into table dg_dqc.m07_checkerror_detail partition(dqid='dqid03');

-- 20190403
truncate table dg_dqc.m07_checkerror_detail;
load data local inpath '20190403/m07_checkerror_detail.dqid01.dat' into table dg_dqc.m07_checkerror_detail partition(dqid='dqid01');
load data local inpath '20190403/m07_checkerror_detail.dqid02.dat' into table dg_dqc.m07_checkerror_detail partition(dqid='dqid02');
load data local inpath '20190403/m07_checkerror_detail.dqid03.dat' into table dg_dqc.m07_checkerror_detail partition(dqid='dqid03');
