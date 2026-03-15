SET flatten_nested = 0;

CREATE TABLE t_nested_detach
(
    n Nested(u UInt32, s String)
)
ENGINE = Log;

SET flatten_nested = 1;