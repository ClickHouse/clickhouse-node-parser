SELECT
    count(),
    (quantile(0.9)(price) OVER ()) AS price_quantile
FROM uk_price_paid
WHERE toYear(date) = 2023
QUALIFY price > price_quantile;

SELECT count()
FROM uk_price_paid
WHERE toYear(date) = 2023
QUALIFY price > (quantile(0.9)(price) OVER ());