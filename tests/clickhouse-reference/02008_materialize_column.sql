SET mutations_sync = 2;
CREATE TABLE tmp (x Int64) ENGINE = MergeTree() ORDER BY tuple() PARTITION BY tuple();
SELECT arraySort(groupArray(x)), arraySort(groupArray(s)) FROM tmp;
