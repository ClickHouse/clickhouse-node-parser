SELECT *
FROM mongodb('mongodb://some-cluster:27017/?retryWrites=false', NULL, 'my_collection', 'test_user', 'password', 'x Int32');

SELECT *
FROM mongodb('mongodb://some-cluster:27017/?retryWrites=false', 'test', NULL, 'test_user', 'password', 'x Int32');

SELECT *
FROM mongodb('mongodb://some-cluster:27017/?retryWrites=false', 'test', 'my_collection', NULL, 'password', 'x Int32');

SELECT *
FROM mongodb('mongodb://some-cluster:27017/?retryWrites=false', 'test', 'my_collection', 'test_user', NULL, 'x Int32');

SELECT *
FROM mongodb('mongodb://some-cluster:27017/?retryWrites=false', 'test', 'my_collection', 'test_user', 'password', NULL);

SELECT *
FROM mongodb('mongodb://some-cluster:27017/?retryWrites=false', 'test', 'my_collection', 'test_user', 'password', materialize(1) + 1);

SELECT *
FROM mongodb('mongodb://some-cluster:27017/?retryWrites=false', 'test', 'my_collection', 'test_user', 'password', 'x Int32', NULL);

SELECT *
FROM mongodb('mongodb://some-cluster:27017/?retryWrites=false', 'test', 'my_collection', 'test_user', 'password', NULL, 'x Int32');

SELECT *
FROM mongodb(NULL, 'test', 'my_collection', 'test_user', 'password', 'x Int32');