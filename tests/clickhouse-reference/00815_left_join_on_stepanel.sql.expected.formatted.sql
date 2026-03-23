CREATE TABLE fact_cpc_clicks
(
    model_id UInt8
)
ENGINE = Memory;

CREATE TABLE dim_model
(
    model_id UInt8
)
ENGINE = Memory;

INSERT INTO fact_cpc_clicks;

INSERT INTO dim_model;

SELECT f.model_id
FROM
    fact_cpc_clicks AS f
LEFT JOIN dim_model AS d
    ON f.model_id = d.model_id
LIMIT 10;

USE default;

SELECT f.model_id
FROM
    {CLICKHOUSE_DATABASE:Identifier}.fact_cpc_clicks AS f
LEFT JOIN {CLICKHOUSE_DATABASE:Identifier}.dim_model AS d
    ON f.model_id = d.model_id
LIMIT 10;