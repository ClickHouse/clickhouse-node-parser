SELECT dictGetDescendants('d0', 'c0', 1);

SELECT dictGetDescendants('d0', 'c0', NULL);

SELECT dictGetDescendants('d0', NULL, 1);

SELECT dictGetChildren('d0', 'c0');

SELECT dictGetChildren('d0', NULL);

SELECT dictGetChildren(NULL, NULL);

SELECT dictGetDescendants('hierarchical_dictionary', 1, 1);

SELECT dictGetDescendants('hierarchical_dictionary', NULL, 1);

SELECT dictGetDescendants('hierarchical_dictionary', 1, NULL);

SELECT dictGetChildren('hierarchical_dictionary', 1);

SELECT dictGetChildren('hierarchical_dictionary', NULL);