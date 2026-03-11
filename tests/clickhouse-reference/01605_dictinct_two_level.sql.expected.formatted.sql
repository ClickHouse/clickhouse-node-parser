SELECT groupArrayDistinct(toString(number % 10))
FROM numbers_mt(50000)
GROUP BY number
ORDER BY number ASC
LIMIT 10
SETTINGS
    max_threads = 2,
    max_block_size = 2000;

SELECT
    domain,
    arrayUniq(groupArraySampleDistinct(5, 11111)(subdomain)) AS example_subdomains
FROM distinct_two_level
GROUP BY domain
ORDER BY
    domain ASC,
    example_subdomains ASC
LIMIT 10;