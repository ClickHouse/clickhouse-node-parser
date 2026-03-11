SELECT * APPLY(sum)
FROM columns_transformers;

SELECT * APPLY(sum)
FROM columns_transformers;

SELECT columns_transformers.* APPLY(avg)
FROM columns_transformers;

SELECT a.* APPLY(toDate) APPLY(`any`)
FROM columns_transformers AS a;

SELECT COLUMNS('[jk]') APPLY(toString) APPLY(length)
FROM columns_transformers;

SELECT * EXCEPT (i) APPLY(sum)
FROM columns_transformers;

SELECT columns_transformers.* EXCEPT (j) APPLY(avg)
FROM columns_transformers;

SELECT a.* APPLY(toDate) EXCEPT (i, j) APPLY(`any`)
FROM columns_transformers AS a;

SELECT * EXCEPT STRICT (i)
FROM columns_transformers;

SELECT * EXCEPT STRICT (i, j)
FROM columns_transformers;

SELECT
    * EXCEPT STRICT (i),
    j1
FROM columns_transformers;

SELECT * EXCEPT STRICT (i, j1)
FROM columns_transformers;

SELECT * REPLACE STRICT (i + 1 AS i)
FROM columns_transformers;

SELECT * REPLACE STRICT (i + 1 AS col)
FROM columns_transformers;

SELECT * REPLACE (i + 1 AS i) APPLY(sum)
FROM columns_transformers;

SELECT columns_transformers.* REPLACE (j + 2 AS j, i + 1 AS i) APPLY(avg)
FROM columns_transformers;

SELECT columns_transformers.* REPLACE (j + 1 AS j, j + 2 AS j) APPLY(avg)
FROM columns_transformers;

SELECT a.* APPLY(toDate) REPLACE (i + 1 AS i) APPLY(`any`)
FROM columns_transformers AS a;

SELECT a.* APPLY(toDate) REPLACE STRICT (i + 1 AS i) APPLY(`any`)
FROM columns_transformers AS a;

SELECT COLUMNS(i, j, k) APPLY(sum)
FROM columns_transformers;

SELECT
    i,
    j,
    COLUMNS(i, j, k) APPLY(toFloat64),
    COLUMNS(i, j) EXCEPT (i)
FROM columns_transformers;

SELECT COLUMNS(i, j, k) APPLY(quantiles(0.5))
FROM columns_transformers;