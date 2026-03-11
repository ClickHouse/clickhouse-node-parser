SELECT count()
FROM buf
PREWHERE ts > toDateTime('2019-03-01 12:00:00')
    AND ts < toDateTime('2019-03-02 12:00:00');