select max(blockSize()), min(blockSize()), any(ignore(*)) from tab_00484;
select blockSize(), * from tab_00484 where x = 1 or x > 36 format Null;
select s from tab_00484 where s == '' format Null;
select count(*) from tab_00484 prewhere s != 'abc' format Null;
select count(*) from tab_00484 prewhere s = 'abc' format Null;
