select f.model_id from fact_cpc_clicks as f left join dim_model as d on f.model_id=d.model_id limit 10;
select f.model_id from {CLICKHOUSE_DATABASE:Identifier}.fact_cpc_clicks as f left join {CLICKHOUSE_DATABASE:Identifier}.dim_model as d on f.model_id=d.model_id limit 10;
