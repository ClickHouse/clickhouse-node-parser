# Claude Development Guide

## Best Practices

- Formatting functions (like `format()` or `formatExplain()` should not include parsing code. The parser should do all parsing, and store structured data in the AST. The formatter should then format the AST data, without further parsing being required).
- In the grammar, use PEG grammar rules for parsing, not JavaScript code.
- All AST Node kinds should be included in `ASTNodeKindMap` (and therefore `ASTNode`).
- All AST Node types should include comment, location, and parent metadata.
- No syntax should be stored in the AST as raw strings when it is a syntactical structure. Literals may be stored as unstructured, but otherwise the AST should have enough information that a user could fully understand the input statement without further parsing of any raw strings.