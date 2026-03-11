SELECT overlay('hello', 'world'); -- { serverError NUMBER_OF_ARGUMENTS_DOESNT_MATCH }
SELECT overlay('hello', 'world', 2, 3, 'extra'); -- { serverError NUMBER_OF_ARGUMENTS_DOESNT_MATCH }
SELECT overlay(123, 'world', 2, 3); -- { serverError ILLEGAL_TYPE_OF_ARGUMENT }
SELECT overlay('hello', 456, 2, 3); -- { serverError ILLEGAL_TYPE_OF_ARGUMENT }
SELECT overlay('hello', 'world', 'two', 3); -- { serverError ILLEGAL_TYPE_OF_ARGUMENT }
SELECT overlay('hello', 'world', 2, 'three'); -- { serverError ILLEGAL_TYPE_OF_ARGUMENT }
SELECT overlay('Spark SQL', '_', 6), overlayUTF8('Spark SQL和CH', '_', 6);
SELECT overlay(materialize('Spark SQL'), '_', 6), overlayUTF8(materialize('Spark SQL和CH'), '_', 6);
SELECT overlay('Spark SQL', materialize('_'), 6), overlayUTF8('Spark SQL和CH', materialize('_'), 6);
SELECT overlay('Spark SQL', '_', materialize(6)), overlayUTF8('Spark SQL和CH', '_', materialize(6));
SELECT overlay(materialize('Spark SQL'), materialize('_'), 6), overlayUTF8(materialize('Spark SQL和CH'), materialize('_'), 6);
SELECT overlay(materialize('Spark SQL'), '_', materialize(6)), overlayUTF8(materialize('Spark SQL和CH'), '_', materialize(6));
SELECT overlay('Spark SQL', materialize('_'), materialize(6)), overlayUTF8('Spark SQL和CH', materialize('_'), materialize(6));
SELECT overlay(materialize('Spark SQL'), materialize('_'), materialize(6)), overlayUTF8(materialize('Spark SQL和CH'), materialize('_'), materialize(6));
SELECT overlay('Spark SQL', 'ANSI ', 7, 0), overlayUTF8('Spark SQL和CH', 'ANSI ', 7, 0);
SELECT overlay(materialize('Spark SQL'), 'ANSI ', 7, 0), overlayUTF8(materialize('Spark SQL和CH'), 'ANSI ', 7, 0);
SELECT overlay('Spark SQL', materialize('ANSI '), 7, 0), overlayUTF8('Spark SQL和CH', materialize('ANSI '), 7, 0);
SELECT overlay('Spark SQL', 'ANSI ', materialize(7), 0), overlayUTF8('Spark SQL和CH', 'ANSI ', materialize(7), 0);
SELECT overlay('Spark SQL', 'ANSI ', 7, materialize(0)), overlayUTF8('Spark SQL和CH', 'ANSI ', 7, materialize(0));
SELECT overlay(materialize('Spark SQL'), materialize('ANSI '), 7, 0), overlayUTF8(materialize('Spark SQL和CH'), materialize('ANSI '), 7, 0);
SELECT overlay(materialize('Spark SQL'), 'ANSI ', materialize(7), 0), overlayUTF8(materialize('Spark SQL和CH'), 'ANSI ', materialize(7), 0);
SELECT overlay(materialize('Spark SQL'), 'ANSI ', 7, materialize(0)), overlayUTF8(materialize('Spark SQL和CH'), 'ANSI ', 7, materialize(0));
SELECT overlay('Spark SQL', materialize('ANSI '), materialize(7), 0), overlayUTF8('Spark SQL和CH', materialize('ANSI '), materialize(7), 0);
SELECT overlay('Spark SQL', materialize('ANSI '), 7, materialize(0)), overlayUTF8('Spark SQL和CH', materialize('ANSI '), 7, materialize(0));
SELECT overlay('Spark SQL', 'ANSI ', materialize(7), materialize(0)), overlayUTF8('Spark SQL和CH', 'ANSI ', materialize(7), materialize(0));
SELECT overlay(materialize('Spark SQL'), materialize('ANSI '), materialize(7), 0), overlayUTF8(materialize('Spark SQL和CH'), materialize('ANSI '), materialize(7), 0);
SELECT overlay(materialize('Spark SQL'), materialize('ANSI '), 7, materialize(0)), overlayUTF8(materialize('Spark SQL和CH'), materialize('ANSI '), 7, materialize(0));
SELECT overlay(materialize('Spark SQL'), 'ANSI ', materialize(7), materialize(0)), overlayUTF8(materialize('Spark SQL和CH'), 'ANSI ', materialize(7), materialize(0));
SELECT overlay('Spark SQL', materialize('ANSI '), materialize(7), materialize(0)), overlayUTF8('Spark SQL和CH', materialize('ANSI '), materialize(7), materialize(0));
SELECT overlay(materialize('Spark SQL'), materialize('ANSI '), materialize(7), materialize(0)), overlayUTF8(materialize('Spark SQL和CH'), materialize('ANSI '), materialize(7), materialize(0));
SELECT overlay('', '_', 6), overlayUTF8('', '_', 6);
SELECT overlay('Spark SQL', '', 6), overlayUTF8('Spark SQL和CH', '', 6);
SELECT overlay('', 'ANSI ', 7, 0), overlayUTF8('', 'ANSI ', 7, 0);
SELECT overlay('Spark SQL', '', 7, 0), overlayUTF8('Spark SQL和CH', '', 7, 0);
