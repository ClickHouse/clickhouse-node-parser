SELECT length(repeat('x', 1000000));

SELECT length(repeat('', 1000000));

SELECT length(repeat('x', 1000001));

SELECT length(repeat(repeat('Hello, world!', 1000000), 10));

SELECT repeat(toString(number), number)
FROM `system`.numbers
LIMIT 11;