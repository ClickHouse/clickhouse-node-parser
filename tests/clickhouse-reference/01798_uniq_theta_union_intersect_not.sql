select finalizeAggregation(uniqThetaUnion(a, b)), finalizeAggregation(a), finalizeAggregation(b) from (select arrayReduce('uniqThetaState',[]) as a, arrayReduce('uniqThetaState',[]) as b );
select finalizeAggregation(uniqThetaUnion(a, b)), finalizeAggregation(a), finalizeAggregation(b) from (select arrayReduce('uniqThetaState',[1,2]) as a, arrayReduce('uniqThetaState',[2,3,4]) as b );
select finalizeAggregation(uniqThetaUnion(a, b)), finalizeAggregation(a), finalizeAggregation(b) from (select arrayReduce('uniqThetaState',[2,3,4]) as a, arrayReduce('uniqThetaState',[1,2]) as b );
select finalizeAggregation(uniqThetaIntersect(a, b)), finalizeAggregation(a), finalizeAggregation(b) from (select arrayReduce('uniqThetaState',[]) as a, arrayReduce('uniqThetaState',[]) as b );
select finalizeAggregation(uniqThetaIntersect(a, b)), finalizeAggregation(a), finalizeAggregation(b) from (select arrayReduce('uniqThetaState',[1,2]) as a, arrayReduce('uniqThetaState',[2,3,4]) as b );
select finalizeAggregation(uniqThetaIntersect(a, b)), finalizeAggregation(a), finalizeAggregation(b) from (select arrayReduce('uniqThetaState',[2,3,4]) as a, arrayReduce('uniqThetaState',[1,2]) as b );
select finalizeAggregation(uniqThetaNot(a, b)), finalizeAggregation(a), finalizeAggregation(b) from (select arrayReduce('uniqThetaState',[]) as a, arrayReduce('uniqThetaState',[]) as b );
select finalizeAggregation(uniqThetaNot(a, b)), finalizeAggregation(a), finalizeAggregation(b) from (select arrayReduce('uniqThetaState',[1,2]) as a, arrayReduce('uniqThetaState',[2,3,4]) as b );
select finalizeAggregation(uniqThetaNot(a, b)), finalizeAggregation(a), finalizeAggregation(b) from (select arrayReduce('uniqThetaState',[2,3,4]) as a, arrayReduce('uniqThetaState',[1,2]) as b );
select finalizeAggregation(uniqThetaIntersect(a,b)), finalizeAggregation(a),finalizeAggregation(b) from 
(
select (uniqThetaStateIf(number, number>0)) as a, (uniqThetaStateIf(number, number>5)) as b 
from 
(select  number  FROM system.numbers LIMIT 10)
);
select finalizeAggregation(uniqThetaIntersect(uv2021,uv2022))/finalizeAggregation(uv2021),finalizeAggregation(uniqThetaIntersect(uv2021,uv2022)),finalizeAggregation(uv2021)
from
(
select uniqThetaMergeStateIf(uv,year='2021') as uv2021, uniqThetaMergeStateIf(uv,year='2022') as uv2022 
from test1
);
select finalizeAggregation(uniqThetaIntersect(uv2021,uv2022))/finalizeAggregation(uv2021),finalizeAggregation(uniqThetaIntersect(uv2021,uv2022)),finalizeAggregation(uv2021)
from
(
select uniqThetaStateIf(uv,year='2021') as uv2021, uniqThetaStateIf(uv,year='2022') as uv2022 
from test2
);
