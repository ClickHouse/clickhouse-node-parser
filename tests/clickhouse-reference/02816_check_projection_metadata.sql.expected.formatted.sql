CREATE TABLE kek
(
    uuid FixedString(16),
    id int,
    ns String,
    dt DateTime64(6),
    PROJECTION null_pk (    SELECT *
    ORDER BY
        ns ASC,
        1 ASC,
        4 ASC)
)
ENGINE = MergeTree
ORDER BY (id, dt, uuid); -- {serverError ILLEGAL_COLUMN }