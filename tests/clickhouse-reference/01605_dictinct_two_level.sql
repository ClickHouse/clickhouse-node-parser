SELECT groupArray(DISTINCT toString(number % 10)) FROM numbers_mt(50000) 
    GROUP BY number ORDER BY number LIMIT 10
    SETTINGS max_threads = 2, max_block_size = 2000;
SELECT
    domain, arrayUniq(groupArraySample(5, 11111)(DISTINCT subdomain)) AS example_subdomains
FROM distinct_two_level
GROUP BY domain ORDER BY domain, example_subdomains
LIMIT 10;
