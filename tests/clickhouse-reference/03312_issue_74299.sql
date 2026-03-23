CREATE TABLE t0 (c0 Int) ENGINE = Memory;
INSERT INTO TABLE t0 (c0) VALUES (currentProfiles()); -- { error TYPE_MISMATCH }
