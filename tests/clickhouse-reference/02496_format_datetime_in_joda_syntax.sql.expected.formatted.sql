SELECT formatDateTimeInJodaSyntax(toDateTime('2018-01-12 22:33:44'), 'z');

SELECT formatDateTimeInJodaSyntax(toDateTime('2018-01-12 22:33:44'), 'zz');

SELECT formatDateTimeInJodaSyntax(toDateTime('2018-01-12 22:33:44'), 'zzz');

SELECT formatDateTimeInJodaSyntax(toDateTime('2018-01-12 22:33:44'), 'b');

SELECT formatDateTimeInJodaSyntax(toDate32('2018-01-12 22:33:44'), 'z');

SELECT formatDateTimeInJodaSyntax(toDate32('2018-01-12 22:33:44'), 'zz');

SELECT formatDateTimeInJodaSyntax(toDate32('2018-01-12 22:33:44'), 'zzz');

SELECT formatDateTimeInJodaSyntax(toDate32('2018-01-12 22:33:44'), 'b');

SELECT formatDateTimeInJodaSyntax(toDate32('2018-01-12 22:33:44'), '''aaaa''''');

SELECT formatDateTimeInJodaSyntax(toDate('2012-05-29'), 'D');

SELECT formatDateTimeInJodaSyntax(toDateTime('2010-10-27 13:41:27'), 'D');