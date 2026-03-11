SELECT hostName(), * FROM merge(currentDatabase(), '^merge_host_remote_tab_') ORDER BY number FORMAT Null;
