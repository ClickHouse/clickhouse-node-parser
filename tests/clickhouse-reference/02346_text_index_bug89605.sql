SELECT count() FROM tab WHERE hasAllTokens(msg, sparseGrams('click'));
SELECT count() FROM tab WHERE hasAnyTokens(msg, sparseGrams('click'));
SELECT sum(length(tokens(msg, 'sparseGrams'))) FROM tab;
