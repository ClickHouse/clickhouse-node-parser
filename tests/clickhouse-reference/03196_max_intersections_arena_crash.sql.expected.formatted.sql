SELECT
    start,
    `end`,
    maxIntersections(start, `end`) OVER ()
FROM my_events;

SELECT
    start,
    `end`,
    maxIntersectionsPosition(start, `end`) OVER ()
FROM my_events;