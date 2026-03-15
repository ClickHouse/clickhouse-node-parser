CREATE TABLE IF NOT EXISTS badFixedStringSort (uuid5_old FixedString(16), subitem String) engine=MergeTree order by tuple();
select hex(uuid5_old), subitem from badFixedStringSort ORDER BY uuid5_old, subitem;
