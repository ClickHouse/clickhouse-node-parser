-- Tags: no-parallel
-- Tag no-parallel: Messes with internal cache

-- Test for issue #81506 (recursive CTEs return wrong results if the query condition cache is on)

SET allow_experimental_analyzer = 1; -- needed by recursive CTEs
SELECT '-- Prepare data';
DROP TABLE IF EXISTS tab;
CREATE TABLE tab
(
    id String,
    parent String,
)
ENGINE = MergeTree
ORDER BY tuple();
INSERT INTO tab (id, parent) VALUES
  ('uuid1', 'uuid2'),
  ('uuid3', 'uuid4'),
  ('uuid4', 'uuid2'),
  ('uuid2', 'empty'),
  ('uuid5', 'uuid2'),
  ('uuid6', 'uuid4');
DROP TABLE tab;
