SELECT toStartOfInterval(timestamp, toIntervalSecond(300)) AS ts
FROM tab
WHERE ts > '2022-11-24 11:19:00'
GROUP BY ts;