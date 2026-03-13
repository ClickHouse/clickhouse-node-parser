SELECT *
FROM url(url_with_headers, url = 'http://127.0.0.1:8123?query=select+12', `format` = 'RawBLOB'); -- { serverError RECEIVED_ERROR_FROM_REMOTE_IO_SERVER }

SELECT *
FROM url(url_with_headers, url = 'http://127.0.0.1:8123?query=select+12', `format` = 'RawBLOB', headers('X-ClickHouse-Database' = 'default'));

SELECT *
FROM url(url_with_headers, url = 'http://127.0.0.1:8123?query=select+12', `format` = 'RawBLOB', headers('X-ClickHouse-Database' = 'default', 'X-ClickHouse-Format' = 'JSONEachRow'));

SELECT *
FROM url(url_with_headers, url = 'http://127.0.0.1:8123?query=select+12', `format` = 'RawBLOB', headers('X-ClickHouse-Database' = 'kek')); -- { serverError RECEIVED_ERROR_FROM_REMOTE_IO_SERVER }

SELECT *
FROM url('http://127.0.0.1:8123?query=select+12', 'RawBLOB');

SELECT *
FROM url('http://127.0.0.1:8123?query=select+12', 'RawBLOB', headers('X-ClickHouse-Database' = 'default'));

SELECT *
FROM url('http://127.0.0.1:8123?query=select+12', 'RawBLOB', headers('X-ClickHouse-Database' = 'default', 'X-ClickHouse-Format' = 'JSONEachRow'));

SELECT *
FROM url('http://127.0.0.1:8123?query=select+12', 'RawBLOB', headers('X-ClickHouse-Format' = 'JSONEachRow', 'X-ClickHouse-Database' = 'kek')); -- { serverError RECEIVED_ERROR_FROM_REMOTE_IO_SERVER }

SELECT *
FROM url('http://127.0.0.1:8123?query=select+12', 'RawBLOB', headers('X-ClickHouse-Format' = 'JSONEachRow', 'X-ClickHouse-Database' = 1)); -- { serverError BAD_ARGUMENTS }

SELECT *
FROM url;