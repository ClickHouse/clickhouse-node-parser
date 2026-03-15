CREATE TABLE t1
(
    c1 DateTime DEFAULT now() NOT NULL,
    c2 DateTime DEFAULT now() NOT NULL,
    c3 DateTime DEFAULT now() NOT NULL,
    PRIMARY KEY(c1, c2, c3)
) ENGINE = MergeTree()
ORDER BY (c1, c2, c3);
CREATE TABLE t1 (n int, dt DateTime) ENGINE=Memory;
SET input_format_values_interpret_expressions=0;
SELECT * FROM t1 ORDER BY n;
