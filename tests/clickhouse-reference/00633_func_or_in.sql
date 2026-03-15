create table orin_test (c1 Int32) engine=Memory;
select minus(c1 = 1 or c1=2 or c1 =3, c1=5) from orin_test;
