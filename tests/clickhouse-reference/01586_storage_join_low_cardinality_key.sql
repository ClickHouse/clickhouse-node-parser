CREATE TABLE low_card
(
    `lc` LowCardinality(String)
)
ENGINE = Join(ANY, LEFT, lc);
SELECT * FROM low_card;
SELECT * FROM low_card WHERE lc = '1';
SELECT CAST(lc AS String) FROM low_card;
