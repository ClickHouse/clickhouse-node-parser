select sleep(1) format Null; -- wait if very fast merge happen
select * from ttl order by d, a;
