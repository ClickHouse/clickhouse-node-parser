SELECT COUNT(*) FROM test.hits WHERE AdvEngineID <> 0 FORMAT Null SETTINGS log_comment='query_1';
-- Unsupported at the moment, refer to comments in `RuntimeDataflowStatisticsCacheUpdater::recordAggregationStateSizes`
-- SELECT COUNT(DISTINCT SearchPhrase) FROM test.hits FORMAT Null SETTINGS log_comment='query_5';

SELECT MobilePhoneModel, COUNT(DISTINCT UserID) AS u FROM test.hits WHERE MobilePhoneModel <> '' GROUP BY MobilePhoneModel ORDER BY u DESC LIMIT 10 FORMAT Null SETTINGS log_comment='query_10';
SELECT SearchPhrase, COUNT(*) AS c FROM test.hits WHERE SearchPhrase <> '' GROUP BY SearchPhrase ORDER BY c DESC LIMIT 10 FORMAT Null SETTINGS log_comment='query_12';
SELECT UserID, COUNT(*) FROM test.hits GROUP BY UserID ORDER BY COUNT(*) DESC LIMIT 10 FORMAT Null SETTINGS log_comment='query_15';
SELECT COUNT(*) FROM test.hits WHERE URL LIKE '%google%' FORMAT Null SETTINGS log_comment='query_20';
SELECT SearchPhrase, MIN(URL), COUNT(*) AS c FROM test.hits WHERE URL LIKE '%google%' AND SearchPhrase <> '' GROUP BY SearchPhrase ORDER BY c DESC LIMIT 10 FORMAT Null SETTINGS log_comment='query_21';
SELECT SearchPhrase, MIN(URL), MIN(Title), COUNT(*) AS c, COUNT(DISTINCT UserID) FROM test.hits WHERE Title LIKE '%Google%' AND URL NOT LIKE '%.google.%' AND SearchPhrase <> '' GROUP BY SearchPhrase ORDER BY c DESC LIMIT 10 FORMAT Null SETTINGS log_comment='query_22';
SELECT * FROM test.hits WHERE URL LIKE '%google%' ORDER BY EventTime LIMIT 10 FORMAT Null SETTINGS log_comment='query_23';
SELECT REGEXP_REPLACE(Referer, '^https?://(?:www\.)?([^/]+)/.*$', '\1') AS k, AVG(length(Referer)) AS l, COUNT(*) AS c, MIN(Referer) FROM test.hits WHERE Referer <> '' GROUP BY k HAVING COUNT(*) > 100000 ORDER BY l DESC LIMIT 25 FORMAT Null SETTINGS log_comment='query_28';
SELECT 1, URL, COUNT(*) AS c FROM test.hits GROUP BY 1, URL ORDER BY c DESC LIMIT 10 FORMAT Null SETTINGS log_comment='query_34';
SELECT URL from test.hits WHERE URL LIKE '%yandex%' ORDER BY URL DESC FORMAT Null SETTINGS log_comment='query_43';
