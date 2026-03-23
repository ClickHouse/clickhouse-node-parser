DROP TABLE IF EXISTS alter_00147;

SET allow_deprecated_syntax_for_merge_tree = 1;

CREATE TABLE alter_00147
(
    d Date DEFAULT toDate('2015-01-01'),
    n Nested(x String)
)
ENGINE = MergeTree(d, d, 8192);

INSERT INTO alter_00147 (`n.x`);

SELECT *
FROM alter_00147;

SELECT *
FROM
    alter_00147
ARRAY JOIN n;

SELECT *
FROM
    alter_00147
ARRAY JOIN n
WHERE like(n.x, '%Hello%');

ALTER TABLE alter_00147 ADD COLUMN `n.y` Array(UInt64);

INSERT INTO alter_00147 (`n.x`);

SELECT *
FROM alter_00147
ORDER BY n.x ASC;

SELECT *
FROM
    alter_00147
ARRAY JOIN n
ORDER BY n.x ASC;

SELECT *
FROM
    alter_00147
ARRAY JOIN n
WHERE like(n.x, '%Hello%')
ORDER BY n.x ASC;

DROP TABLE alter_00147;