CREATE TABLE or_bug
(
    key UInt8
)
ENGINE = MergeTree
ORDER BY key;

-- { echoOn }
SELECT *
FROM or_bug
WHERE (key = 1)
    OR false
    OR false;

SELECT *
FROM or_bug
WHERE (key = 1)
    OR false;

SELECT *
FROM or_bug
WHERE (key = 1);

CREATE TABLE forms
(
    form_id FixedString(24),
    text_field String
)
ENGINE = MergeTree
ORDER BY form_id
PRIMARY KEY form_id;

-- { echoOn }
SELECT *
FROM forms
WHERE like(text_field, '%this%')
    OR 0 = 1
    OR 0 = 1;

SELECT *
FROM forms
WHERE like(text_field, '%this%')
    OR 0 = 1;

SELECT *
FROM forms
WHERE like(text_field, '%this%');