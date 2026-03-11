SELECT (arrayJoin(['hello', 'world']) AS s) IN set, s;
SELECT k, x FROM (SELECT arrayJoin([1, 2]) AS k) js1 ANY LEFT JOIN join USING k ORDER BY ALL;
