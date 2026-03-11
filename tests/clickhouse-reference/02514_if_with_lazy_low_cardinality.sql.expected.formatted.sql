SELECT if(true, if(lowerUTF8(arr.key) = 'a', 1, 2), 3) AS x
FROM
    t
LEFT ARRAY JOIN arr;