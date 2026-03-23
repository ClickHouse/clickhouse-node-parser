SYSTEM DROP  TABLE IF EXISTS non_ascii;

CREATE TABLE non_ascii
(
    `привет` String,
    `мир` String
)
ENGINE = TinyLog;

INSERT INTO non_ascii;

SELECT `привет`
FROM non_ascii;

SELECT *
FROM non_ascii;

SYSTEM DROP  TABLE non_ascii;