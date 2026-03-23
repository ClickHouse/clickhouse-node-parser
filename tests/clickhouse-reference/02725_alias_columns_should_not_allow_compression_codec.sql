drop table if exists alias_column_should_not_allow_compression;
create table if not exists alias_column_should_not_allow_compression ( user_id UUID, user_id_hashed ALIAS (cityHash64(user_id))) engine=MergeTree() order by tuple();
create table if not exists alias_column_should_not_allow_compression_fail ( user_id UUID, user_id_hashed ALIAS (cityHash64(user_id)) codec(LZ4HC(1))) engine=MergeTree() order by tuple(); -- { serverError BAD_ARGUMENTS }
