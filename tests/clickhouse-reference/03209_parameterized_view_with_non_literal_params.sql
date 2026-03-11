select id from date_pv(dtparam=today());
select id from date_pv(dtparam=yesterday());
select id from date_pv(dtparam=yesterday()+1);
select id from date_pv(dtparam='1974-04-07');
select id from date_pv(dtparam=toDate('1974-04-07'));
select id from date_pv(dtparam=toString(toDate('1974-04-07')));
select id from date_pv(dtparam=toDate('1975-04-07'));
select id from date_pv(dtparam=(select dt from date_table_pv where id = 2));
select id from date32_pv(dtparam=today());
select id from date32_pv(dtparam=yesterday());
select id from date32_pv(dtparam=yesterday()+1);
select id from date32_pv(dtparam='2199-12-31');
select id from date32_pv(dtparam=toDate32('1900-01-01'));
select id from date32_pv(dtparam=(select dt from date32_table_pv where id = 3));
select id from date32_pv(dtparam=(select dt from date32_table_pv where id = 4));
select id from uuid_pv(uuidparam=serverUUID());
select id from uuid_pv(uuidparam=toUUID('11111111-2222-3333-4444-555555555555'));
select id from uuid_pv(uuidparam='11111111-2222-3333-4444-555555555555');
select id from uuid_pv(uuidparam=(select uu from uuid_table_pv where id = 1));
select id from uuid_pv(uuidparam=(select uu from uuid_table_pv where id = 2));
-- generateUUIDv4() is not constant foldable, hence cannot be used as parameter value
select id from uuid_pv(uuidparam=generateUUIDv4()); -- { serverError UNKNOWN_QUERY_PARAMETER }
-- But nested "select generateUUIDv4()"  works!
select id from uuid_pv(uuidparam=(select generateUUIDv4()));
select id from date_pv2(dtparam=today(),intparam=1);
select id from date_pv2(dtparam=today(),intparam=length('A'));
select id from date_pv2(dtparam='1974-04-07',intparam=length('AAA'));
select id from date_pv2(dtparam=toDate('1974-04-07'),intparam=length('BBB'));
select id from ipv4_pv(ipv4param='116.106.34.242');
select id from ipv4_pv(ipv4param=toIPv4('116.106.34.243'));
select id from ipv4_pv(ipv4param=(select ipaddr from ipv4_table_pv where id=3));
