SELECT splitByChar(',', '1,2,3');

SELECT splitByChar('+', '1+2+3');

-- splitByChar accepts only 1 byte length characters. Test for some special characters that are not necessarily single byte.
SELECT splitByChar('×', '1x2x3'); -- { serverError BAD_ARGUMENTS }

SELECT splitByChar('€', '€1,2,3'); -- { serverError BAD_ARGUMENTS }

SELECT splitByChar('•', '• 1,2,3'); -- { serverError BAD_ARGUMENTS }