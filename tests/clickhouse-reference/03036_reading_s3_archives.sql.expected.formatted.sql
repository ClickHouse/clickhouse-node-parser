-- Tags: no-fasttest
-- Tag no-fasttest: Depends on AWS
SELECT
    id,
    data,
    _size,
    _file,
    _path
FROM s3(s3_conn, filename = '03036_archive1.zip :: example1.csv')
ORDER BY (id, _file, _path) ASC;

SELECT
    id,
    data,
    _size,
    _file,
    _path
FROM s3(s3_conn, filename = '03036_archive2.zip :: example*.csv')
ORDER BY (id, _file, _path) ASC;

SELECT
    id,
    data,
    _size,
    _file,
    _path
FROM s3(s3_conn, filename = '03036_archive*.zip :: example2.csv')
ORDER BY (id, _file, _path) ASC;

SELECT
    id,
    data,
    _size,
    _file,
    _path
FROM s3(s3_conn, filename = '03036_archive*.zip :: example*')
ORDER BY (id, _file, _path) ASC;

SELECT
    id,
    data,
    _size,
    _file,
    _path
FROM s3(s3_conn, filename = '03036_archive1.tar :: example1.csv')
ORDER BY (id, _file, _path) ASC;

SELECT
    id,
    data,
    _size,
    _file,
    _path
FROM s3(s3_conn, filename = '03036_archive*.tar :: example4.csv')
ORDER BY (id, _file, _path) ASC;

SELECT
    id,
    data,
    _size,
    _file,
    _path
FROM s3(s3_conn, filename = '03036_archive2.tar :: example*.csv')
ORDER BY (id, _file, _path) ASC;

SELECT
    id,
    data,
    _size,
    _file,
    _path
FROM s3(s3_conn, filename = '03036_archive*.tar.gz :: example*.csv')
ORDER BY (id, _file, _path) ASC;

SELECT
    id,
    data,
    _size,
    _file,
    _path
FROM s3(s3_conn, filename = '03036_archive*.tar* :: example{2..3}.csv')
ORDER BY (id, _file, _path) ASC;

SELECT
    id,
    data,
    _size,
    _file,
    _path
FROM s3(s3_conn, filename = '03036_archive2.zip :: nonexistent.csv'); -- { serverError CANNOT_EXTRACT_TABLE_STRUCTURE }

SELECT
    id,
    data,
    _size,
    _file,
    _path
FROM s3(s3_conn, filename = '03036_archive2.zip :: nonexistent{2..3}.csv'); -- { serverError CANNOT_EXTRACT_TABLE_STRUCTURE }

CREATE TABLE table_zip22
ENGINE = S3(s3_conn, filename = '03036_archive2.zip :: example2.csv');

SELECT
    id,
    data,
    _size,
    _file,
    _path
FROM table_zip22
ORDER BY (id, _file, _path) ASC;

CREATE TABLE table_tar2star
ENGINE = S3(s3_conn, filename = '03036_archive2.tar :: example*.csv');

SELECT
    id,
    data,
    _size,
    _file,
    _path
FROM table_tar2star
ORDER BY (id, _file, _path) ASC;

CREATE TABLE table_tarstarglobs
ENGINE = S3(s3_conn, filename = '03036_archive*.tar* :: example{2..3}.csv');

SELECT
    id,
    data,
    _size,
    _file,
    _path
FROM table_tarstarglobs
ORDER BY (id, _file, _path) ASC;

CREATE TABLE table_noexist
ENGINE = s3(s3_conn, filename = '03036_archive2.zip :: nonexistent.csv'); -- { serverError UNKNOWN_STORAGE }

SELECT
    id,
    data,
    _size,
    _file,
    _path
FROM s3(s3_conn, filename = '03036_compressed_file_archive.zip :: example7.csv', `format` = 'CSV', structure = 'auto', compression_method = 'gz')
ORDER BY (id, _file, _path) ASC;