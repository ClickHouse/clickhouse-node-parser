SELECT
    a,
    sipHash64(a)
FROM x
ORDER BY sipHash64(a) ASC;

SELECT
    a,
    sipHash64(a)
FROM x
ORDER BY `sipHash64(a)` ASC;