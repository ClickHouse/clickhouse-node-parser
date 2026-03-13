-- partial
SELECT groupArray(dt)
FROM date_datetime_key_condition
WHERE dt > toDate('2020-01-01')
    AND dt < toDate('2020-01-02');

SELECT groupArray(dt)
FROM date_datetime_key_condition
WHERE dt >= toDate('2020-01-02');

SELECT groupArray(dt)
FROM date_datetime_key_condition
WHERE dt < toDate('2020-01-02');

-- inside
SELECT groupArray(dt)
FROM date_datetime_key_condition
WHERE dt > toDate('2019-01-02');

SELECT groupArray(dt)
FROM date_datetime_key_condition
WHERE dt < toDate('2021-01-02');

SELECT groupArray(dt)
FROM date_datetime_key_condition
WHERE dt >= toDate('2019-01-02')
    AND dt < toDate('2021-01-02');

SELECT groupArray(dt)
FROM date_datetime_key_condition
WHERE dt > toDate('2019-01-02')
    OR dt <= toDate('2021-01-02');

-- outside
SELECT groupArray(dt)
FROM date_datetime_key_condition
WHERE dt < toDate('2019-01-02');

SELECT groupArray(dt)
FROM date_datetime_key_condition
WHERE dt > toDate('2021-01-02');

SELECT groupArray(dt)
FROM date_datetime_key_condition
WHERE dt < toDate('2019-01-02')
    OR dt > toDate('2021-01-02');