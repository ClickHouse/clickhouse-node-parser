CREATE TABLE constrained
(
    URL String,
    CONSTRAINT is_censor CHECK domainWithoutWWW(URL) = 'censor.net',
    CONSTRAINT is_utf8 CHECK isValidUTF8(URL)
)
ENGINE = Null;

INSERT INTO constrained; -- { serverError VIOLATED_CONSTRAINT }

INSERT INTO constrained; -- { serverError VIOLATED_CONSTRAINT }

INSERT INTO constrained;

CREATE TABLE constrained
(
    URL String,
    CONSTRAINT is_censor CHECK domainWithoutWWW(URL) = 'censor.net',
    CONSTRAINT is_utf8 CHECK isValidUTF8(URL)
)
ENGINE = Memory;

SELECT count()
FROM constrained;

CREATE TABLE constrained
(
    URL String,
    CONSTRAINT is_censor CHECK domainWithoutWWW(URL) = 'censor.net',
    CONSTRAINT is_utf8 CHECK isValidUTF8(URL)
)
ENGINE = StripeLog;

CREATE TABLE constrained
(
    URL String,
    CONSTRAINT is_censor CHECK domainWithoutWWW(URL) = 'censor.net',
    CONSTRAINT is_utf8 CHECK isValidUTF8(URL)
)
ENGINE = TinyLog;

CREATE TABLE constrained
(
    URL String,
    CONSTRAINT is_censor CHECK domainWithoutWWW(URL) = 'censor.net',
    CONSTRAINT is_utf8 CHECK isValidUTF8(URL)
)
ENGINE = Log;

CREATE TABLE constrained2 AS constrained;

INSERT INTO constrained2; -- { serverError VIOLATED_CONSTRAINT }