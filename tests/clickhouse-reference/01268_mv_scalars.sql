create table src_table Engine=Memory as system.numbers;
CREATE MATERIALIZED VIEW dst_mv_1 Engine=Memory as select *, (SELECT count() FROM src_table) AS cnt FROM src_table;
select * from dst_mv_1 order by number;
CREATE TABLE dest_table (`Date` Date, `Id` UInt64, `Units` Float32) ENGINE = Memory;
create table left_table as dest_table;
create table right_table as dest_table;
CREATE MATERIALIZED VIEW dest_table_mv TO dest_table as select Date, Id, Units FROM (SELECT * FROM left_table) AS t1 INNER JOIN (WITH (SELECT DISTINCT Date FROM left_table LIMIT 1) AS dt SELECT * FROM right_table WHERE Date = dt) AS t2 USING (Date, Id);
select * from dest_table order by Date, Id, Units;
