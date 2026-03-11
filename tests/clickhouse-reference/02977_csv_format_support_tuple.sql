select * from file(currentDatabase() || '02977_1.csv') settings max_threads=1;
