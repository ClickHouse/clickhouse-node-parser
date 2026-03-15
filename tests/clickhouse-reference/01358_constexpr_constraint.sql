CREATE TEMPORARY TABLE constrained
(
    `URL` String,
    CONSTRAINT identity CHECK domainWithoutWWW(URL) = domainWithoutWWW(URL),
    CONSTRAINT is_utf8 CHECK isValidUTF8(URL)
);
CREATE TEMPORARY TABLE constrained (x UInt8, CONSTRAINT bogus CHECK 0);
