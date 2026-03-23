CREATE TABLE minimum_sample_size_continuos (baseline UInt64, sigma UInt64) ENGINE = Memory();
INSERT INTO minimum_sample_size_continuos VALUES (20, 10);
INSERT INTO minimum_sample_size_continuos VALUES (200, 10);
CREATE TABLE minimum_sample_size_continuos (baseline Float64, sigma Float64) ENGINE = Memory();
CREATE TABLE minimum_sample_size_conversion (p1 Float64) ENGINE = Memory();
INSERT INTO minimum_sample_size_conversion VALUES (0.9);
INSERT INTO minimum_sample_size_conversion VALUES (0.8);
