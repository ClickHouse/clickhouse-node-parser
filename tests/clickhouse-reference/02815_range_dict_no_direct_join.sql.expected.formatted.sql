SELECT
    id,
    amount
FROM
    ids
INNER JOIN discounts_dict
    ON id = advertiser_id
ORDER BY
    id ASC,
    amount ASC
SETTINGS join_algorithm = 'direct,hash';

SELECT
    id,
    amount
FROM
    ids
INNER JOIN discounts_dict
    ON id = advertiser_id
ORDER BY
    id ASC,
    amount ASC
SETTINGS join_algorithm = 'default';

SELECT
    id,
    amount
FROM
    ids
INNER JOIN discounts_dict
    ON id = advertiser_id
ORDER BY
    id ASC,
    amount ASC
SETTINGS join_algorithm = 'direct';