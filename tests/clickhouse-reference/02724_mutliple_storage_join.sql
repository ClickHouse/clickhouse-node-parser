SELECT ignore(*) FROM (
    SELECT
        uId,
        user.id as `uuu`
    FROM order
    LEFT ANY JOIN user
    ON uId = `uuu`
);
SELECT ignore(*) FROM order
LEFT ANY JOIN user ON uId = user.id
LEFT ANY JOIN product ON pId = product.id;
