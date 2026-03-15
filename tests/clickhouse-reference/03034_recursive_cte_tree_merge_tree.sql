-- { echoOn }

SET enable_analyzer = 1;
CREATE TABLE tree
(
    id UInt64,
    link Nullable(UInt64),
    data String
) ENGINE=MergeTree ORDER BY ();
SELECT '--';
CREATE TABLE department (
    id UInt64,  -- department ID
    parent_department UInt64, -- upper department ID
    name String -- department name
)
ENGINE=MergeTree ORDER BY ();
-- corner case in which sub-WITH gets initialized first
SELECT * FROM
(
  WITH RECURSIVE q AS (
        SELECT * FROM department
      UNION ALL
        (WITH x AS (SELECT * FROM q)
        SELECT * FROM x)
      )
  SELECT * FROM q LIMIT 24
) ORDER BY id, parent_department, name;
SELECT * FROM
(
  WITH RECURSIVE q AS (
        SELECT * FROM department
      UNION ALL
        (WITH RECURSIVE x AS (
            SELECT * FROM department
          UNION ALL
            (SELECT * FROM q UNION ALL SELECT * FROM x)
          )
        SELECT * FROM x)
      )
  SELECT * FROM q LIMIT 32
) ORDER BY id, parent_department, name;
