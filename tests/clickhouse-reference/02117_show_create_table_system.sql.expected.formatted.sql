/* we will `use system` to bypass style check,
because `show create table` statement
cannot fit the requirement in check-style, which is as

"# Queries to:
tables_with_database_column=(
    system.tables
    system.parts
    system.detached_parts
    system.parts_columns
    system.columns
    system.projection_parts
    system.mutations
)
# should have database = currentDatabase() condition"

 */
USE `system`;

SHOW CREATE TABLE aggregate_function_combinators FORMAT TSVRaw;

SHOW CREATE TABLE asynchronous_inserts FORMAT TSVRaw;

SHOW CREATE TABLE asynchronous_metrics FORMAT TSVRaw;

SHOW CREATE TABLE build_options FORMAT TSVRaw;

SHOW CREATE TABLE clusters FORMAT TSVRaw;

SHOW CREATE TABLE collations FORMAT TSVRaw;

SHOW CREATE TABLE `columns` FORMAT TSVRaw;

SHOW CREATE TABLE contributors FORMAT TSVRaw;

SHOW CREATE TABLE current_roles FORMAT TSVRaw;

SHOW CREATE TABLE data_skipping_indices FORMAT TSVRaw;

SHOW CREATE TABLE data_type_families FORMAT TSVRaw;

SHOW CREATE TABLE databases FORMAT TSVRaw;

SHOW CREATE TABLE detached_parts FORMAT TSVRaw;

SHOW CREATE TABLE dictionaries FORMAT TSVRaw;

SHOW CREATE TABLE disks FORMAT TSVRaw;

SHOW CREATE TABLE distributed_ddl_queue FORMAT TSVRaw;

SHOW CREATE TABLE distribution_queue FORMAT TSVRaw;

SHOW CREATE TABLE enabled_roles FORMAT TSVRaw;

SHOW CREATE TABLE errors FORMAT TSVRaw;

SHOW CREATE TABLE events FORMAT TSVRaw;

SHOW CREATE TABLE formats FORMAT TSVRaw;

SHOW CREATE TABLE functions FORMAT TSVRaw;

-- show create table grants format TSVRaw; -- it's updated too often, it's inconvenient to update the test
SHOW CREATE TABLE graphite_retentions FORMAT TSVRaw;

SHOW CREATE TABLE licenses FORMAT TSVRaw;

SHOW CREATE TABLE macros FORMAT TSVRaw;

SHOW CREATE TABLE merge_tree_settings FORMAT TSVRaw;

SHOW CREATE TABLE merges FORMAT TSVRaw;

SHOW CREATE TABLE metrics FORMAT TSVRaw;

SHOW CREATE TABLE moves FORMAT TSVRaw;

SHOW CREATE TABLE mutations FORMAT TSVRaw;

SHOW CREATE TABLE numbers FORMAT TSVRaw;

SHOW CREATE TABLE numbers_mt FORMAT TSVRaw;

SHOW CREATE TABLE one FORMAT TSVRaw;

SHOW CREATE TABLE part_moves_between_shards FORMAT TSVRaw;

SHOW CREATE TABLE parts FORMAT TSVRaw;

SHOW CREATE TABLE parts_columns FORMAT TSVRaw;

-- show create table privileges format TSVRaw; -- it's updated too often, it's inconvenient to update the test
SHOW CREATE TABLE processes FORMAT TSVRaw;

SHOW CREATE TABLE projection_parts FORMAT TSVRaw;

SHOW CREATE TABLE projection_parts_columns FORMAT TSVRaw;

SHOW CREATE TABLE quota_limits FORMAT TSVRaw;

SHOW CREATE TABLE quota_usage FORMAT TSVRaw;

SHOW CREATE TABLE quotas FORMAT TSVRaw;

SHOW CREATE TABLE quotas_usage FORMAT TSVRaw;

SHOW CREATE TABLE replicas FORMAT TSVRaw;

SHOW CREATE TABLE replicated_fetches FORMAT TSVRaw;

SHOW CREATE TABLE replicated_merge_tree_settings FORMAT TSVRaw;

SHOW CREATE TABLE replication_queue FORMAT TSVRaw;

SHOW CREATE TABLE role_grants FORMAT TSVRaw;

SHOW CREATE TABLE roles FORMAT TSVRaw;

SHOW CREATE TABLE row_policies FORMAT TSVRaw;

SHOW CREATE TABLE `settings` FORMAT TSVRaw;

SHOW CREATE TABLE settings_profile_elements FORMAT TSVRaw;

SHOW CREATE TABLE settings_profiles FORMAT TSVRaw;

SHOW CREATE TABLE stack_trace FORMAT TSVRaw;

SHOW CREATE TABLE storage_policies FORMAT TSVRaw;

SHOW CREATE TABLE table_engines FORMAT TSVRaw;

SHOW CREATE TABLE table_functions FORMAT TSVRaw;

SHOW CREATE TABLE tables FORMAT TSVRaw;

SHOW CREATE TABLE time_zones FORMAT TSVRaw;

SHOW CREATE TABLE user_directories FORMAT TSVRaw;

SHOW CREATE TABLE users FORMAT TSVRaw;

SHOW CREATE TABLE warnings FORMAT TSVRaw;

SHOW CREATE TABLE zeros FORMAT TSVRaw;

SHOW CREATE TABLE zeros_mt FORMAT TSVRaw;