select * from insub where i in (select toInt32(3) from numbers(10));
