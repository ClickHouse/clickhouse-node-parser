SELECT SVG((0., 0.));

SELECT SVG([(0., 0.), (10, 0), (10, 10), (0, 10)]);

SELECT SVG([[(0., 0.), (10, 0), (10, 10), (0, 10)], [(4., 4.), (5, 4), (5, 5), (4, 5)]]);

SELECT SVG([[[(0., 0.), (10, 0), (10, 10), (0, 10)], [(4., 4.), (5, 4), (5, 5), (4, 5)]], [[(-10., -10.), (-10, -9), (-9, 10)]]]);

SELECT SVG((0., 0.), 'b');

SELECT SVG([(0., 0.), (10, 0), (10, 10), (0, 10)], 'b');

SELECT SVG([[(0., 0.), (10, 0), (10, 10), (0, 10)], [(4., 4.), (5, 4), (5, 5), (4, 5)]], 'b');

SELECT SVG([[[(0., 0.), (10, 0), (10, 10), (0, 10)], [(4., 4.), (5, 4), (5, 5), (4, 5)]], [[(-10., -10.), (-10, -9), (-9, 10)]]], 'b');

SELECT SVG(p)
FROM geo
ORDER BY id ASC;

SELECT SVG(p, 'b')
FROM geo
ORDER BY id ASC;

SELECT SVG((0., 0.), s)
FROM geo
ORDER BY id ASC;

SELECT SVG(p, s)
FROM geo
ORDER BY id ASC;

SELECT SVG([(0., 0.), (10, 0), (10, 10), (0, 10)], s)
FROM geo
ORDER BY id ASC;

SELECT SVG([[(0., 0.), (10, 0), (10, 10), (0, 10)], [(4., 4.), (5, 4), (5, 5), (4, 5)]], s)
FROM geo
ORDER BY id ASC;

SELECT SVG([[[(0., 0.), (10, 0), (10, 10), (0, 10)], [(4., 4.), (5, 4), (5, 5), (4, 5)]], [[(-10., -10.), (-10, -9), (-9, 10)]]], s)
FROM geo
ORDER BY id ASC;