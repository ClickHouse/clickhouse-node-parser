SELECT substringIndex('www.clickhouse.com', '.', -4);

SELECT substringIndex('www.clickhouse.com', '.', -3);

SELECT substringIndex('www.clickhouse.com', '.', -2);

SELECT substringIndex('www.clickhouse.com', '.', -1);

SELECT substringIndex('www.clickhouse.com', '.', 0);

SELECT substringIndex('www.clickhouse.com', '.', 1);

SELECT substringIndex('www.clickhouse.com', '.', 2);

SELECT substringIndex('www.clickhouse.com', '.', 3);

SELECT substringIndex('www.clickhouse.com', '.', 4);

SELECT substringIndex(materialize('www.clickhouse.com'), '.', -4);

SELECT substringIndex(materialize('www.clickhouse.com'), '.', -3);

SELECT substringIndex(materialize('www.clickhouse.com'), '.', -2);

SELECT substringIndex(materialize('www.clickhouse.com'), '.', -1);

SELECT substringIndex(materialize('www.clickhouse.com'), '.', 0);

SELECT substringIndex(materialize('www.clickhouse.com'), '.', 1);

SELECT substringIndex(materialize('www.clickhouse.com'), '.', 2);

SELECT substringIndex(materialize('www.clickhouse.com'), '.', 3);

SELECT substringIndex(materialize('www.clickhouse.com'), '.', 4);

SELECT substringIndex(materialize('www.clickhouse.com'), '.', materialize(-4));

SELECT substringIndex(materialize('www.clickhouse.com'), '.', materialize(-3));

SELECT substringIndex(materialize('www.clickhouse.com'), '.', materialize(-2));

SELECT substringIndex(materialize('www.clickhouse.com'), '.', materialize(-1));

SELECT substringIndex(materialize('www.clickhouse.com'), '.', materialize(0));

SELECT substringIndex(materialize('www.clickhouse.com'), '.', materialize(1));

SELECT substringIndex(materialize('www.clickhouse.com'), '.', materialize(2));

SELECT substringIndex(materialize('www.clickhouse.com'), '.', materialize(3));

SELECT substringIndex(materialize('www.clickhouse.com'), '.', materialize(4));

SELECT substringIndex('www.clickhouse.com', '.', materialize(-4));

SELECT substringIndex('www.clickhouse.com', '.', materialize(-3));

SELECT substringIndex('www.clickhouse.com', '.', materialize(-2));

SELECT substringIndex('www.clickhouse.com', '.', materialize(-1));

SELECT substringIndex('www.clickhouse.com', '.', materialize(0));

SELECT substringIndex('www.clickhouse.com', '.', materialize(1));

SELECT substringIndex('www.clickhouse.com', '.', materialize(2));

SELECT substringIndex('www.clickhouse.com', '.', materialize(3));

SELECT substringIndex('www.clickhouse.com', '.', materialize(4));

SELECT SUBSTRING_INDEX('www.clickhouse.com', '.', 2);

SELECT substringIndex('www.clickhouse.com', '..', 2);

SELECT substringIndex('www.clickhouse.com', '', 2);

SELECT substringIndex('www.clickhouse.com', materialize('.'), 2);

SELECT substringIndex('www.clickhouse.com', '.', CAST(2 AS Int128));

SELECT substringIndexUTF8('富强，民主，文明', '，', -4);

SELECT substringIndexUTF8('富强，民主，文明', '，', -3);

SELECT substringIndexUTF8('富强，民主，文明', '，', -2);

SELECT substringIndexUTF8('富强，民主，文明', '，', -1);

SELECT substringIndexUTF8('富强，民主，文明', '，', 0);

SELECT substringIndexUTF8('富强，民主，文明', '，', 1);

SELECT substringIndexUTF8('富强，民主，文明', '，', 2);

SELECT substringIndexUTF8('富强，民主，文明', '，', 3);

SELECT substringIndexUTF8('富强，民主，文明', '，', 4);

SELECT substringIndexUTF8(materialize('富强，民主，文明'), '，', -4);

SELECT substringIndexUTF8(materialize('富强，民主，文明'), '，', -3);

SELECT substringIndexUTF8(materialize('富强，民主，文明'), '，', -2);

SELECT substringIndexUTF8(materialize('富强，民主，文明'), '，', -1);

SELECT substringIndexUTF8(materialize('富强，民主，文明'), '，', 0);

SELECT substringIndexUTF8(materialize('富强，民主，文明'), '，', 1);

SELECT substringIndexUTF8(materialize('富强，民主，文明'), '，', 2);

SELECT substringIndexUTF8(materialize('富强，民主，文明'), '，', 3);

SELECT substringIndexUTF8(materialize('富强，民主，文明'), '，', 4);

SELECT substringIndexUTF8('富强，民主，文明', '，', materialize(-4));

SELECT substringIndexUTF8('富强，民主，文明', '，', materialize(-3));

SELECT substringIndexUTF8('富强，民主，文明', '，', materialize(-2));

SELECT substringIndexUTF8('富强，民主，文明', '，', materialize(-1));

SELECT substringIndexUTF8('富强，民主，文明', '，', materialize(0));

SELECT substringIndexUTF8('富强，民主，文明', '，', materialize(1));

SELECT substringIndexUTF8('富强，民主，文明', '，', materialize(2));

SELECT substringIndexUTF8('富强，民主，文明', '，', materialize(3));

SELECT substringIndexUTF8('富强，民主，文明', '，', materialize(4));

SELECT substringIndexUTF8(materialize('富强，民主，文明'), '，', materialize(-4));

SELECT substringIndexUTF8(materialize('富强，民主，文明'), '，', materialize(-3));

SELECT substringIndexUTF8(materialize('富强，民主，文明'), '，', materialize(-2));

SELECT substringIndexUTF8(materialize('富强，民主，文明'), '，', materialize(-1));

SELECT substringIndexUTF8(materialize('富强，民主，文明'), '，', materialize(0));

SELECT substringIndexUTF8(materialize('富强，民主，文明'), '，', materialize(1));

SELECT substringIndexUTF8(materialize('富强，民主，文明'), '，', materialize(2));

SELECT substringIndexUTF8(materialize('富强，民主，文明'), '，', materialize(3));

SELECT substringIndexUTF8(materialize('富强，民主，文明'), '，', materialize(4));

SELECT substringIndexUTF8('富强，民主，文明', '，，', 2);

SELECT substringIndexUTF8('富强，民主，文明', '', 2);

SELECT substringIndexUTF8('富强，民主，文明', materialize('，'), 2);

SELECT substringIndexUTF8('富强，民主，文明', '，', CAST(2 AS Int128));