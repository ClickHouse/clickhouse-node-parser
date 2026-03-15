CREATE TABLE null_table (str String) ENGINE = Null;
CREATE MATERIALIZED VIEW mv_table (str String) ENGINE = ReplicatedMergeTree('/clickhouse/tables/{database}/transactions_disabled_rmt', '{replica}') ORDER BY str AS SELECT str AS str FROM null_table;
set throw_on_unsupported_query_inside_transaction=0;
