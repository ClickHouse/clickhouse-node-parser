CREATE TABLE weird_mmx (x Array(UInt64)) ENGINE = TinyLog;
SELECT sum(length(*)) FROM weird_mmx;
