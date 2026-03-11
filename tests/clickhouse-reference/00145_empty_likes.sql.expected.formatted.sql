SELECT like(materialize('Hello'), '');

SELECT like(materialize('Hello'), '%');

SELECT like(materialize('Hello'), '%%');

SELECT like(materialize('Hello'), '%%%');

SELECT like(materialize('Hello'), '%_%');

SELECT like(materialize('Hello'), '_');

SELECT like(materialize('Hello'), '_%');

SELECT like(materialize('Hello'), '%_');

SELECT like('Hello', '');

SELECT like('Hello', '%');

SELECT like('Hello', '%%');

SELECT like('Hello', '%%%');

SELECT like('Hello', '%_%');

SELECT like('Hello', '_');

SELECT like('Hello', '_%');

SELECT like('Hello', '%_');