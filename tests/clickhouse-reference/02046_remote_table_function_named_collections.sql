SELECT count() FROM remote(remote1, database=currentDatabase());
SELECT count() FROM remote(remote2, database=merge(currentDatabase(), '^remote_test'));
