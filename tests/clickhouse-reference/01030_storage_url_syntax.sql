-- Tags: no-fasttest
-- no-fasttest: Timeout for the first query (CANNOT_DETECT_FORMAT) is too slow: https://github.com/ClickHouse/ClickHouse/issues/67939

drop table if exists test_table_url_syntax
;
create table test_table_url_syntax (id UInt32) ENGINE = URL('')
; -- { serverError BAD_ARGUMENTS }
create table test_table_url_syntax (id UInt32) ENGINE = URL('','','','')
; -- { serverError NUMBER_OF_ARGUMENTS_DOESNT_MATCH }
drop table if exists test_table_url
;
create table test_table_url(id UInt32) ENGINE = URL('http://localhost/endpoint')
; -- { serverError CANNOT_DETECT_FORMAT }
create table test_table_url(id UInt32) ENGINE = URL('http://localhost/endpoint.json');
drop table test_table_url;
create table test_table_url(id UInt32) ENGINE = URL('http://localhost/endpoint', 'ErrorFormat')
; -- { serverError UNKNOWN_FORMAT }
create table test_table_url(id UInt32) ENGINE = URL('http://localhost/endpoint', 'JSONEachRow', 'gzip');
create table test_table_url(id UInt32) ENGINE = URL('http://localhost/endpoint', 'JSONEachRow', 'gz');
create table test_table_url(id UInt32) ENGINE = URL('http://localhost/endpoint', 'JSONEachRow', 'deflate');
create table test_table_url(id UInt32) ENGINE = URL('http://localhost/endpoint', 'JSONEachRow', 'brotli');
create table test_table_url(id UInt32) ENGINE = URL('http://localhost/endpoint', 'JSONEachRow', 'lzma');
create table test_table_url(id UInt32) ENGINE = URL('http://localhost/endpoint', 'JSONEachRow', 'zstd');
create table test_table_url(id UInt32) ENGINE = URL('http://localhost/endpoint', 'JSONEachRow', 'lz4');
create table test_table_url(id UInt32) ENGINE = URL('http://localhost/endpoint', 'JSONEachRow', 'bz2');
create table test_table_url(id UInt32) ENGINE = URL('http://localhost/endpoint', 'JSONEachRow', 'snappy');
create table test_table_url(id UInt32) ENGINE = URL('http://localhost/endpoint', 'JSONEachRow', 'none');
create table test_table_url(id UInt32) ENGINE = URL('http://localhost/endpoint', 'JSONEachRow', 'auto');
create table test_table_url(id UInt32) ENGINE = URL('http://localhost/endpoint.gz', 'JSONEachRow');
create table test_table_url(id UInt32) ENGINE = URL('http://localhost/endpoint.fr', 'JSONEachRow');
create table test_table_url(id UInt32) ENGINE = URL('http://localhost/endpoint', 'JSONEachRow');
create table test_table_url(id UInt32) ENGINE = URL('http://localhost/endpoint', 'JSONEachRow', 'zip')
; -- { serverError NOT_IMPLEMENTED }
