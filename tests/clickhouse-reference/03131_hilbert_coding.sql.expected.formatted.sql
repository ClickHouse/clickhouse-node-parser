SELECT '----- START -----';

SELECT hilbertEncode(133);

SELECT hilbertEncode(3, 4);

SELECT hilbertDecode(2, 31);

SELECT hilbertEncode(); -- { serverError TOO_FEW_ARGUMENTS_FOR_FUNCTION }

SELECT hilbertEncode(1, 2, 3); -- { serverError TOO_MANY_ARGUMENTS_FOR_FUNCTION }

SELECT hilbertDecode(); -- { serverError NUMBER_OF_ARGUMENTS_DOESNT_MATCH }

SELECT hilbertEncode('text'); -- { serverError ILLEGAL_TYPE_OF_ARGUMENT }

SELECT hilbertDecode('text', 'text'); -- { serverError ILLEGAL_COLUMN }

SELECT hilbertEncode((1, 2), 3); -- { serverError ARGUMENT_OUT_OF_BOUND }