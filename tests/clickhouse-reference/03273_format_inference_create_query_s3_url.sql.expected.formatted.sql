CREATE TABLE test
ENGINE = S3('http://localhost:11111/test/json_data');

CREATE TABLE test
ENGINE = S3('http://localhost:11111/test/json_data', NOSIGN);

CREATE TABLE test
ENGINE = S3('http://localhost:11111/test/json_data', auto);

CREATE TABLE test
ENGINE = S3('http://localhost:11111/test/json_data', auto, 'none');

CREATE TABLE test
ENGINE = S3('http://localhost:11111/test/json_data', NOSIGN, auto);

CREATE TABLE test
ENGINE = S3('http://localhost:11111/test/json_data', 'test', 'testtest');

CREATE TABLE test
ENGINE = S3('http://localhost:11111/test/json_data', NOSIGN, auto, 'none');

CREATE TABLE test
ENGINE = S3('http://localhost:11111/test/json_data', 'test', 'testtest', '');

CREATE TABLE test
ENGINE = S3('http://localhost:11111/test/json_data', 'test', 'testtest', '', auto);

CREATE TABLE test
ENGINE = S3('http://localhost:11111/test/json_data', 'test', 'testtest', auto, 'none');

CREATE TABLE test
ENGINE = S3('http://localhost:11111/test/json_data', 'test', 'testtest', '', auto, 'none');

CREATE TABLE test
ENGINE = URL('http://localhost:11111/test/json_data');

CREATE TABLE test
ENGINE = URL('http://localhost:11111/test/json_data', auto);

CREATE TABLE test
ENGINE = URL('http://localhost:11111/test/json_data', auto, 'none');