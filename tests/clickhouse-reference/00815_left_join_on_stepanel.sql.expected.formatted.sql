SELECT f.model_id
FROM
    fact_cpc_clicks AS f
LEFT JOIN dim_model AS d
    ON f.model_id = d.model_id
LIMIT 10;

SELECT f.model_id
FROM
    {CLICKHOUSE_DATABASE:Identifier}.fact_cpc_clicks AS f
LEFT JOIN {CLICKHOUSE_DATABASE:Identifier}.dim_model AS d
    ON f.model_id = d.model_id
LIMIT 10;