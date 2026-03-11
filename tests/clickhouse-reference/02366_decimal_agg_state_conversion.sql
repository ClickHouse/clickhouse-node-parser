select sumMerge(y) from 
(
  select cast(x, 'AggregateFunction(sum, Decimal(50, 10))') y from 
   (
     select arrayReduce('sumState', [toDecimal256('0.000001', 10), toDecimal256('1.1', 10)]) x
   )
);
select minMerge(y) from 
(
  select cast(x, 'AggregateFunction(min, Decimal(18, 10))') y from 
   (
     select arrayReduce('minState', [toDecimal64('0.000001', 10), toDecimal64('1.1', 10)]) x
   )
);
SELECT
    id,
    finalizeAggregation(dec)
FROM consumer_02366;
