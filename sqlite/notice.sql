PRAGMA foreign_keys = ON;

CREATE TABLE pv (
  [pv_name] NVARCHAR NOT NULL PRIMARY KEY,
  [delay] INTEGER DEFAULT 5,
  [group_name] NVARCHAR REFERENCES alarm_group(alarm_group_name),
  [ioc] NOT NULL REFERENCES ioc(ioc_name),
  [hihi-email] BOOLEAN DEFAULT 1,
  [hihi-phone] BOOLEAN DEFAULT 1,
  [hihi-weixin] BOOLEAN DEFAULT 1,
  [high-email] BOOLEAN DEFAULT 1,
  [high-phone] BOOLEAN DEFAULT 1,
  [high-weixin] BOOLEAN DEFAULT 1,
  [timeout-email] BOOLEAN DEFAULT 1,
  [timeout-phone] BOOLEAN DEFAULT 1,
  [timeout-weixin] BOOLEAN DEFAULT 1,
  [disconnect-email] BOOLEAN DEFAULT 1,
  [disconnect-phone] BOOLEAN DEFAULT 1,
  [disconnect-weixin] BOOLEAN DEFAULT 1
);

CREATE TABLE ioc (
  [ioc_name] NVARCHAR PRIMARY KEY
);

CREATE TABLE operator (
  [operator_name] NVARCHAR PRIMARY KEY,
  [operator_name_zh] NVARCHAR,
  [email] NVARCHAR,
  [phone] NVARCHAR NOT NULL,
  [weixin_id] NVARCHAR
);

CREATE TABLE alarm_group (
  [alarm_group_name] NVARCHAR PRIMARY KEY
);

CREATE TABLE monitor (
  [monitor_id] INTEGER PRIMARY KEY autoincrement,
  [group_name] NOT NULL REFERENCES alarm_group(alarm_group_name),
  [operator_name] NOT NULL REFERENCES operator(operator_name),
  UNIQUE (group_name, operator_name)
);


-- insert data
-- insert 4 iocs
INSERT INTO ioc (ioc_name) VALUES ('alarmtestA');
INSERT INTO ioc (ioc_name) VALUES ('alarmtestB');
INSERT INTO ioc (ioc_name) VALUES ('alarmtestC');
INSERT INTO ioc (ioc_name) VALUES ('alarmtestD');
-- insert 3 groups
INSERT INTO alarm_group (alarm_group_name) VALUES ('group1');
INSERT INTO alarm_group (alarm_group_name) VALUES ('group2');
INSERT INTO alarm_group (alarm_group_name) VALUES ('group3');
-- insert 3 operators
INSERT INTO operator(operator_name, operator_name_zh, email, phone, weixin_id) VALUES ('ZhangSan', '张三', 'zhangsan@here', '1111', 'ZhangSan');
INSERT INTO operator(operator_name, operator_name_zh, email, phone, weixin_id) VALUES ('LiSi', '李四', 'lisi@here', '2222', 'LiSi');
INSERT INTO operator(operator_name, operator_name_zh, email, phone, weixin_id) VALUES ('WangWu', '王五', 'wanwu@here', '3333', 'WangWu');
-- insert 16 pvs
-- ioc 1
INSERT INTO pv (pv_name, delay, ioc, group_name) VALUES ('alarm:test:A:ai01', 10, 'alarmtestA','group1');
INSERT INTO pv (pv_name, delay, ioc, group_name) VALUES ('alarm:test:A:ai02', 10, 'alarmtestA','group1');
INSERT INTO pv (pv_name, delay, ioc, group_name) VALUES ('alarm:test:A:ai03', 10, 'alarmtestA','group1');
INSERT INTO pv (pv_name, delay, ioc, group_name) VALUES ('alarm:test:A:ai04', 10, 'alarmtestA','group1');
INSERT INTO pv (pv_name, delay, ioc, group_name) VALUES ('alarm:test:A:ai05', 10, 'alarmtestA','group1');
-- ioc 2
INSERT INTO pv (pv_name, delay, ioc, group_name) VALUES ('alarm:test:B:ai01', 10, 'alarmtestB','group1');
INSERT INTO pv (pv_name, delay, ioc, group_name) VALUES ('alarm:test:B:ai02', 10, 'alarmtestB','group1');
INSERT INTO pv (pv_name, delay, ioc, group_name) VALUES ('alarm:test:B:ai03', 10, 'alarmtestB','group1');
INSERT INTO pv (pv_name, delay, ioc, group_name) VALUES ('alarm:test:B:ai04', 10, 'alarmtestB','group1');
INSERT INTO pv (pv_name, delay, ioc, group_name) VALUES ('alarm:test:B:ai05', 10, 'alarmtestB','group1');
-- ioc3
INSERT INTO pv (pv_name, delay, ioc, group_name) VALUES ('alarm:test:C:ai01', 10, 'alarmtestC','group2');
INSERT INTO pv (pv_name, delay, ioc, group_name) VALUES ('alarm:test:C:ai02', 10, 'alarmtestC','group2');
INSERT INTO pv (pv_name, delay, ioc, group_name) VALUES ('alarm:test:C:ai03', 10, 'alarmtestC','group2');
INSERT INTO pv (pv_name, delay, ioc, group_name) VALUES ('alarm:test:C:ai04', 10, 'alarmtestC','group2');
INSERT INTO pv (pv_name, delay, ioc, group_name) VALUES ('alarm:test:C:ai05', 10, 'alarmtestC','group2');
-- ioc4
INSERT INTO pv (pv_name, delay, ioc, group_name) VALUES ('alarm:test:D:ai', 0, 'alarmtestD','group3');
-- insert 5 monitor
INSERT INTO monitor (group_name, operator_name) VALUES ('group1', 'ZhangSan');
INSERT INTO monitor (group_name, operator_name) VALUES ('group1', 'WangWu');
INSERT INTO monitor (group_name, operator_name) VALUES ('group2', 'LiSi');
INSERT INTO monitor (group_name, operator_name) VALUES ('group2', 'WangWu');
INSERT INTO monitor (group_name, operator_name) VALUES ('group3', 'ZhangSan');
INSERT INTO monitor (group_name, operator_name) VALUES ('group3', 'LiSi');
INSERT INTO monitor (group_name, operator_name) VALUES ('group3', 'WangWu');

