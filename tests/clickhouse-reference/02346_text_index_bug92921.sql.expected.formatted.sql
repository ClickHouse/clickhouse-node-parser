SET enable_full_text_index = 1;

CREATE TABLE tab
(
    s Array(String),
    INDEX idx s TYPE text(tokenizer = sparseGrams),
    PROJECTION p (    SELECT s
    ORDER BY s ASC)
)
ENGINE = MergeTree()
ORDER BY tuple();