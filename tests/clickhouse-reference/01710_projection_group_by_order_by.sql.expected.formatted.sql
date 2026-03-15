CREATE TABLE tp
(
    type Int32,
    eventcnt UInt64,
    PROJECTION p (    SELECT
        sum(eventcnt),
        type
    GROUP BY type
    ORDER BY sum(eventcnt) ASC)
)
ENGINE = MergeTree
ORDER BY type; -- { serverError ILLEGAL_PROJECTION }