select * from system.mutations where database = currentDatabase() and not is_done format Vertical;
