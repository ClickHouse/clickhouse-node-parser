SELECT groupArray(id) FROM tab WHERE hasAnyTokens(message, ['abc']);
SELECT groupArray(id) FROM tab WHERE hasAnyTokens(message, ['ab']);
SELECT groupArray(id) FROM tab WHERE hasAnyTokens(message, ['foo']);
