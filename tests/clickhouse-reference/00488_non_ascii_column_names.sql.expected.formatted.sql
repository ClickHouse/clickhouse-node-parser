CREATE TABLE non_ascii
(
    `привет` String,
    `мир` String
)
ENGINE = TinyLog;

SELECT `привет`
FROM non_ascii;

SELECT *
FROM non_ascii;