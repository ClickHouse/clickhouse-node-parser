SELECT
    exp2(number),
    exp10(number),
    concat('test', number)
FROM numbers(64)
FORMAT Vertical;