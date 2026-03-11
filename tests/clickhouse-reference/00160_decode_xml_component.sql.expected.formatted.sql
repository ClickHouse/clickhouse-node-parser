SELECT sumDistinct(sipHash64(decodeXMLComponent(Title) AS decoded))
FROM test.hits
WHERE Title != decoded;