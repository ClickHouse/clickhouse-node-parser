-- INSERT INTO keeper_retries_r1 SETTINGS insert_keeper_fault_injection_mode=1, insert_keeper_fault_injection_probability=0.05, insert_keeper_fault_injection_seed=1 VALUES (21);
-- INSERT INTO keeper_retries_r1 SETTINGS insert_keeper_fault_injection_mode=1, insert_keeper_fault_injection_probability=0.2, insert_keeper_max_retries=100, insert_keeper_retry_max_backoff_ms=1, insert_keeper_fault_injection_seed=2 VALUES (22);
-- INSERT INTO keeper_retries_r1 SETTINGS insert_keeper_fault_injection_mode=1, insert_keeper_fault_injection_probability=0.3, insert_keeper_max_retries=100, insert_keeper_retry_max_backoff_ms=1, insert_keeper_fault_injection_seed=3 VALUES (23);
-- INSERT INTO keeper_retries_r1 SETTINGS insert_keeper_fault_injection_mode=1, insert_keeper_fault_injection_probability=0.4, insert_keeper_max_retries=100, insert_keeper_retry_max_backoff_ms=1, insert_keeper_fault_injection_seed=4 VALUES (24);
SELECT *
FROM keeper_retries_r1
ORDER BY a ASC;