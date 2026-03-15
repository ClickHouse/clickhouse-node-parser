CREATE TABLE insert (i UInt64, s String, u UUID, d Date, t DateTime, a Array(UInt32)) ENGINE = Memory;
SELECT * FROM insert ORDER BY i;
-- Test the case where the VALUES are delimited by semicolon and a query follows
-- w/o newline. With most formats the query in the same line would be ignored or
-- lead to an error, but VALUES are an exception and support semicolon delimiter,
-- in addition to the newline.
create table if not exists t_306 (a int) engine Memory;
select 11111;
select * from t_306;
