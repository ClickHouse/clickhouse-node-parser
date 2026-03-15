CREATE TABLE IF NOT EXISTS defaults
(
    param1 Float64,
    param2 Float64,
    target Float64,
    predict1 Float64,
    predict2 Float64
) ENGINE = Memory;
create table model engine = Memory as select stochasticLinearRegressionState(0.03, 0.00001, 2, 'Momentum')(target, param1, param2) as state from defaults;
select ans > -67.0 and ans < -66.9 from
(with (select state + state + state from model) as model select evalMLMethod(model, predict1, predict2) as ans from defaults order by all limit 1);
