SELECT 1
FROM url('http://localhost:8123/?query=SELECT+1+FROM+t0+FORMAT+JSON', 'JSON', 'c0 Int') AS tx;