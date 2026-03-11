SELECT tb1.*,tb2.*
FROM
        (
            with tmp0 as (select k1,k2,d1 from tmp_a),
                 tmp_s as (select k1,k2,d0 from tmp_b),
                 tmp1 as (select tmp0.*,tmp_s.d0 from tmp0 left join tmp_s on tmp0.k1=tmp_s.k1 and tmp0.k2=tmp_s.k2)
            select * from tmp1
        ) as tb1
    LEFT JOIN
        (
           with tmp0 as (select k1,k2,d2 from tmp_a),
                 tmp_s as (select k1,k2,d0 from tmp_b),
                 tmp1 as (select tmp0.*,tmp_s.d0 from tmp0 left join tmp_s on tmp0.k1=tmp_s.k1 and tmp0.k2=tmp_s.k2)
            select * from tmp1
        ) as tb2
    ON tb1.k1=tb2.k1 AND tb1.k2=tb2.k2
ORDER BY k1;
