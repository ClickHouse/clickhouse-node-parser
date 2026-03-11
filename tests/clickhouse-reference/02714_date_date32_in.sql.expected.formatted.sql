SELECT toDate32('2020-01-01') IN (toDate('2020-01-01'));

SELECT toDate('2020-01-01') IN (toDate32('2020-01-01'));

SELECT toDate('2020-01-01') IN (1::Int64);

SELECT toDate32('2020-01-01') IN (1::UInt64);