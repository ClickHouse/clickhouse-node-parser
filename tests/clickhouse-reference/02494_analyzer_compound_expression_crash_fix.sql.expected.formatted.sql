SET enable_analyzer = 1;

CREATE TABLE test_table
(
    fingerprint UInt16,
    fields Nested(name Array(UInt32), value String)
)
ENGINE = MergeTree
ORDER BY fingerprint;

INSERT INTO test_table;

SELECT fields.name
FROM (
        SELECT fields.name
        FROM test_table
    );

SELECT
    fields.name,
    fields.value
FROM (
        SELECT fields.name
        FROM test_table
    ); -- { serverError UNKNOWN_IDENTIFIER }