CREATE TABLE h3_indexes (id int, start String, end String) ENGINE = Memory;
SELECT h3Distance(stringToH3(start), stringToH3(end)) FROM h3_indexes ORDER BY id;
