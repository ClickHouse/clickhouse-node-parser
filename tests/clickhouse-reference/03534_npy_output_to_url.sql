CREATE TABLE t0 (c0 Int) ENGINE = URL('http://localhost:80/', Npy);
INSERT INTO TABLE t0 (c0) VALUES (1); -- { serverError POCO_EXCEPTION }
