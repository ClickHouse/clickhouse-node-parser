-- Tags: stateful, race
SYSTEM drop  table if exists dest00153;

CREATE TEMPORARY TABLE dest00153
(
    s AggregateFunction(groupUniqArray, String)
)
ENGINE = Memory;

INSERT INTO dest00153 SELECT groupUniqArrayState(RefererDomain)
FROM test.hits
GROUP BY URLDomain;