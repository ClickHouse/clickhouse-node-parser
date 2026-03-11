SELECT sum(x) FROM replicated_with_sampling SAMPLE 1/2;
SELECT * FROM replacing;
SELECT * FROM replicated_collapsing;
SELECT * FROM replicated_versioned_collapsing;
SELECT sleep(1); -- If replicated_can_become_leader were true, this replica would become the leader after 1 second.
SELECT is_leader FROM system.replicas WHERE database = currentDatabase() AND table = 'with_settings';
