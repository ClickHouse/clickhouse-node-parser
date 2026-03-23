SYSTEM DROP  TABLE IF EXISTS t_tuple_element;

CREATE TABLE t_tuple_element
(
    t1 Tuple(a UInt32, s String),
    t2 Tuple(UInt32, String)
)
ENGINE = Memory;

INSERT INTO t_tuple_element;

SET optimize_functions_to_subcolumns = 1;

SET enable_analyzer = 1;

SELECT t1.1
FROM t_tuple_element;

SELECT t1.2
FROM t_tuple_element;

SELECT tupleElement(t1, 'a')
FROM t_tuple_element;

SELECT number.1
FROM numbers(1); -- { serverError ILLEGAL_TYPE_OF_ARGUMENT }

SELECT tupleElement(t1)
FROM t_tuple_element; -- { serverError NUMBER_OF_ARGUMENTS_DOESNT_MATCH }

SELECT tupleElement(t1, 'b')
FROM t_tuple_element; -- { serverError NOT_FOUND_COLUMN_IN_BLOCK, UNKNOWN_IDENTIFIER }

SELECT t1.0
FROM t_tuple_element; -- { serverError ARGUMENT_OUT_OF_BOUND, NOT_FOUND_COLUMN_IN_BLOCK }

SELECT t1.3
FROM t_tuple_element; -- { serverError ARGUMENT_OUT_OF_BOUND, NOT_FOUND_COLUMN_IN_BLOCK }

SELECT tupleElement(t1, materialize('a'))
FROM t_tuple_element; -- { serverError ILLEGAL_TYPE_OF_ARGUMENT }

SELECT t2.1
FROM t_tuple_element;

SELECT t2.1
FROM t_tuple_element;

SELECT tupleElement(t2)
FROM t_tuple_element; -- { serverError NUMBER_OF_ARGUMENTS_DOESNT_MATCH }

SELECT tupleElement(t2, 'a')
FROM t_tuple_element; -- { serverError NOT_FOUND_COLUMN_IN_BLOCK, UNKNOWN_IDENTIFIER }

SELECT t2.0
FROM t_tuple_element; -- { serverError ARGUMENT_OUT_OF_BOUND, NOT_FOUND_COLUMN_IN_BLOCK }

SELECT t2.3
FROM t_tuple_element; -- { serverError ARGUMENT_OUT_OF_BOUND, NOT_FOUND_COLUMN_IN_BLOCK }

SELECT tupleElement(t2, materialize(1))
FROM t_tuple_element; -- { serverError ILLEGAL_TYPE_OF_ARGUMENT }

SYSTEM DROP  TABLE t_tuple_element;