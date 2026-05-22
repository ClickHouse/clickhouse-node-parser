-- Comparing the same types is ok:
SELECT toIntervalSecond(1) = toIntervalSecond(1);

-- It is reasonable to not give an answer for this:
SELECT toIntervalDay(30) < toIntervalMonth(1); -- { serverError NO_COMMON_TYPE }

-- This we could change in the future:
SELECT toIntervalSecond(1) = toIntervalYear(1); -- { serverError NO_COMMON_TYPE }

SELECT toIntervalSecond(1) <= toIntervalYear(1); -- { serverError NO_COMMON_TYPE }