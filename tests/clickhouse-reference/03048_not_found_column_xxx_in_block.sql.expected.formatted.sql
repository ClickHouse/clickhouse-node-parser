SELECT *
FROM
    ab_12_aaa AS aa
LEFT JOIN ab_12_bbb AS bb
    ON bb.id = aa.id
    AND bb._year = aa._year
WHERE bb.theyear >= 2019;