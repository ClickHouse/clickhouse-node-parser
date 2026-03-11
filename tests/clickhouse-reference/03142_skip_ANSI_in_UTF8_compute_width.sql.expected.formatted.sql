SELECT format('[38;2;{0};{1};{2}m█[0m', 255, 128, 128) AS x
FORMAT Pretty;

SELECT
    'Hello',
    format('[38;2;{0};{1};{2}m█[0m test [38;2;{0};{1};{2}m█[0m', 255, 128, 128) AS x
FORMAT Pretty;