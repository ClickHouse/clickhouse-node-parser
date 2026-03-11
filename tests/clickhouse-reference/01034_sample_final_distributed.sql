select count() from sample_final;
select count() from sample_final final;
select count() from sample_final sample 1/2;
select count() from sample_final final sample 1/2;
select count() from remote('127.0.0.{2|3}', currentDatabase(), sample_final) final;
