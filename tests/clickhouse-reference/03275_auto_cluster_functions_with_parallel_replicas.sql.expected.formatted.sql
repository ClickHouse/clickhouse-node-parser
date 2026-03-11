SELECT count()
FROM s3('http://localhost:11111/test/a.tsv', 'TSV');

SELECT count()
FROM dupe_test_with_auto_functions;

SELECT count()
FROM insert_with_url_function;

SELECT count()
FROM dupe_test_without_cluster_functions;

SELECT count()
FROM dupe_test_with_cluster_function;