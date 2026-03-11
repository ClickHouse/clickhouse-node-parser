SELECT id
FROM tt
PREWHERE and(greaterOrEquals(ts, toDateTime(1731506400)), lessOrEquals(ts, toDateTime(1731594420)));