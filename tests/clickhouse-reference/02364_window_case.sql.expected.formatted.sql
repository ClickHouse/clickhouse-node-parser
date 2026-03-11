SELECT multiIf(sum(number) OVER () > 0, number + 1, 0)
FROM numbers(10);