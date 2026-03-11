SELECT json.`^a`
FROM test
GROUP BY json.`^a`
ORDER BY toString(json.`^a`) ASC;