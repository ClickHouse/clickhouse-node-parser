SELECT toUInt32(x), y, z FROM pk WHERE x BETWEEN toDateTime(0) AND toDateTime(59);
SELECT toUInt32(x), y, z FROM pk WHERE x BETWEEN toDateTime(120) AND toDateTime(240);
SELECT toUInt32(x), y, z FROM pk WHERE x = toDateTime(1);
SELECT toUInt32(x), y, z FROM pk WHERE (x BETWEEN toDateTime(60) AND toDateTime(119)) AND y = 11;
SELECT toUInt32(x), y, z FROM pk WHERE (x BETWEEN toDateTime(60) AND toDateTime(120)) AND y = 11;
