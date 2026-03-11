SELECT *
FROM
    view((
        SELECT *
        FROM
            sales
        LEFT JOIN distributor
            ON distributor.id = sales.distributor
    )) AS newSales
LEFT JOIN product
    ON product.id = newSales.product
SETTINGS enable_analyzer = 1;