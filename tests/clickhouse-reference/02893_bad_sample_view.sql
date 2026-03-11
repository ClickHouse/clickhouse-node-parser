SELECT * FROM merge(currentDatabase(), '^view_without_sample$') SAMPLE 1 / 100;
