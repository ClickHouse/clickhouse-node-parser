SELECT count() FROM t PREWHERE NOT ignore(a) WHERE b > 0;
SELECT sum(a) FROM t PREWHERE isNotNull(a) WHERE isNotNull(b) AND c > 0;
