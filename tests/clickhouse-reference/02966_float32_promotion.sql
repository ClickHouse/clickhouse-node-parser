CREATE TABLE f32_table (my_field Float32) ENGINE=Memory();
SELECT * FROM f32_table where my_field = '49.9';
