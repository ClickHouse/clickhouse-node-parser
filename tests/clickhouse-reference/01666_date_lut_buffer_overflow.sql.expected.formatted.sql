SELECT toDate('2105-12-31') + toIntervalMonth(number)
FROM `system`.numbers
LIMIT 25000
FORMAT Null;