SELECT dictGet('test_dictionary', 'value', tuple('Key'));
SELECT dictGet('test_dictionary', 'value', tuple(materialize('Key')));
SELECT dictGet('test_dictionary', 'value', 'Key');
SELECT dictGet('test_dictionary', 'value', materialize('Key'));
SELECT dictHas('test_dictionary', tuple('Key'));
SELECT dictHas('test_dictionary', tuple(materialize('Key')));
SELECT dictHas('test_dictionary', 'Key');
SELECT dictHas('test_dictionary', materialize('Key'));
