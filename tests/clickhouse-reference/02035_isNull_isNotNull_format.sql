set enable_analyzer = 1;
select isNotNull(1)+isNotNull(2) from remote('127.2', system.one);
