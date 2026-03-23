CREATE TABLE t0
(
    c0 Int
)
ENGINE = URL('http://localhost:80/', Npy);

INSERT INTO t0 (c0); -- { serverError POCO_EXCEPTION }