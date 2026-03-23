CREATE TABLE f32_table
(
    my_field Float32
)
ENGINE = Memory();

INSERT INTO f32_table;

SELECT *
FROM f32_table
WHERE my_field = '49.9';