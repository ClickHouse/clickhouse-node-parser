select * from ( select sum(last_seen) as dates_seen, materialize(1) as last_seen ) where last_seen > 2;
select * from ( select sum(last_seen) as dates_seen, materialize(2) as last_seen ) where last_seen < 2;
select * from ( select sum(last_seen) as dates_seen, materialize(2) as last_seen GROUP BY 'a' ) where last_seen < 2;
select '---';
select * from ( select sum(last_seen) as dates_seen, 1 as last_seen UNION ALL select sum(last_seen) as dates_seen, 3 as last_seen ) where last_seen < 2;
select * from ( select sum(last_seen) as dates_seen, 1 as last_seen UNION ALL select sum(last_seen) as dates_seen, 3 as last_seen ) where last_seen > 2;
