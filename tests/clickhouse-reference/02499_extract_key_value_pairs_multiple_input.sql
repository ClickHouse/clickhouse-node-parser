-- Should fail allowed because it exceeds the max number of pairs
SET extract_key_value_pairs_max_pairs_per_row = 1;
-- { echoOn }

SET extract_key_value_pairs_max_pairs_per_row = 2;
SET extract_key_value_pairs_max_pairs_per_row = 0;
