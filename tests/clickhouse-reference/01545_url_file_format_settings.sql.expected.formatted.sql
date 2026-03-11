SELECT *
FROM file_delim;

SELECT *
FROM url_delim;

SELECT *
FROM file('01545_url_file_format_settings.csv', CSV, 'a int, b int')
SETTINGS format_csv_delimiter = '|';

SELECT *
FROM url('http://127.0.0.1:8123/?query=select%201%2C%202%20format%20CSV%20settings%20format_csv_delimiter%3D%27/%27%3B%0A', CSV, 'a int, b int')
SETTINGS format_csv_delimiter = '/';