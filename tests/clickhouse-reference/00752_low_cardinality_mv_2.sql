SELECT any(acctstatustype = 'Stop') FROM radacct WHERE (acctstatustype = 'Stop') AND ((acctinputoctets + acctoutputoctets) > 0);
select tadig, ts, dow, sumMerge(traffic_bytes), maxMerge(last_stop), minMerge(min_radacctid), maxMerge(max_radacctid) from mv_traffic_by_tadig15min group by tadig, ts, dow;
