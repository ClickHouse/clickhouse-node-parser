SET enable_full_text_index = 1;

CREATE TABLE tab
(
    s FixedString(37),
    INDEX idx s TYPE text(tokenizer = array())
)
ENGINE = MergeTree()
ORDER BY tuple();

SELECT count()
FROM tab
WHERE hasAllTokens(s, 'was');