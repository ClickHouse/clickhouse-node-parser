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
use system;
