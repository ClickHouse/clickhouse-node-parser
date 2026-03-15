set output_format_parallel_formatting=1;
set max_read_buffer_size=1048576;
set max_block_size=65505;
create table tsv(a int, b int default 7) engine File(TSV);
select count() from tsv;
