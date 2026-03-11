select * from dist_01072 where key=0 and length(str)=0;
select * from dist_01072 where key=0 and str='';
select * from dist_01072 where xxHash64(0)==xxHash64(0) and key=0;
select * from dist_01072 where key=toInt32OrZero(toString(xxHash64(0)));
select * from dist_01072 where key=toInt32(xxHash32(0));
select * from dist_01072 where key=toInt32(toInt32(xxHash32(0)));
select * from dist_01072 where key=toInt32(toInt32(toInt32(xxHash32(0))));
select * from dist_01072 where key=value; -- { serverError UNABLE_TO_SKIP_UNUSED_SHARDS }
select * from dist_01072 where key=toInt32(value); -- { serverError UNABLE_TO_SKIP_UNUSED_SHARDS }
select * from dist_01072 where key=value settings force_optimize_skip_unused_shards=0;
select * from dist_01072 where key=toInt32(value) settings force_optimize_skip_unused_shards=0;
select * from dist_01072 where key=0 and _part='0' settings force_optimize_skip_unused_shards=2;
