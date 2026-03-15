CREATE DATABASE replicated_database_params ENGINE = Replicated('some/path/' || currentDatabase() || '/replicated_database_params');
CREATE DATABASE replicated_database_params ENGINE = Replicated('some/path/' || currentDatabase() || '/replicated_database_params', 'shard_1');
