SELECT 1
FROM (
        SELECT arrayJoin(if(empty(range(number)), [1], [2]))
        FROM numbers(1)
    );