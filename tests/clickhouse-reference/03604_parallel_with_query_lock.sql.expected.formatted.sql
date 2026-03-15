SET max_threads = 1;

SET lock_acquire_timeout = 1;

CREATE TABLE t0
(
    c0 Int
)
ENGINE = Memory();