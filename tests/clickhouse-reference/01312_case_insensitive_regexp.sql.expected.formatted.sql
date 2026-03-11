SELECT match('Too late', 'Too late');

SELECT match('Too late', '(?i)Too late');

SELECT match('Too late', '(?i:too late)');

SELECT match('Too late', '(?i)to{2} late');

SELECT match('Too late', '(?i)to(?)o late');

SELECT match('Too late', '(?i)to+ late');

SELECT match('Too late', '(?i)to(?:o|o) late');