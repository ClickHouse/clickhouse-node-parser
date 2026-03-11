SELECT *
FROM requests
WHERE event_date > '2000-01-01';

SELECT *
FROM requests AS t
WHERE t.event_date > '2000-01-01';

SELECT *
FROM requests AS t
WHERE t.event_date > '2000-01-01';

SELECT *
FROM requests AS t
WHERE t.event_tm > toDate('2000-01-01');

SELECT *
FROM requests AS t
WHERE t.event_tm > toDate('2000-01-01');