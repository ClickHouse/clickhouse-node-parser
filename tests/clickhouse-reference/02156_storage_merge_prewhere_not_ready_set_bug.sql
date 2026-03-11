select sum(x), min(x + x), max(x + x) from merge(currentDatabase(), '^merge_kek_.$') where x > 200 and y in (select 500 + number * 2 from numbers(100)) settings max_threads=2;
