SELECT seriesOutliersDetectTukey(a)
FROM tb1
ORDER BY n ASC;

SELECT seriesOutliersDetectTukey(a, .10, .90, 1.5)
FROM tb1
ORDER BY n ASC;

SELECT seriesOutliersDetectTukey([-3, 2, 15, 3, 5, 6, 4.50, 5, 12, 45, 12, 3.40, 3, 4, 5, 6]);

SELECT seriesOutliersDetectTukey([-3, 2.40, 15, 3.90, 5, 6, 4.50, 5.20, 12, 60, 12, 3.40, 3, 4, 5, 6, 3.40, 2.7]);

SELECT seriesOutliersDetectTukey([-3, 2, 15, 3, 5, 6, 4.50, 5, 12, 45, 12, 3.40, 3, 4, 5, 6], .25, .75, 1.5);

SELECT seriesOutliersDetectTukey([-3, 2, 15, 3, 5, 6, 4.50, 5, 12, 45, 12, 3.40, 3, 4, 5, 6], .10, .90, 1.5);

SELECT seriesOutliersDetectTukey([-3, 2, 15, 3, 5, 6, 4.50, 5, 12, 45, 12, 3.40, 3, 4, 5, 6], .02, .98, 1.5);

SELECT seriesOutliersDetectTukey([-3, 2, 15, 3], 0.02, 0.98, 1.5);

SELECT seriesOutliersDetectTukey(arrayMap(x -> sin(x / 10), range(30)));

SELECT seriesOutliersDetectTukey([-3, 2, 15, 3, 5, 6, 4, 5, 12, 45, 12, 3, 3, 4, 5, 6], .25, .75, 3);

SELECT seriesOutliersDetectTukey([-3, 2, 15, 3, 5, 6, 4, 5, 12, 45, 12, 3, 3, 4, 5, 6], .25, .75, -1);

SELECT seriesOutliersDetectTukey([-3, 2, 15, 3], .33, .53);

SELECT seriesOutliersDetectTukey([-3, 2, 15, 3], .33);

SELECT seriesOutliersDetectTukey([-3, 2.4, 15, NULL]);

SELECT seriesOutliersDetectTukey([]);

SELECT seriesOutliersDetectTukey([-3, 2.4, 15]);