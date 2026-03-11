SELECT iid IN (
        SELECT DISTINCT arrayJoin(dictGet(dict, 'children', id))
        FROM ids
    )
FROM (
        SELECT *
        FROM info
        WHERE (iid IN (
                SELECT DISTINCT arrayJoin(dictGet(dict, 'children', id))
                FROM ids
            ))
    );