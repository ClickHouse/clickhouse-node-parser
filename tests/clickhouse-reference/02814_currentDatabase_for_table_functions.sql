SELECT sleep(1) FORMAT Null;
-- Insert about should've landed into `null_mv`
SELECT count() FROM null_mv;
