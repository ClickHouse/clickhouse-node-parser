SELECT dictGet(concat(currentDatabase(), '.dict'), 's', number)
FROM numbers(2);