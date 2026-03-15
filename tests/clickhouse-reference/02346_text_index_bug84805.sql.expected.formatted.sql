SET enable_full_text_index = 1;

CREATE TABLE tab
(
    str String,
    INDEX idx str TYPE text(tokenizer = 'array')
)
ENGINE = MergeTree()
ORDER BY tuple();

CREATE TABLE tab
(
    str String,
    INDEX idx str TYPE text(tokenizer = 'ngrams')
)
ENGINE = MergeTree()
ORDER BY tuple();