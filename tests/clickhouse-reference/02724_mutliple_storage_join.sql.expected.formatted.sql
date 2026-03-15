CREATE TABLE user
(
    id UInt32,
    name String
)
ENGINE = Join(`ANY`, `LEFT`, id);

CREATE TABLE product
(
    id UInt32,
    name String,
    cate String
)
ENGINE = Join(`ANY`, `LEFT`, id);

CREATE TABLE `order`
(
    id UInt32,
    pId UInt32,
    uId UInt32
)
ENGINE = TinyLog;

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