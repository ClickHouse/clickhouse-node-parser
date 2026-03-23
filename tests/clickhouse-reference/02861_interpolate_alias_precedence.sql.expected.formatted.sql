CREATE TABLE `02861_interpolate`
(
    date Date,
    id String,
    f Int16
)
ENGINE = MergeTree()
ORDER BY (date);

INSERT INTO `02861_interpolate`;

SELECT
    date AS d,
    toNullable(f) AS f
FROM `02861_interpolate`
WHERE id = '1'
ORDER BY d ASC WITH FILL STEP toIntervalDay(1) INTERPOLATE (f);