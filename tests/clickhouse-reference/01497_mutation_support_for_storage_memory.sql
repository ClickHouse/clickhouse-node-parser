CREATE TABLE defaults
(
	n Int32,
	s String
)ENGINE = Memory();
INSERT INTO defaults VALUES(1, '1') (2, '2') (3, '3') (4, '4') (5, '5');
SELECT * FROM defaults;
SELECT count(*) FROM defaults;
