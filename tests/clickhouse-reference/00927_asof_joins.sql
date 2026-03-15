CREATE TABLE md(key UInt32, t DateTime, bid Float64, ask Float64) ENGINE = MergeTree() ORDER BY (key, t);
CREATE TABLE tv(key UInt32, t DateTime, tv Float64) ENGINE = MergeTree() ORDER BY (key, t);
SELECT tv.key, toString(tv.t, 'UTC'), md.bid, tv.tv, md.ask FROM tv ASOF LEFT JOIN md USING(key,t) ORDER BY (tv.key, tv.t)
;
SELECT tv.key, toString(tv.t, 'UTC'), md.bid, tv.tv, md.ask FROM tv ASOF LEFT JOIN md USING(key,t) ORDER BY (tv.key, tv.t)
SETTINGS join_algorithm = 'full_sorting_merge';
