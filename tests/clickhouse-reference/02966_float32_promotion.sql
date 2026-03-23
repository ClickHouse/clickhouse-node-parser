CREATE TABLE f32_table (my_field Float32) ENGINE=Memory();
INSERT INTO f32_table values ('49.9');
SELECT * FROM f32_table where my_field = '49.9';
