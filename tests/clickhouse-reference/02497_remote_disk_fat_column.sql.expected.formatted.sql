SELECT x
FROM fat_granularity
PREWHERE like(fat, '256\\_%')
SETTINGS max_threads = 2;