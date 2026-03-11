SELECT abs(sum(_sample_factor) - 3000000) / 3000000 < 0.001 FROM sample_merge_00314 SAMPLE 100000;
SELECT abs(sum(_sample_factor) - 3000000) / 3000000 < 0.001 FROM merge(currentDatabase(), '^sample_00314_\\d$') SAMPLE 100000;
