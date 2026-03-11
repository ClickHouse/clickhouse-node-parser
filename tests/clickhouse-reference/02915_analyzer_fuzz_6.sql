SELECT [(arrayJoin([x]), x)] AS row FROM tab;
SELECT arrayJoin([tuple([(toNullable(NULL), -9223372036854775808, toNullable(3.4028234663852886e38), arrayJoin(
[tuple([(toNullable(NULL), 2147483647, toNullable(0.5), k2)])]), k2)])]) AS row, arrayJoin([(1024, k2)]), -9223372036854775807, 256, tupleElement(row, 1048576, 1024) AS k FROM t__fuzz_307 FINAL ORDER BY (toNullable('655.36'), 2, toNullable
('0.2147483648'), k2) ASC, toNullable('102.3') DESC NULLS FIRST, '10.25' DESC, k ASC NULLS FIRST format Null;
SELECT arrayJoin([tuple([(toNullable(NULL), -9223372036854775808, toNullable(3.4028234663852886e38), arrayJoin([tuple([(toNullable(NULL), 2147483647, toNullable(0.5), k2)])]), k2)])]) AS row, arrayJoin([(1024, k2)]), -9223372036854775807, 256, tupleElement(row, 1048576, 1024) AS k FROM t__fuzz_282 FINAL ORDER BY (toNullable('655.36'), 2, toNullable('0.2147483648'), k2) ASC, toNullable('102.3') DESC NULLS FIRST, '10.25' DESC, k ASC NULLS FIRST format Null;
