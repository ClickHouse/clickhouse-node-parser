SET enable_full_text_index = 1;

SYSTEM DROP  TABLE IF EXISTS tab;

CREATE TABLE tab
(
    col Array(String),
    INDEX idx col TYPE text(tokenizer = `array`)
)
ENGINE = MergeTree()
ORDER BY tuple() AS
SELECT [];

SELECT *
FROM tab
WHERE hasAllTokens(col, 'abc');

SYSTEM DROP  TABLE tab;