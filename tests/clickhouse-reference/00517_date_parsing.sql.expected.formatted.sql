SELECT toDate(s)
FROM (
        SELECT arrayJoin(['2017-01-02', '2017-1-02', '2017-01-2', '2017-1-2', '2017/01/02', '2017/1/02', '2017/01/2', '2017/1/2', '2017-11-12']) AS s
    );

CREATE TABLE date
(
    d Date
)
ENGINE = Memory;

SELECT *
FROM date;

SELECT *
FROM date
ORDER BY d ASC;