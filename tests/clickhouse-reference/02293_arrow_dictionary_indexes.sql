select * from file(currentDatabase() || '_02293_data.arrow') settings max_threads=1;
