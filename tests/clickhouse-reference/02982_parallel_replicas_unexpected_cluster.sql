SELECT count() FROM test_unexpected_cluster WHERE NOT ignore(*); -- { serverError UNEXPECTED_CLUSTER }
