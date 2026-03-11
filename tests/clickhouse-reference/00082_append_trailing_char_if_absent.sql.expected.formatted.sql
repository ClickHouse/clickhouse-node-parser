SELECT appendTrailingCharIfAbsent('', 'a') = '';

SELECT appendTrailingCharIfAbsent('a', 'a') = 'a';

SELECT appendTrailingCharIfAbsent('a', 'b') = 'ab';

SELECT appendTrailingCharIfAbsent(materialize(''), 'a') = materialize('');

SELECT appendTrailingCharIfAbsent(materialize('a'), 'a') = materialize('a');

SELECT appendTrailingCharIfAbsent(materialize('a'), 'b') = materialize('ab');