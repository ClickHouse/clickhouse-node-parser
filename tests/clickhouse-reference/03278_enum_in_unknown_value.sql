SELECT * FROM t_enum_in_unknown_value;
SELECT * FROM t_enum_in_unknown_value WHERE e IN ('a');
SELECT * FROM t_enum_in_unknown_value WHERE e NOT IN ('a');
SELECT * FROM t_enum_in_unknown_value WHERE e IN ('a', 'b');
SELECT * FROM t_enum_in_unknown_value WHERE e NOT IN ('a', 'b');
SELECT * FROM t_enum_in_unknown_value WHERE e IN (1, 'b');
SELECT * FROM t_enum_in_unknown_value WHERE e NOT IN (1, 'b');
SELECT * FROM t_enum_in_unknown_value WHERE e IN ('a', 'c');
SELECT * FROM t_enum_in_unknown_value WHERE e NOT IN ('a', 'c');
SELECT * FROM t_enum_in_unknown_value WHERE e IN ('a', 'b', 'c');
SELECT * FROM t_enum_in_unknown_value WHERE e NOT IN ('a', 'b', 'c');
SELECT * FROM t_enum_in_unknown_value WHERE e IN ('c');
SELECT * FROM t_enum_in_unknown_value WHERE e NOT IN ('c');
SELECT * FROM t_enum_in_unknown_value WHERE e IN ('a', 'b', 3); -- { serverError UNKNOWN_ELEMENT_OF_ENUM }
