CREATE TABLE set (x String) ENGINE = Memory;
INSERT INTO set VALUES ('hello');
SELECT (arrayJoin(['hello', 'world']) AS s) IN set, s;
CREATE TABLE set (x String) ENGINE = Set;
CREATE TABLE join (k UInt8, x String) ENGINE = Memory;
INSERT INTO join VALUES (1, 'hello');
SELECT k, x FROM (SELECT arrayJoin([1, 2]) AS k) js1 ANY LEFT JOIN join USING k ORDER BY ALL;
CREATE TABLE join (k UInt8, x String) ENGINE = Join(ANY, LEFT, k);
