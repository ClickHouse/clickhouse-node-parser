SELECT printf('%%d: %d', 123);

SELECT printf('%%d: %d', -123);

SELECT printf('%%d: %d', 0);

SELECT printf('%%d: %d', 9223372036854775807);

SELECT printf('%%i: %i', 123);

SELECT printf('%%u: %u', 123);

SELECT printf('%%o: %o', 123);

SELECT printf('%%x: %x', 123);

SELECT printf('%%f: %f', 0.0);

SELECT printf('%%f: %f', 123.456);

SELECT printf('%%f: %f', -123.456);

SELECT printf('%%e: %e', 123.456);

SELECT printf('%%g: %g', 123.456);

SELECT printf('%%a: %a', 123.456);

SELECT printf('%%s: %s', 'abc');

SELECT printf('%%s: %s', '\n\t')
FORMAT PrettyCompact;

SELECT printf('%%s: %s', '');

SELECT printf('%%%%: %%');

SELECT printf('%%.5d: %.5d', 123);

SELECT printf('%%.2f: %.2f', 123.456);

SELECT printf('%%.2e: %.2e', 123.456);

SELECT printf('%%.2g: %.2g', 123.456);

SELECT printf('%%.2s: %.2s', 'abc');

SELECT printf('%%X: %X', 123.123);

SELECT printf('%%A: %A', 'abc');

SELECT printf('%%s: %s', 100);

SELECT printf('%%n: %n', 100);

SELECT printf('%%f: %f', 0);