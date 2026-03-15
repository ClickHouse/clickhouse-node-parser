CREATE TABLE test_table_url_syntax
(
    id UInt32
)
ENGINE = URL(''); -- { serverError BAD_ARGUMENTS }

CREATE TABLE test_table_url_syntax
(
    id UInt32
)
ENGINE = URL('', '', '', ''); -- { serverError NUMBER_OF_ARGUMENTS_DOESNT_MATCH }

CREATE TABLE test_table_url
(
    id UInt32
)
ENGINE = URL('http://localhost/endpoint'); -- { serverError CANNOT_DETECT_FORMAT }

CREATE TABLE test_table_url
(
    id UInt32
)
ENGINE = URL('http://localhost/endpoint.json');

CREATE TABLE test_table_url
(
    id UInt32
)
ENGINE = URL('http://localhost/endpoint', 'ErrorFormat'); -- { serverError UNKNOWN_FORMAT }

CREATE TABLE test_table_url
(
    id UInt32
)
ENGINE = URL('http://localhost/endpoint', 'JSONEachRow', 'gzip');

CREATE TABLE test_table_url
(
    id UInt32
)
ENGINE = URL('http://localhost/endpoint', 'JSONEachRow', 'gz');

CREATE TABLE test_table_url
(
    id UInt32
)
ENGINE = URL('http://localhost/endpoint', 'JSONEachRow', 'deflate');

CREATE TABLE test_table_url
(
    id UInt32
)
ENGINE = URL('http://localhost/endpoint', 'JSONEachRow', 'brotli');

CREATE TABLE test_table_url
(
    id UInt32
)
ENGINE = URL('http://localhost/endpoint', 'JSONEachRow', 'lzma');

CREATE TABLE test_table_url
(
    id UInt32
)
ENGINE = URL('http://localhost/endpoint', 'JSONEachRow', 'zstd');

CREATE TABLE test_table_url
(
    id UInt32
)
ENGINE = URL('http://localhost/endpoint', 'JSONEachRow', 'lz4');

CREATE TABLE test_table_url
(
    id UInt32
)
ENGINE = URL('http://localhost/endpoint', 'JSONEachRow', 'bz2');

CREATE TABLE test_table_url
(
    id UInt32
)
ENGINE = URL('http://localhost/endpoint', 'JSONEachRow', 'snappy');

CREATE TABLE test_table_url
(
    id UInt32
)
ENGINE = URL('http://localhost/endpoint', 'JSONEachRow', 'none');

CREATE TABLE test_table_url
(
    id UInt32
)
ENGINE = URL('http://localhost/endpoint', 'JSONEachRow', 'auto');

CREATE TABLE test_table_url
(
    id UInt32
)
ENGINE = URL('http://localhost/endpoint.gz', 'JSONEachRow');

CREATE TABLE test_table_url
(
    id UInt32
)
ENGINE = URL('http://localhost/endpoint.fr', 'JSONEachRow');

CREATE TABLE test_table_url
(
    id UInt32
)
ENGINE = URL('http://localhost/endpoint', 'JSONEachRow');

CREATE TABLE test_table_url
(
    id UInt32
)
ENGINE = URL('http://localhost/endpoint', 'JSONEachRow', 'zip'); -- { serverError NOT_IMPLEMENTED }