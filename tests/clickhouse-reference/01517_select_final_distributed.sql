SELECT Id, Timestamp
FROM remote('localhost,127.0.0.1,127.0.0.2',currentDatabase(),'test5346') FINAL
ORDER BY Timestamp;
SELECT Id, Timestamp
FROM remote('localhost,127.0.0.1,127.0.0.2',currentDatabase(),'test5346') FINAL
ORDER BY identity(Timestamp);
