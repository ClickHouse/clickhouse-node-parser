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
