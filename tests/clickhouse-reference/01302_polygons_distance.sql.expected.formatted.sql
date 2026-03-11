SELECT polygonsDistanceCartesian([[[(0, 0),(0, 3),(1, 2.9),(2, 2.6),(2.6, 2),(2.9, 1),(3, 0),(0, 0)]]], [[[(1., 1.),(1., 4.),(4., 4.),(4., 1.),(1., 1.)]]]);

SELECT polygonsDistanceCartesian([[[(0, 0), (0, 0.1), (0.1, 0.1), (0.1, 0)]]], [[[(1., 1.),(1., 4.),(4., 4.),(4., 1.),(1., 1.)]]]);

SELECT polygonsDistanceSpherical([[[(23.725750, 37.971536)]]], [[[(4.3826169, 50.8119483)]]]);

SELECT polygonsDistanceSpherical(x, y)
FROM polygon_01302;