-- Tags: no-fasttest
-- no-fasttest: 'countmin' sketches need a 3rd party library
SET allow_experimental_statistics = 1;

SET use_statistics = 1;

CREATE TABLE tab
(
    c Nullable(Int)
)
ENGINE = MergeTree()
ORDER BY tuple();

INSERT INTO tab (c);

INSERT INTO tab (c);

ALTER TABLE tab ADD STATISTICS c TYPE countmin;

SELECT 1
FROM tab
WHERE tab.c = 0;