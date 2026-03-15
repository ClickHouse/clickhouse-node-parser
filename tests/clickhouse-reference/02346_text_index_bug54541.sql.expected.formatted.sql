-- Test for AST Fuzzer crash #54541
SET enable_full_text_index = 1;

CREATE TABLE tab
(
    id UInt32,
    str String,
    INDEX idx str TYPE text(tokenizer = 'splitByNonAlpha')
)
ENGINE = MergeTree
ORDER BY id;

SELECT *
FROM tab
WHERE str == 'b'
    AND 1.0;