SELECT count()
FROM (
        SELECT tuple(*)
        FROM t
    );