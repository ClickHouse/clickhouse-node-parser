SELECT count() from buf prewhere ts > toDateTime('2019-03-01 12:00:00') and ts < toDateTime('2019-03-02 12:00:00');
