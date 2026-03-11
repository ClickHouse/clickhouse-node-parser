select transactionID();
select 1, system.parts.name, txn_counters.creation_tid = system.parts.creation_tid from txn_counters join system.parts on txn_counters._part = system.parts.name where database=currentDatabase() and table='txn_counters' order by system.parts.name;
select 2, name, creation_csn, removal_tid, removal_csn from system.parts where database=currentDatabase() and table='txn_counters' order by system.parts.name;
select 3, system.parts.name, txn_counters.creation_tid = system.parts.creation_tid from txn_counters join system.parts on txn_counters._part = system.parts.name where database=currentDatabase() and table='txn_counters' order by system.parts.name;
select 4, name, creation_csn, removal_tid, removal_csn from system.parts where database=currentDatabase() and table='txn_counters' order by system.parts.name;
select 5, transactionID().3 == serverUUID();
select 6, system.parts.name, txn_counters.creation_tid = system.parts.creation_tid from txn_counters join system.parts on txn_counters._part = system.parts.name where database=currentDatabase() and table='txn_counters' order by system.parts.name;
select 7, name, removal_tid, removal_csn from system.parts where database=currentDatabase() and table='txn_counters' and active order by system.parts.name;
select 8, transactionID().3 == serverUUID();
select indexOf((select arraySort(groupUniqArray(tid)) from system.transactions_info_log where database=currentDatabase() and table='txn_counters'), tid),
       type,
       thread_id!=0,
       length(query_id)=length(queryID()) or type='Commit' and query_id='',  -- ignore fault injection after commit
       tid_hash!=0,
       csn=0,
       part
from system.transactions_info_log
where tid in (select tid from system.transactions_info_log where database=currentDatabase() and table='txn_counters' and not (tid.1=1 and tid.2=1))
or (database=currentDatabase() and table='txn_counters') order by event_time;
