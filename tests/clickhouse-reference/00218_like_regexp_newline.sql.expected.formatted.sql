SELECT like('abcdef', '%abc%def%');

SELECT like('abctdef', '%abc%def%');

SELECT like('abc\ndef', '%abc%def%');

SELECT like('abc\ntdef', '%abc%def%');

SELECT like('abct\ndef', '%abc%def%');

SELECT like('abc\n\ndef', '%abc%def%');

SELECT like('abc\n\ntdef', '%abc%def%');

SELECT like('abc\nt\ndef', '%abc%def%');

SELECT like('abct\n\ndef', '%abc%def%');

SELECT like('ab\ndef', '%abc%def%');

SELECT like('abc\nef', '%abc%def%');