CREATE TABLE BannerDict (`BannerID` UInt64, `CompaignID` UInt64) ENGINE = ODBC('DSN=pgconn;Database=postgres', bannerdict); -- {serverError NUMBER_OF_ARGUMENTS_DOESNT_MATCH}
