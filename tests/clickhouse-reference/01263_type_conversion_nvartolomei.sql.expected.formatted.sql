SELECT *
FROM d;

SELECT '---';

SELECT toString(v)
FROM (
        SELECT v
        FROM d
        ORDER BY v ASC
    )
FORMAT Null; -- { serverError UNKNOWN_ELEMENT_OF_ENUM}