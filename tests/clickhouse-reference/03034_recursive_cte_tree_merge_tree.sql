-- { echoOn }

SET enable_analyzer = 1;
CREATE TABLE tree
(
    id UInt64,
    link Nullable(UInt64),
    data String
) ENGINE=MergeTree ORDER BY ();
INSERT INTO tree VALUES (0, NULL, 'ROOT'), (1, 0, 'Child_1'), (2, 0, 'Child_2'), (3, 1, 'Child_1_1');
SELECT '--';
CREATE TABLE department (
    id UInt64,  -- department ID
    parent_department UInt64, -- upper department ID
    name String -- department name
)
ENGINE=MergeTree ORDER BY ();
INSERT INTO department VALUES (0, NULL, 'ROOT');
INSERT INTO department VALUES (1, 0, 'A');
INSERT INTO department VALUES (2, 1, 'B');
INSERT INTO department VALUES (3, 2, 'C');
INSERT INTO department VALUES (4, 2, 'D');
INSERT INTO department VALUES (5, 0, 'E');
INSERT INTO department VALUES (6, 4, 'F');
INSERT INTO department VALUES (7, 5, 'G');
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
