-- Tags: no-fasttest
-- no-fasttest: 'countmin' sketches need a 3rd party library

SET allow_experimental_statistics = 1;
SET use_statistics = 1;
CREATE TABLE tab (c Nullable(Int)) ENGINE = MergeTree() ORDER BY tuple();
INSERT INTO tab (c) VALUES (1);
INSERT INTO tab (c) VALUES (2);
SELECT 1 FROM tab WHERE tab.c = 0;
