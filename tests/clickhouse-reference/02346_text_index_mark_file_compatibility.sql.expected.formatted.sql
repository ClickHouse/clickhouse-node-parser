-- For tables with a text index, the merge may produce a corrupt .mrk file format
SET allow_experimental_full_text_index = 1;

SET use_query_condition_cache = 0;

CREATE TABLE tab
(
    i Int32,
    str String,
    INDEX inv_idx str TYPE text(tokenizer = 'splitByNonAlpha')
)
ENGINE = MergeTree
ORDER BY i
SETTINGS index_granularity_bytes = 0, min_bytes_for_wide_part = 0; -- avoid warning about non-adaptive granularity being incompatible with compact part format

SELECT count()
FROM tab
WHERE hasToken(str, 'aa'); -- this must not return an error