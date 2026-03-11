SELECT ignore(*)
FROM (
        SELECT
            uId,
            user.id AS uuu
        FROM
            `order`
        LEFT JOIN user
            ON uId = uuu
    );

SELECT ignore(*)
FROM
    `order`
LEFT JOIN user
    ON uId = user.id
LEFT JOIN product
    ON pId = product.id;