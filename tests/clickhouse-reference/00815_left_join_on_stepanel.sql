CREATE TABLE fact_cpc_clicks (model_id UInt8) ENGINE = Memory;
CREATE TABLE dim_model (model_id UInt8) ENGINE = Memory;
select f.model_id from fact_cpc_clicks as f left join dim_model as d on f.model_id=d.model_id limit 10;
USE default;
select f.model_id from {CLICKHOUSE_DATABASE:Identifier}.fact_cpc_clicks as f left join {CLICKHOUSE_DATABASE:Identifier}.dim_model as d on f.model_id=d.model_id limit 10;
