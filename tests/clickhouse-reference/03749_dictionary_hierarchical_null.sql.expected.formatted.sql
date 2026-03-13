SELECT dictGetDescendants('d0', 'c0', 1); -- { serverError UNSUPPORTED_METHOD }

SELECT dictGetDescendants('d0', 'c0', NULL); -- { serverError UNSUPPORTED_METHOD }

SELECT dictGetDescendants('d0', NULL, 1); -- { serverError UNSUPPORTED_METHOD }

SELECT dictGetChildren('d0', 'c0'); -- { serverError UNSUPPORTED_METHOD }

SELECT dictGetChildren('d0', NULL); -- { serverError UNSUPPORTED_METHOD }

SELECT dictGetChildren(NULL, NULL); -- { serverError UNSUPPORTED_METHOD }

SELECT dictGetDescendants('hierarchical_dictionary', 1, 1);

SELECT dictGetDescendants('hierarchical_dictionary', NULL, 1);

SELECT dictGetDescendants('hierarchical_dictionary', 1, NULL); -- { serverError BAD_ARGUMENTS }

SELECT dictGetChildren('hierarchical_dictionary', 1);

SELECT dictGetChildren('hierarchical_dictionary', NULL);