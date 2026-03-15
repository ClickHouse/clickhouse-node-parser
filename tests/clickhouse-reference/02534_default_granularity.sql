CREATE TABLE users_02534 (id Int16, name String, INDEX bf_idx(name) TYPE minmax) ENGINE=MergeTree ORDER BY id;
CREATE TABLE users_02534 (id Int16, name String) ENGINE=MergeTree ORDER BY id;
