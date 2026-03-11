select vec.0 from qbit; -- { serverError NOT_FOUND_COLUMN_IN_BLOCK }
select vec.17 from qbit; -- { serverError NOT_FOUND_COLUMN_IN_BLOCK }
select bin(vec.1) from qbit;
select bin(vec.4) from qbit;
select bin(vec.15) from qbit;
select bin(vec.16) from qbit;
SELECT bin(vec.1) FROM qbit ORDER BY id;
SELECT bin(vec.2) FROM qbit ORDER BY id;
SELECT bin(vec.7) FROM qbit ORDER BY id;
SELECT bin(vec.15) FROM qbit ORDER BY id;
SELECT bin(vec.23) FROM qbit ORDER BY id;
SELECT bin(vec.31) FROM qbit ORDER BY id;
SELECT bin(vec.39) FROM qbit ORDER BY id;
SELECT bin(vec.47) FROM qbit ORDER BY id;
SELECT bin(vec.55) FROM qbit ORDER BY id;
SELECT bin(vec.63) FROM qbit ORDER BY id;
