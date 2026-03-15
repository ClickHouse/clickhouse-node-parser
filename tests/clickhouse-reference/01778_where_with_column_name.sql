CREATE TABLE ttt01778 (`1` String, `2` INT) ENGINE = MergeTree() ORDER BY tuple();
select * from ttt01778 where 1=2; -- no server error
