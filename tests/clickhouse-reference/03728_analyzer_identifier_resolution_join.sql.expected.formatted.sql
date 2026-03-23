SYSTEM DROP  TABLE IF EXISTS address;

SYSTEM DROP  TABLE IF EXISTS fact_click;

CREATE TABLE address
(
    email_address String,
    domain LowCardinality(String),
    first_name String,
    last_name String,
    country LowCardinality(String),
    esp UInt8,
    list_import_sid LowCardinality(String)
)
ENGINE = MergeTree
PRIMARY KEY (list_import_sid, country, esp, domain, email_address)
ORDER BY (list_import_sid, country, esp, domain, email_address)
SETTINGS index_granularity = 8192;

CREATE TABLE fact_click
(
    sid String,
    campaign_sid LowCardinality(String),
    campaign_batch_sid LowCardinality(String),
    email_address String
)
ENGINE = ReplacingMergeTree
ORDER BY (campaign_sid, campaign_batch_sid, sid)
SETTINGS index_granularity = 8192;

SET enable_analyzer = 1;

SYSTEM DROP  TABLE address;

SYSTEM DROP  TABLE fact_click;