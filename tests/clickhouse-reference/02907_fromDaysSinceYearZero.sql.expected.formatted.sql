SELECT '-- negative tests';

SELECT fromDaysSinceYearZero();

SELECT fromDaysSinceYearZero32();

SELECT fromDaysSinceYearZero(1, 2);

SELECT fromDaysSinceYearZero32(1, 2);

SELECT fromDaysSinceYearZero('needs a number');

SELECT fromDaysSinceYearZero32('needs a number');

SELECT fromDaysSinceYearZero(-3);

SELECT fromDaysSinceYearZero32(-3);

SELECT
    719527 AS u,
    toInt32(u) AS s,
    fromDaysSinceYearZero(u),
    fromDaysSinceYearZero(materialize(u)),
    fromDaysSinceYearZero(s),
    fromDaysSinceYearZero(materialize(s));

SELECT
    719528 AS u,
    toInt32(u) AS s,
    fromDaysSinceYearZero(u),
    fromDaysSinceYearZero(materialize(u)),
    fromDaysSinceYearZero(s),
    fromDaysSinceYearZero(materialize(s));

SELECT
    719529 AS u,
    toInt32(u) AS s,
    fromDaysSinceYearZero(u),
    fromDaysSinceYearZero(materialize(u)),
    fromDaysSinceYearZero(s),
    fromDaysSinceYearZero(materialize(s));

SELECT
    785062 AS u,
    toInt32(u) AS s,
    fromDaysSinceYearZero(u),
    fromDaysSinceYearZero(materialize(u)),
    fromDaysSinceYearZero(s),
    fromDaysSinceYearZero(materialize(s));

SELECT
    785063 AS u,
    toInt32(u) AS s,
    fromDaysSinceYearZero(u),
    fromDaysSinceYearZero(materialize(u)),
    fromDaysSinceYearZero(s),
    fromDaysSinceYearZero(materialize(s));

SELECT
    785064 AS u,
    toInt32(u) AS s,
    fromDaysSinceYearZero(u),
    fromDaysSinceYearZero(materialize(u)),
    fromDaysSinceYearZero(s),
    fromDaysSinceYearZero(materialize(s));

SELECT
    693960 AS u,
    toInt32(u) AS s,
    fromDaysSinceYearZero32(u),
    fromDaysSinceYearZero32(materialize(u)),
    fromDaysSinceYearZero32(s),
    fromDaysSinceYearZero32(materialize(s));

SELECT
    693961 AS u,
    toInt32(u) AS s,
    fromDaysSinceYearZero32(u),
    fromDaysSinceYearZero32(materialize(u)),
    fromDaysSinceYearZero32(s),
    fromDaysSinceYearZero32(materialize(s));

SELECT
    693962 AS u,
    toInt32(u) AS s,
    fromDaysSinceYearZero32(u),
    fromDaysSinceYearZero32(materialize(u)),
    fromDaysSinceYearZero32(s),
    fromDaysSinceYearZero32(materialize(s));

SELECT
    840056 AS u,
    toInt32(u) AS s,
    fromDaysSinceYearZero32(u),
    fromDaysSinceYearZero32(materialize(u)),
    fromDaysSinceYearZero32(s),
    fromDaysSinceYearZero32(materialize(s));

SELECT
    840057 AS u,
    toInt32(u) AS s,
    fromDaysSinceYearZero32(u),
    fromDaysSinceYearZero32(materialize(u)),
    fromDaysSinceYearZero32(s),
    fromDaysSinceYearZero32(materialize(s));

SELECT
    840058 AS u,
    toInt32(u) AS s,
    fromDaysSinceYearZero32(u),
    fromDaysSinceYearZero32(materialize(u)),
    fromDaysSinceYearZero32(s),
    fromDaysSinceYearZero32(materialize(s));

SELECT
    toUInt8(255) AS u,
    toInt8(127) AS s,
    fromDaysSinceYearZero(u),
    fromDaysSinceYearZero32(u),
    fromDaysSinceYearZero(s),
    fromDaysSinceYearZero32(s);

SELECT
    toUInt16(65535) AS u,
    toInt16(32767) AS s,
    fromDaysSinceYearZero(u),
    fromDaysSinceYearZero32(u),
    fromDaysSinceYearZero(s),
    fromDaysSinceYearZero32(s);

SELECT
    toUInt64(719529) AS u,
    toInt64(719529) AS s,
    fromDaysSinceYearZero(u),
    fromDaysSinceYearZero32(u),
    fromDaysSinceYearZero(s),
    fromDaysSinceYearZero32(s);

SELECT
    fromDaysSinceYearZero(NULL),
    fromDaysSinceYearZero32(NULL);

SELECT fromDaysSinceYearZero32(2147483648);

SELECT fromDaysSinceYearZero32(3);

SELECT FROM_DAYS(1);