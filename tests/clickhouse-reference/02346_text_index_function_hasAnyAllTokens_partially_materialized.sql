SET enable_full_text_index = 1;
SET parallel_replicas_local_plan = 1; -- this setting may skip index analysis when false
SET use_skip_indexes_on_data_read = 0;
SET mutations_sync = 2; -- want synchronous materialize
CREATE TABLE tab
(
    id UInt32,
    message String,
)
ENGINE = MergeTree
ORDER BY (id) SETTINGS index_granularity = 2;
CREATE VIEW explain_indexes
AS SELECT trimLeft(explain) AS explain
FROM
(
  SELECT *
    FROM viewExplain('EXPLAIN', 'indexes = 1', (
        SELECT groupArray(id) FROM tab WHERE hasAnyTokens(message, ['def'])
    ))
)
WHERE (explain LIKE '%Name%') OR (explain LIKE '%Description%') OR (explain LIKE '%Parts%') OR (explain LIKE '%Granules%') OR (explain LIKE '%Range%');
-- { echoOn }
SELECT * FROM explain_indexes;
--
--hasAnyTokens:
SELECT arraySort(groupArray(id)) FROM tab WHERE hasAnyTokens(message, ['foo']);
SELECT arraySort(groupArray(id)) FROM tab WHERE hasAnyTokens(message, ['bar']);
SELECT arraySort(groupArray(id)) FROM tab WHERE hasAnyTokens(message, ['foo', 'bar']);
SELECT arraySort(groupArray(id)) FROM tab WHERE hasAnyTokens(message, ['foo', 'ba']);
SELECT arraySort(groupArray(id)) FROM tab WHERE hasAnyTokens(message, ['fo', 'ba']);
--
--hasAllTokens:
SELECT arraySort(groupArray(id)) FROM tab WHERE hasAllTokens(message, ['foo']);
SELECT arraySort(groupArray(id)) FROM tab WHERE hasAllTokens(message, ['bar']);
SELECT arraySort(groupArray(id)) FROM tab WHERE hasAllTokens(message, ['foo', 'bar']);
SELECT arraySort(groupArray(id)) FROM tab WHERE hasAllTokens(message, ['abc', 'fo']);
SELECT arraySort(groupArray(id)) FROM tab WHERE hasAnyTokens(message, ['bar$']); -- test default tokenizer
SELECT arraySort(groupArray(id)) FROM tab WHERE hasAnyTokens(message, tokens('bar$', 'splitByNonAlpha'));
SELECT arraySort(groupArray(id)) FROM tab WHERE hasAllTokens(message, ['bar$']); -- test default tokenizer
SELECT arraySort(groupArray(id)) FROM tab WHERE hasAllTokens(message, tokens('bar$', 'splitByNonAlpha'));
