select _file, * from file('02884_{1,2}.csv') order by _file settings max_threads=1;
