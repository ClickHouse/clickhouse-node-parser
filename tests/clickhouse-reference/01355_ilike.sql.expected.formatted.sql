-- Tags: no-fasttest
SELECT ilike('Hello', '');

SELECT ilike('Hello', '%');

SELECT ilike('Hello', '%%');

SELECT ilike('Hello', '%%%');

SELECT ilike('Hello', '%_%');

SELECT ilike('Hello', '_');

SELECT ilike('Hello', '_%');

SELECT ilike('Hello', '%_');

SELECT ilike('Hello', 'H%o');

SELECT notILike('Hello', 'H%o');

SELECT ilike('OHello', '%lhell%');

SELECT ilike('Ohello', '%hell%');

SELECT ilike('hEllo', '%HEL%');

SELECT notILike('OHello', '%lhell%');

SELECT notILike('Ohello', '%hell%');

SELECT notILike('hEllo', '%HEL%');

SELECT ilike(materialize('prepre_f'), '%pre_f%');

SELECT ilike('abcdef', '%aBc%def%');

SELECT ilike('ABCDDEF', '%abc%def%');

SELECT ilike('Abc\nDef', '%abc%def%');

SELECT ilike('abc\ntdef', '%abc%def%');

SELECT ilike('abct\ndef', '%abc%dEf%');

SELECT ilike('abc\n\ndeF', '%abc%def%');

SELECT ilike('abc\n\ntdef', '%abc%deF%');

SELECT ilike('Abc\nt\ndef', '%abc%def%');

SELECT ilike('abct\n\ndef', '%abc%def%');

SELECT ilike('ab\ndef', '%Abc%def%');

SELECT ilike('aBc\nef', '%ABC%DEF%');

SELECT ilike(CAST('hello' AS FixedString(5)), '%he%o%');

SELECT ilike('ёЁё', 'Ё%Ё');

SELECT ilike('ощщЁё', 'Щ%Ё');

SELECT ilike('ощЩЁё', '%Щ%Ё');

SELECT ilike('Щущпандер', '%щп%е%');

SELECT ilike('ощщЁё', '%щ%');

SELECT ilike('ощЩЁё', '%ё%');

CREATE TABLE test1
(
    x UInt8
)
ENGINE = Memory;

CREATE TABLE test2
(
    x UInt8
)
ENGINE = Memory;