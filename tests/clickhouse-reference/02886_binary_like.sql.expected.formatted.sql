SELECT like('aяb', 'a_b');

SELECT like('a\0b', 'a_b');

SELECT like('a\0b', 'a\0b');

SELECT like('a\0b', 'a%\0b');

SELECT like('a�b', 'a%�b');

SELECT like('a�b', 'a%��b');

SELECT like('a�b', '%a��b');

SELECT like('a��b', '%a��b');

SELECT like(materialize('aяb'), 'a_b');

SELECT like(materialize('a\0b'), 'a_b');

SELECT like(materialize('a\0b'), 'a\0b');

SELECT like(materialize('a\0b'), 'a%\0b');

SELECT like(materialize('a�b'), 'a%�b');

SELECT like(materialize('a�b'), 'a%��b');

SELECT like(materialize('a�b'), '%a��b');

SELECT like(materialize('a��b'), '%a��b');

SELECT like(materialize('aяb'), materialize('a_b'));

SELECT like(materialize('a\0b'), materialize('a_b'));

SELECT like(materialize('a\0b'), materialize('a\0b'));

SELECT like(materialize('a\0b'), materialize('a%\0b'));

SELECT like(materialize('a�b'), materialize('a%�b'));

SELECT like(materialize('a�b'), materialize('a%��b'));

SELECT like(materialize('a�b'), materialize('%a��b'));

SELECT like(materialize('a��b'), materialize('%a��b'));