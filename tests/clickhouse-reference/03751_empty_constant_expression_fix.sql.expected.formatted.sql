SELECT materialize(1)
    AND 0;

SELECT materialize(1)
    AND 1;

SELECT 1
    AND materialize(0);

SELECT materialize(1)
    OR 0;

SELECT materialize(0)
    OR 1;

SELECT materialize(toNullable(1))
    AND 0;

SELECT materialize(1)
    AND toNullable(0);

SELECT materialize(toLowCardinality(1))
    AND 0;

SELECT materialize(1)
    AND toLowCardinality(0);

SELECT ((materialize(16)
    AND ((toLowCardinality(-1)
    AND 16))
    AND 1
    AND ((-0.
    AND 255))
    AND 16))
    AND -1
    AND toNullable(16);