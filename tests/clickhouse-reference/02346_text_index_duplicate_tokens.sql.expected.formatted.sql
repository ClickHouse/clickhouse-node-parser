-- Tags: no-parallel-replicas
-- Tests queries with duplicate tokens against a text index
DROP TABLE IF EXISTS tab;

SET enable_analyzer = 1;

SET enable_full_text_index = 1;

SET use_skip_indexes_on_data_read = 1;

SET query_plan_text_index_add_hint = 1;

SET optimize_rewrite_like_perfect_affix = 1;

SET optimize_or_like_chain = 0;

CREATE TABLE tab
(
    s String,
    INDEX idx_s s TYPE text(tokenizer = ngrams(3), preprocessor = lower(s))
)
ENGINE = MergeTree
ORDER BY tuple();

INSERT INTO tab (s);

SELECT count()
FROM tab
WHERE like(s, '%Hello%')
    OR like(s, '%hello%');

SELECT trim(`explain`)
FROM (
        EXPLAIN actions = 1
        SELECT count()
        FROM tab
        WHERE like(s, '%Hello%')
            OR like(s, '%hello%')
        SETTINGS use_skip_indexes_on_data_read = 1
    )
WHERE like(`explain`, '%Filter column%');

DROP TABLE tab;

CREATE TABLE tab
(
    s String,
    INDEX idx_s s TYPE text(tokenizer = splitByNonAlpha, preprocessor = lower(s))
)
ENGINE = MergeTree
ORDER BY tuple();

SELECT count()
FROM tab
WHERE like(s, 'Hello,%')
    OR like(s, 'hello,%');

SELECT trim(`explain`)
FROM (
        EXPLAIN actions = 1, indexes = 1
        SELECT count()
        FROM tab
        WHERE like(s, 'Hello,%')
            OR like(s, 'hello,%')
        SETTINGS use_skip_indexes_on_data_read = 1
    )
WHERE like(`explain`, '%Filter column%');