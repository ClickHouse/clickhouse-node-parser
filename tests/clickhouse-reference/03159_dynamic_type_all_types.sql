SELECT dynamicType(d), d FROM t ORDER BY substring(dynamicType(d),1,1), length(dynamicType(d)), d;
SELECT dynamicType(d), d FROM t2 ORDER BY substring(dynamicType(d),1,1), length(dynamicType(d)), d;
SELECT uniqExact(dynamicType(d)) t_ FROM t;
SELECT uniqExact(dynamicType(d)) t_ FROM t2;
