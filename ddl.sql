DROP TABLE IF EXISTS dg_dqc.M07_CHECKERROR_DETAIL;
CREATE TABLE IF NOT EXISTS dg_dqc.M07_CHECKERROR_DETAIL
(
pk_val    STRING    COMMENT '主键值',
field_val STRING    COMMENT '字段值',
error_flag STRING   COMMENT '错误记录标志',
tx_date   STRING    COMMENT '数据日期'
) COMMENT '错误记录明细'
Partitioned by (dqid STRING COMMENT '检查规则编号')
row format delimited fields terminated by '\t' lines terminated by '\n' STORED AS textfile;


DROP TABLE IF EXISTS dg_dqc.M07_CHECKERROR_DETAIL_HIS;
CREATE TABLE IF NOT EXISTS dg_dqc.M07_CHECKERROR_DETAIL_HIS
(
pk_val    STRING    COMMENT '主键值',
field_val STRING    COMMENT '字段值',
tx_date   STRING    COMMENT '数据日期'
) COMMENT '错误记录明细历史'
Partitioned by (dqid STRING COMMENT '检查规则编号')
row format delimited fields terminated by '\t' lines terminated by '\n' STORED AS textfile;

DROP TABLE IF EXISTS dg_dqc.M07_CHECKERROR_SUM;
CREATE TABLE IF NOT EXISTS dg_dqc.M07_CHECKERROR_SUM
(
dqid      STRING     COMMENT '检查规则编号',
tx_date   STRING    COMMENT '首次检查日期',
err_cnt   STRING    COMMENT '错误记录总数'
) COMMENT '错误记录汇总'
row format delimited fields terminated by '\t' lines terminated by '\n' STORED AS textfile;

DROP TABLE IF EXISTS dg_dqc.M07_CHECKERROR_DETAIL_HIS_EXP;
CREATE TABLE IF NOT EXISTS dg_dqc.M07_CHECKERROR_DETAIL_HIS_EXP
(
pk_val    STRING    COMMENT '主键值',
field_val STRING    COMMENT '字段值',
tx_date   STRING    COMMENT '数据日期',
dqid      STRING    COMMENT '检查规则编号'
) COMMENT '错误记录明细历史导出'
row format delimited fields terminated by '\t' lines terminated by '\n' STORED AS textfile;
