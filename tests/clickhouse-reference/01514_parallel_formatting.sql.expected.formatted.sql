SET output_format_parallel_formatting = 1;

SET max_read_buffer_size = 1048576;

SET max_block_size = 65505;

CREATE TABLE tsv
(
    a int,
    b int DEFAULT 7
)
ENGINE = File(TSV);

SELECT count()
FROM tsv;