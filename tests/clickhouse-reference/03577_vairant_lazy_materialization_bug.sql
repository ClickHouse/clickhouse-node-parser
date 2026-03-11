SELECT d.Date, d, d.String FROM test ORDER BY materialize(1), x DESC SETTINGS limit = 1;
