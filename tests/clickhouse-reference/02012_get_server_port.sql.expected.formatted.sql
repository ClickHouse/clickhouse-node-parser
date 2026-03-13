SELECT getServerPort('tcp_port');

SELECT getServerPort('unknown'); -- { serverError CLUSTER_DOESNT_EXIST }