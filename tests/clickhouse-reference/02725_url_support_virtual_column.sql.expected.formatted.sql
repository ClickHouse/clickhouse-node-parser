SELECT _path
FROM url('http://127.0.0.1:8123/?query=select+1&user=default', LineAsString, 's String');

SELECT _file
FROM url('http://127.0.0.1:8123/?query=select+1&user=default', LineAsString, 's String');

SELECT
    _file,
    count()
FROM url('http://127.0.0.1:8123/?query=select+1&user=default', LineAsString, 's String')
GROUP BY _file;

SELECT
    _path,
    _file,
    s
FROM url('http://127.0.0.1:8123/?query=select+1&user=default', LineAsString, 's String');

SELECT
    _path,
    _file,
    s
FROM url('http://127.0.0.1:8123/?query=select+1&user=default&password=wrong', LineAsString, 's String'); -- { serverError RECEIVED_ERROR_FROM_REMOTE_IO_SERVER }