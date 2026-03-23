SELECT [[[[],[]]]];

SELECT [[1], []];

SELECT [[[[],['']]]];

SELECT concat([], ['Hello'], []);

SELECT
    arrayPushBack([], 1),
    arrayPushFront([[]], []);

CREATE TABLE arr
(
    x Array(String),
    y Nullable(String),
    z Array(Array(Nullable(String)))
)
ENGINE = TinyLog;

INSERT INTO arr SELECT
    [],
    NULL,
    [[], [NULL], [NULL, 'Hello']];

SELECT *
FROM arr;