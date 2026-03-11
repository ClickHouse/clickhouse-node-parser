SELECT ignore(rand() AS k), ignore(max(toString(number))) FROM numbers_10k_log GROUP BY k LIMIT 1;
