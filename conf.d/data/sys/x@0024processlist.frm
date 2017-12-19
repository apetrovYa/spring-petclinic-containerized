TYPE=VIEW
query=select `pps`.`THREAD_ID` AS `thd_id`,`pps`.`PROCESSLIST_ID` AS `conn_id`,if((`pps`.`NAME` = \'thread/sql/one_connection\'),concat(`pps`.`PROCESSLIST_USER`,\'@\',`pps`.`PROCESSLIST_HOST`),replace(`pps`.`NAME`,\'thread/\',\'\')) AS `user`,`pps`.`PROCESSLIST_DB` AS `db`,`pps`.`PROCESSLIST_COMMAND` AS `command`,`pps`.`PROCESSLIST_STATE` AS `state`,`pps`.`PROCESSLIST_TIME` AS `time`,`pps`.`PROCESSLIST_INFO` AS `current_statement`,`esc`.`LOCK_TIME` AS `lock_latency`,`esc`.`ROWS_EXAMINED` AS `rows_examined`,`esc`.`ROWS_SENT` AS `rows_sent`,`esc`.`ROWS_AFFECTED` AS `rows_affected`,`esc`.`CREATED_TMP_TABLES` AS `tmp_tables`,`esc`.`CREATED_TMP_DISK_TABLES` AS `tmp_disk_tables`,if(((`esc`.`NO_GOOD_INDEX_USED` > 0) or (`esc`.`NO_INDEX_USED` > 0)),\'YES\',\'NO\') AS `full_scan`,`mem`.`current_allocated` AS `current_memory`,if((`esc`.`TIMER_WAIT` is not null),`esc`.`SQL_TEXT`,NULL) AS `last_statement`,if((`esc`.`TIMER_WAIT` is not null),`esc`.`TIMER_WAIT`,NULL) AS `last_statement_latency`,`ewc`.`EVENT_NAME` AS `last_wait`,if((isnull(`ewc`.`TIMER_WAIT`) and (`ewc`.`EVENT_NAME` is not null)),\'Still Waiting\',`ewc`.`TIMER_WAIT`) AS `last_wait_latency`,`ewc`.`SOURCE` AS `source` from (((`performance_schema`.`threads` `pps` left join `performance_schema`.`events_waits_current` `ewc` on((`pps`.`THREAD_ID` = `ewc`.`THREAD_ID`))) left join `performance_schema`.`events_statements_current` `esc` on((`pps`.`THREAD_ID` = `esc`.`THREAD_ID`))) left join `sys`.`x$memory_by_thread_by_current_bytes` `mem` on((`pps`.`THREAD_ID` = `mem`.`thread_id`))) order by `pps`.`PROCESSLIST_TIME` desc,`last_wait_latency` desc
md5=ae15161f183b94f1d6e3f35d18662007
updatable=0
algorithm=1
definer_user=root
definer_host=localhost
suid=0
with_check_option=0
timestamp=2017-12-19 13:11:24
create-version=1
source=SELECT pps.thread_id AS thd_id, pps.processlist_id AS conn_id, IF(pps.name = \'thread/sql/one_connection\',  CONCAT(pps.processlist_user, \'@\', pps.processlist_host),  REPLACE(pps.name, \'thread/\', \'\')) user, pps.processlist_db AS db, pps.processlist_command AS command, pps.processlist_state AS state, pps.processlist_time AS time, pps.processlist_info AS current_statement, esc.lock_time AS lock_latency, esc.rows_examined, esc.rows_sent, esc.rows_affected, esc.created_tmp_tables AS tmp_tables, esc.created_tmp_disk_tables AS tmp_disk_tables, IF(esc.no_good_index_used > 0 OR esc.no_index_used > 0,  \'YES\', \'NO\') AS full_scan, mem.current_allocated AS current_memory, IF(esc.timer_wait IS NOT NULL, esc.sql_text, NULL) AS last_statement, IF(esc.timer_wait IS NOT NULL, esc.timer_wait, NULL) AS last_statement_latency, ewc.event_name AS last_wait, IF(ewc.timer_wait IS NULL AND ewc.event_name IS NOT NULL,  \'Still Waiting\',  ewc.timer_wait) last_wait_latency, ewc.source FROM performance_schema.threads AS pps LEFT JOIN performance_schema.events_waits_current AS ewc USING (thread_id) LEFT JOIN performance_schema.events_statements_current AS esc USING (thread_id) LEFT JOIN sys.x$memory_by_thread_by_current_bytes AS mem USING (thread_id) ORDER BY pps.processlist_time DESC, last_wait_latency DESC
client_cs_name=utf8
connection_cl_name=utf8_general_ci
view_body_utf8=select `pps`.`THREAD_ID` AS `thd_id`,`pps`.`PROCESSLIST_ID` AS `conn_id`,if((`pps`.`NAME` = \'thread/sql/one_connection\'),concat(`pps`.`PROCESSLIST_USER`,\'@\',`pps`.`PROCESSLIST_HOST`),replace(`pps`.`NAME`,\'thread/\',\'\')) AS `user`,`pps`.`PROCESSLIST_DB` AS `db`,`pps`.`PROCESSLIST_COMMAND` AS `command`,`pps`.`PROCESSLIST_STATE` AS `state`,`pps`.`PROCESSLIST_TIME` AS `time`,`pps`.`PROCESSLIST_INFO` AS `current_statement`,`esc`.`LOCK_TIME` AS `lock_latency`,`esc`.`ROWS_EXAMINED` AS `rows_examined`,`esc`.`ROWS_SENT` AS `rows_sent`,`esc`.`ROWS_AFFECTED` AS `rows_affected`,`esc`.`CREATED_TMP_TABLES` AS `tmp_tables`,`esc`.`CREATED_TMP_DISK_TABLES` AS `tmp_disk_tables`,if(((`esc`.`NO_GOOD_INDEX_USED` > 0) or (`esc`.`NO_INDEX_USED` > 0)),\'YES\',\'NO\') AS `full_scan`,`mem`.`current_allocated` AS `current_memory`,if((`esc`.`TIMER_WAIT` is not null),`esc`.`SQL_TEXT`,NULL) AS `last_statement`,if((`esc`.`TIMER_WAIT` is not null),`esc`.`TIMER_WAIT`,NULL) AS `last_statement_latency`,`ewc`.`EVENT_NAME` AS `last_wait`,if((isnull(`ewc`.`TIMER_WAIT`) and (`ewc`.`EVENT_NAME` is not null)),\'Still Waiting\',`ewc`.`TIMER_WAIT`) AS `last_wait_latency`,`ewc`.`SOURCE` AS `source` from (((`performance_schema`.`threads` `pps` left join `performance_schema`.`events_waits_current` `ewc` on((`pps`.`THREAD_ID` = `ewc`.`THREAD_ID`))) left join `performance_schema`.`events_statements_current` `esc` on((`pps`.`THREAD_ID` = `esc`.`THREAD_ID`))) left join `sys`.`x$memory_by_thread_by_current_bytes` `mem` on((`pps`.`THREAD_ID` = `mem`.`thread_id`))) order by `pps`.`PROCESSLIST_TIME` desc,`last_wait_latency` desc
