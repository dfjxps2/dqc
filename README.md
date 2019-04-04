## 部署说明
- 使用hive.ddl.sql创建Hive表
- 使用mysql.ddl.sql创建MySQL表
- 配置执行数据质量检查明细处理的作业，该作业调用chk-detail.sql，在数据质量检查之后执行。
- 配置导出数据质量检查明细结果的作业，该作业调用export-detail.sh，在数据质量检查明细处理之后执行。

## 需要根据本地环境调整的参数
### export-detail.sh
- Hive数据文件目录
- MySQL访问参数（主机、用户、口令）

