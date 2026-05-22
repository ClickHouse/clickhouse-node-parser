CREATE TABLE t0
(
    c0 Variant() PRIMARY KEY
)
ENGINE = Redis('<host>:<port>', 0, '<password>')
PRIMARY KEY c0; -- { serverError BAD_ARGUMENTS }