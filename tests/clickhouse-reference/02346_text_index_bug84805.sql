SET enable_full_text_index = 1;
DROP TABLE IF EXISTS tab;
CREATE TABLE tab (
    str String,
    INDEX idx str TYPE text(tokenizer = 'array') )
ENGINE = MergeTree()
ORDER BY tuple();
INSERT INTO TABLE tab (str) VALUES ('');
DROP TABLE tab;
CREATE TABLE tab (
    str String,
    INDEX idx str TYPE text(tokenizer = 'ngrams') )
ENGINE = MergeTree()
ORDER BY tuple();
