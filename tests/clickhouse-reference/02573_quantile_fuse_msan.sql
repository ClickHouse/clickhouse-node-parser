SET optimize_syntax_fuse_functions=1;
CREATE TEMPORARY TABLE datetime (`d` DateTime('UTC'));
SELECT quantile(0.1)(d), quantile(0.5)(d) FROM datetime;
SELECT max(cityHash64(*)) > 0 FROM (SELECT quantile(0.1)(d), quantile(0.5)(d) FROM datetime);
