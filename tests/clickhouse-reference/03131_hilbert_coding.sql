SELECT '----- START -----';
select hilbertEncode(133);
select hilbertEncode(3, 4);
select hilbertDecode(2, 31);
select hilbertEncode(); -- { serverError TOO_FEW_ARGUMENTS_FOR_FUNCTION }
select hilbertEncode(1, 2, 3); -- { serverError TOO_MANY_ARGUMENTS_FOR_FUNCTION }
select hilbertDecode(); -- { serverError NUMBER_OF_ARGUMENTS_DOESNT_MATCH }
select hilbertEncode('text'); -- { serverError ILLEGAL_TYPE_OF_ARGUMENT }
select hilbertDecode('text', 'text'); -- { serverError ILLEGAL_COLUMN }
select hilbertEncode((1, 2), 3); -- { serverError ARGUMENT_OUT_OF_BOUND }
