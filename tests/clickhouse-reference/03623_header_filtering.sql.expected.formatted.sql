SELECT *
FROM url('http://google.com', 'RawBLOB', 'data String', headers('exact_header' = 'true'));

SELECT *
FROM url('http://google.com', 'RawBLOB', 'data String', headers('exact_header	' = 'true', 'exact_header	' = 'true'));