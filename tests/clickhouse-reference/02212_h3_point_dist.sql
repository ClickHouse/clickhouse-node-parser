select '-- select h3PointDistM(lat1, lon1,lat2, lon2) AS k from table1 order by k;';
select round(h3PointDistM(lat1, lon1,lat2, lon2), 2) AS k from table1 order by k;
select round(h3PointDistKm(lat1, lon1,lat2, lon2), 2) AS k from table1 order by k;
select round(h3PointDistRads(lat1, lon1,lat2, lon2), 5) AS k from table1 order by k;
select round(h3PointDistRads(-10.0 ,0.0, 10.0, arrayJoin([0.0])), 5) as h3PointDistRads;
select round(h3PointDistRads(-10.0 ,0.0, 10.0, toFloat64(0)) , 5)as h3PointDistRads;
