SELECT generateSerialID(concat(currentDatabase(), 'x'));

SELECT generateSerialID(concat(currentDatabase(), 'y'));

SELECT generateSerialID(concat(currentDatabase(), 'x'))
FROM numbers(5);

SELECT generateSerialID(concat(currentDatabase(), 'start100'), 100);

SELECT generateSerialID(concat(currentDatabase(), 'start200'), 200);

SELECT generateSerialID(concat(currentDatabase(), 'start0'), 0);

SELECT generateSerialID(concat(currentDatabase(), 'start500'), 500)
FROM numbers(5);

SELECT generateSerialID(concat(currentDatabase(), 'start1000'), 1000);

SELECT generateSerialID(concat(currentDatabase(), 'start1000'), 9999);

SELECT generateSerialID();

SELECT generateSerialID('x', 'y');

SELECT generateSerialID('x', 'y', 'z');

SELECT generateSerialID(1);

SELECT generateSerialID('abcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghij');

SELECT
    generateSerialID(concat(currentDatabase(), 'z')),
    generateSerialID(concat(currentDatabase(), 'z'))
FROM numbers(5);

SELECT generateSerialID('a');