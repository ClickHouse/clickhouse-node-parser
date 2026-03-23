-- Tags: zookeeper
WITH concat(currentDatabase(), '_test1_', (number MOD 3)) AS key1,

concat(currentDatabase(), '_test2_', (number DIV 3)) AS key2

SELECT
    number,
    generateSerialID(key1),
    generateSerialID(key2)
FROM numbers(10);