SELECT bitHammingDistance(1, 5);

SELECT bitHammingDistance(100, 100000);

SELECT bitHammingDistance(-1, 1);

SELECT bitHammingDistance(4, n1)
FROM defaults;

SELECT bitHammingDistance(n2, 100)
FROM defaults;

SELECT bitHammingDistance(n3, n4)
FROM defaults;

SELECT bitHammingDistance('hello', 'hello');

SELECT bitHammingDistance('hello', 'hellow');

SELECT bitHammingDistance(toFixedString('hello', 6), toFixedString('hellow', 6));

SELECT bitHammingDistance(s1, s2)
FROM test_string;

SELECT bitHammingDistance(s3, s4)
FROM test_string;

SELECT bitHammingDistance('hello', s2)
FROM test_string;

SELECT bitHammingDistance(s4, toFixedString('hello', 10))
FROM test_string;