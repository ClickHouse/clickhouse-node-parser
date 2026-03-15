SELECT '----- START -----';
create table hilbert_numbers_03131(
    n1 UInt32,
    n2 UInt32
)
    Engine=MergeTree()
    ORDER BY n1 SETTINGS index_granularity = 8192, index_granularity_bytes = '10Mi';
select hilbertEncode(133);
select hilbertEncode(3, 4);
select hilbertDecode(2, 31);
create table hilbert_numbers_1_03131(
    n1 UInt64,
    n2 UInt64
)
    Engine=MergeTree()
    ORDER BY n1 SETTINGS index_granularity = 8192, index_granularity_bytes = '10Mi';
select hilbertEncode(); -- { serverError TOO_FEW_ARGUMENTS_FOR_FUNCTION }
select hilbertEncode(1, 2, 3); -- { serverError TOO_MANY_ARGUMENTS_FOR_FUNCTION }
select hilbertDecode(); -- { serverError NUMBER_OF_ARGUMENTS_DOESNT_MATCH }
select hilbertEncode('text'); -- { serverError ILLEGAL_TYPE_OF_ARGUMENT }
select hilbertDecode('text', 'text'); -- { serverError ILLEGAL_COLUMN }
select hilbertEncode((1, 2), 3); -- { serverError ARGUMENT_OUT_OF_BOUND }
