SELECT '--';
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
