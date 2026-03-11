SELECT sum(cityHash64(*)) FROM (SELECT * FROM test.hits LIMIT 10000);
SELECT sum(cityHash64(*)) FROM avro;
