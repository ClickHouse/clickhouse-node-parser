SELECT hex(approx_top_sumState(3)(['str'], 1));

SELECT hex(approx_top_kState(3)(['str']));

SELECT hex(topKState(3)(['str']));

SELECT hex(topKWeightedState(3)(['str'], 1));

SELECT hex(maxDistinctState(['str']));

SELECT hex(argMaxDistinctState(['str'], ['str']));

SELECT hex(groupUniqArrayState(['str']));

SELECT hex(groupArrayIntersectState(['str']));

SELECT hex(maxDistinctState(tuple('str', true)));

SELECT hex(maxDistinctState(tuple('str', 42::Int8)));

SELECT hex(maxDistinctState(tuple('str', 42::UInt8)));

SELECT hex(maxDistinctState(tuple('str', 42::Int16)));

SELECT hex(maxDistinctState(tuple('str', 42::UInt16)));

SELECT hex(maxDistinctState(tuple('str', 42::Int32)));

SELECT hex(maxDistinctState(tuple('str', 42::UInt32)));

SELECT hex(maxDistinctState(tuple('str', 42::Int64)));

SELECT hex(maxDistinctState(tuple('str', 42::UInt64)));

SELECT hex(maxDistinctState(tuple('str', 42::Int128)));

SELECT hex(maxDistinctState(tuple('str', 42::UInt128)));

SELECT hex(maxDistinctState(tuple('str', 42::Int256)));

SELECT hex(maxDistinctState(tuple('str', 42::UInt256)));

SELECT hex(maxDistinctState(tuple('str', 42.42::BFloat16)));

SELECT hex(maxDistinctState(tuple('str', 42.42::Float32)));

SELECT hex(maxDistinctState(tuple('str', 42.42::Float64)));

SELECT hex(maxDistinctState(tuple('str', 42.42::Decimal32(2))));

SELECT hex(maxDistinctState(tuple('str', 42.42::Decimal64(2))));

SELECT hex(maxDistinctState(tuple('str', 42.42::Decimal128(2))));

SELECT hex(maxDistinctState(tuple('str', 42.42::Decimal256(2))));

SELECT hex(maxDistinctState(tuple('str', 'str'::Nullable(String))));

SELECT hex(maxDistinctState(tuple('str', 'str'::FixedString(3))));

SELECT hex(maxDistinctState(tuple('str', 'str'::Nullable(FixedString(3)))));

SELECT hex(maxDistinctState(tuple('str', 'str'::LowCardinality(String))));

SELECT hex(maxDistinctState(tuple('str', 'str'::LowCardinality(Nullable(String)))));

SELECT hex(maxDistinctState(tuple('str', 'str'::LowCardinality(FixedString(3)))));

SELECT hex(maxDistinctState(tuple('str', 'str'::LowCardinality(Nullable(FixedString(3))))));

SELECT hex(maxDistinctState(tuple('str', ['str'])));

SELECT hex(maxDistinctState(tuple('str', map('str', 'str'))));

SELECT hex(maxDistinctState(tuple('str', tuple('str'))));

SELECT hex(maxDistinctState(tuple('str', '{"str" : "str"}'::JSON)));

SELECT hex(maxDistinctState(tuple('str', '{"str" : "str"}'::JSON(max_dynamic_paths=0))));

SELECT hex(maxDistinctState(tuple('str', '{"str" : "str"}'::JSON(str String))));

SELECT hex(maxDistinctState(tuple('str', 'str'::Variant(String))));

SELECT hex(maxDistinctState(tuple('str', 'str'::Dynamic)));

SELECT hex(maxDistinctState(tuple('str', 'str'::Dynamic(max_types=0))));

SELECT hex(maxDistinctState(tuple('str', '59cd9014-8730-444c-95d0-40ed67c54268'::UUID)));

SELECT hex(maxDistinctState(tuple('str', '127.0.0.1'::IPv4)));

SELECT hex(maxDistinctState(tuple('str', '127.0.0.1'::IPv6)));

SELECT hex(maxDistinctState(tuple('str', '2020-01-01'::Date)));

SELECT hex(maxDistinctState(tuple('str', '2020-01-01'::Date32)));

SELECT hex(maxDistinctState(tuple('str', '2020-01-01'::DateTime)));

SELECT hex(maxDistinctState(tuple('str', '2020-01-01'::DateTime64)));

SELECT hex(maxDistinctState(tuple('str', 'a'::Enum8('a' = 1))));

SELECT hex(maxDistinctState(tuple('str', 'a'::Enum16('a' = 1))));