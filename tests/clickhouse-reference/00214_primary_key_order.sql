SELECT x FROM primary_key ORDER BY x;
SELECT 'a', -x FROM primary_key WHERE -x < -3;
SELECT 'b', -x FROM primary_key WHERE -x < -2;
SELECT 'c', -x FROM primary_key WHERE -x < -1;
SELECT 'd', -x FROM primary_key WHERE -x < toInt8(0);
