SELECT arrayJoin([5, 25]) IN (
        SELECT DISTINCT toUInt8(intDiv(number, 10))
        FROM numbers(300)
    );

SELECT arrayJoin([5, 25]) IN (
        SELECT DISTINCT toUInt8(intDiv(number, 10))
        FROM numbers(190)
    );

SELECT arrayJoin([5, 25]) IN (
        SELECT DISTINCT toUInt8(intDiv(number, 10))
        FROM numbers(200)
    );

SELECT arrayJoin([5, 25]) IN (
        SELECT DISTINCT toUInt8(intDiv(number, 10))
        FROM numbers(210)
    );

SELECT '---';