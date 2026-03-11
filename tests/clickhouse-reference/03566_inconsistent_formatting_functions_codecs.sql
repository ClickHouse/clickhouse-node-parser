SELECT f(`@`); -- { serverError UNKNOWN_IDENTIFIER }
SELECT `@`(1); -- { serverError UNKNOWN_FUNCTION }
SELECT ` `(1); -- { serverError UNKNOWN_FUNCTION }
SELECT `упячка`(1); -- { serverError UNKNOWN_FUNCTION }
