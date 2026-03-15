-- Tags: distributed

CREATE TABLE IF NOT EXISTS topXtest(A Int64) ENGINE = Memory;
SELECT length(topK(30)(A)) FROM topXtest;
SELECT length(topK(30)(A)) FROM remote('localhost,127.0.0.1', currentDatabase(), topXtest);
SELECT length(topK(A)) FROM topXtest;
SELECT length(topK(A)) FROM remote('localhost,127.0.0.1', currentDatabase(), topXtest);
SELECT length(topK(3)(A)) FROM topXtest;
SELECT length(topK(3)(A)) FROM remote('localhost,127.0.0.1', currentDatabase(), topXtest);
