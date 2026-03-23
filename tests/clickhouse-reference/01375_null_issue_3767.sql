CREATE TABLE null_issue_3767 (value Nullable(String)) ENGINE=Memory;
INSERT INTO null_issue_3767 (value) VALUES ('A String'), (NULL);
SELECT value FROM null_issue_3767 WHERE value NOT IN ('A String');
