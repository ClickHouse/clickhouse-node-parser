SELECT count()
FROM remote('127.0.0.{2|3}', currentDatabase(), test_max_parallel_replicas_lr)
PREWHERE timestamp > 0;