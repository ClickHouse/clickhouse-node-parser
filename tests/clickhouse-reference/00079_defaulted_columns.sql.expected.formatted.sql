CREATE TABLE defaulted
(
    col1 DEFAULT 0
)
ENGINE = Memory;

CREATE TABLE defaulted
(
    col1 UInt32,
    col2 DEFAULT col1 + 1,
    col3 MATERIALIZED col1 + 2,
    col4 ALIAS col1 + 3
)
ENGINE = Memory;

INSERT INTO defaulted (col1);

SELECT *
FROM defaulted;

SELECT
    col3,
    col4
FROM defaulted;

CREATE TABLE defaulted
(
    col1 Int8,
    col2 UInt64 DEFAULT (
        SELECT dummy + 99
        FROM `system`.one
    )
)
ENGINE = Memory; --{serverError THERE_IS_NO_DEFAULT_VALUE}

SET allow_deprecated_syntax_for_merge_tree = 1;

CREATE TABLE defaulted
(
    payload String,
    date MATERIALIZED today(),
    key MATERIALIZED 0 * rand()
)
ENGINE = MergeTree(date, key, 8192);

INSERT INTO defaulted (payload);

SELECT
    *,
    payload_length
FROM defaulted;

INSERT INTO defaulted (payload);

SELECT
    *,
    payload_length
FROM defaulted
ORDER BY payload ASC;

SELECT *
FROM defaulted
ORDER BY payload ASC;