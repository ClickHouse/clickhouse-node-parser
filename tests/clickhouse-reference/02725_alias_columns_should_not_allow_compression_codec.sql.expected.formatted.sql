SYSTEM drop  table if exists alias_column_should_not_allow_compression;

CREATE TABLE IF NOT EXISTS alias_column_should_not_allow_compression
(
    user_id UUID,
    user_id_hashed ALIAS (cityHash64(user_id))
)
ENGINE = MergeTree()
ORDER BY tuple();

CREATE TABLE IF NOT EXISTS alias_column_should_not_allow_compression_fail
(
    user_id UUID,
    user_id_hashed ALIAS (cityHash64(user_id)) CODEC(LZ4HC(1))
)
ENGINE = MergeTree()
ORDER BY tuple(); -- { serverError BAD_ARGUMENTS }