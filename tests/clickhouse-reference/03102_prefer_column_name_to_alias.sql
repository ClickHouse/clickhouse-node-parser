CREATE TABLE loans (loan_number int, security_id text) ENGINE=Memory;
SET enable_analyzer=1;
INSERT INTO loans VALUES (1, 'AAA');
INSERT INTO loans VALUES (1, 'BBB');
