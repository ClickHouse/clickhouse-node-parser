-- Tags: long

-- test became more than an order of magnitude slower with max_bytes_before_external_sort=1
set max_bytes_before_external_sort = 0;
set max_bytes_ratio_before_external_sort = 0;
set max_insert_threads = 4;
create table stack(item_id Int64, brand_id Int64, rack_id Int64, dt DateTime, expiration_dt DateTime, quantity UInt64)
Engine = MergeTree
partition by toYYYYMM(dt)
order by (brand_id, toStartOfHour(dt)) SETTINGS index_granularity = 8192, index_granularity_bytes = '10Mi';
select '---- arrays ----';
select cityHash64( toString( groupArray (tuple(*) ) )) from (
    select brand_id, rack_id, arrayJoin(arraySlice(arraySort(groupArray(quantity)),1,2)) quantity
    from stack
    group by brand_id, rack_id
    order by brand_id, rack_id, quantity
) t;
select cityHash64( toString( groupArray (tuple(*) ) )) from (
    select brand_id, rack_id,  quantity from
       ( select brand_id, rack_id, quantity, row_number() over (partition by brand_id, rack_id order by quantity) rn
         from stack ) as t0
    where rn <= 2
    order by brand_id, rack_id, quantity
) t;
