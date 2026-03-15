CREATE TABLE IF NOT EXISTS defaults
(
    vals String
) ENGINE = Memory;
select val < 1.5 and val > 1.459 from (select entropy(vals) as val from defaults);
CREATE TABLE IF NOT EXISTS defaults
(
     vals UInt64
) ENGINE = Memory;
select val < 2.4 and val > 2.3393 from (select entropy(vals) as val from defaults);
CREATE TABLE IF NOT EXISTS defaults
(
    vals UInt32
) ENGINE = Memory;
CREATE TABLE IF NOT EXISTS defaults
(
    vals Int32
) ENGINE = Memory;
CREATE TABLE IF NOT EXISTS defaults
(
    vals DateTime
) ENGINE = Memory;
select val < 2.189 and val > 2.1886 from (select entropy(vals) as val from defaults);
