DROP TABLE IF EXISTS constrained;
CREATE TABLE constrained (URL String, CONSTRAINT is_censor CHECK domainWithoutWWW(URL) = 'censor.net', CONSTRAINT is_utf8 CHECK isValidUTF8(URL)) ENGINE = Null;
INSERT INTO constrained VALUES ('https://www.censor.net/?q=upyachka'), ('Hello'), ('test'); -- { serverError VIOLATED_CONSTRAINT }
INSERT INTO constrained VALUES ('https://www.censor.net/?q=upyachka'), ('ftp://censor.net/Hello'), ('https://censor.net/te\xFFst'); -- { serverError VIOLATED_CONSTRAINT }
INSERT INTO constrained VALUES ('https://www.censor.net/?q=upyachka'), ('ftp://censor.net/Hello'), (toValidUTF8('https://censor.net/te\xFFst'));
DROP TABLE constrained;
CREATE TABLE constrained (URL String, CONSTRAINT is_censor CHECK domainWithoutWWW(URL) = 'censor.net', CONSTRAINT is_utf8 CHECK isValidUTF8(URL)) ENGINE = Memory;
SELECT count() FROM constrained;
CREATE TABLE constrained (URL String, CONSTRAINT is_censor CHECK domainWithoutWWW(URL) = 'censor.net', CONSTRAINT is_utf8 CHECK isValidUTF8(URL)) ENGINE = StripeLog;
CREATE TABLE constrained (URL String, CONSTRAINT is_censor CHECK domainWithoutWWW(URL) = 'censor.net', CONSTRAINT is_utf8 CHECK isValidUTF8(URL)) ENGINE = TinyLog;
CREATE TABLE constrained (URL String, CONSTRAINT is_censor CHECK domainWithoutWWW(URL) = 'censor.net', CONSTRAINT is_utf8 CHECK isValidUTF8(URL)) ENGINE = Log;
DROP TABLE IF EXISTS constrained2;
CREATE TABLE constrained2 AS constrained;
INSERT INTO constrained2 VALUES ('https://www.censor.net/?q=upyachka'), ('Hello'), ('test'); -- { serverError VIOLATED_CONSTRAINT }
DROP TABLE constrained2;
