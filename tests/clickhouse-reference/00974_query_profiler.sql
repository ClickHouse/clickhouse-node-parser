SELECT sleep(0.5), ignore('test real time query profiler');
SELECT count(), ignore('test cpu time query profiler') FROM numbers_mt(10000000000);
