CREATE TEMPORARY TABLE constrained
(
    URL String,
    CONSTRAINT identity CHECK domainWithoutWWW(URL) = domainWithoutWWW(URL),
    CONSTRAINT is_utf8 CHECK isValidUTF8(URL)
);

INSERT INTO constrained;

DROP TEMPORARY TABLE constrained;

CREATE TEMPORARY TABLE constrained
(
    x UInt8,
    CONSTRAINT bogus CHECK 0
);

INSERT INTO constrained; -- { serverError VIOLATED_CONSTRAINT }