select * from mult_tab final order by date, value, sign;
select * from mult_tab;
select '-------------------------';
select * from mult_tab final order by date, value, version, sign;
select date, value, version, sign from mult_tab final order by date, key, sign settings max_block_size=33;
select date, value, version, sign from mult_tab;
