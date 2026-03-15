-- { echoOff }

SELECT formatDateTimeInJodaSyntax(toDateTime('2018-01-12 22:33:44'), 'z'); -- { serverError NOT_IMPLEMENTED }
SELECT formatDateTimeInJodaSyntax(toDateTime('2018-01-12 22:33:44'), 'zz'); -- { serverError NOT_IMPLEMENTED }
SELECT formatDateTimeInJodaSyntax(toDateTime('2018-01-12 22:33:44'), 'zzz'); -- { serverError NOT_IMPLEMENTED }
SELECT formatDateTimeInJodaSyntax(toDateTime('2018-01-12 22:33:44'), 'b'); -- { serverError NOT_IMPLEMENTED }
SELECT formatDateTimeInJodaSyntax(toDate32('2018-01-12 22:33:44'), 'z'); -- { serverError NOT_IMPLEMENTED }
SELECT formatDateTimeInJodaSyntax(toDate32('2018-01-12 22:33:44'), 'zz'); -- { serverError NOT_IMPLEMENTED }
SELECT formatDateTimeInJodaSyntax(toDate32('2018-01-12 22:33:44'), 'zzz'); -- { serverError NOT_IMPLEMENTED }
SELECT formatDateTimeInJodaSyntax(toDate32('2018-01-12 22:33:44'), 'b'); -- { serverError NOT_IMPLEMENTED }
SELECT formatDateTimeInJodaSyntax(toDate32('2018-01-12 22:33:44'), '\'aaaa\'\''); -- { serverError BAD_ARGUMENTS }
-- Bug #64613
select formatDateTimeInJodaSyntax(toDate('2012-05-29'), 'D');
select formatDateTimeInJodaSyntax(toDateTime('2010-10-27 13:41:27'), 'D');
