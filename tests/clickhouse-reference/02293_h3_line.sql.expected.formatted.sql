SELECT length(h3Line(stringToH3(start), stringToH3(`end`)))
FROM h3_indexes
ORDER BY id ASC;

SELECT h3Line(0xffffffffffffff, 0xffffffffffffff);