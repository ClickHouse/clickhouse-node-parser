1. Pull new test files from ClickHouse repo
2. Run filter script
3. Run `generate:expected-outputs --regenerate-changed`

4:
Loop until there are no "<Parse Errors>" in any .expected file.
1. Run `generate:expected-outputs`
2. Update the grammar to support the syntax that is failing to parse

5. Make `npm run test -- explain` pass, fix the grammar and formatExplain until all of them pass
6. Loop until `npm run generate:expected-outputs && npm test run` passes all tests. Fix the grammar, format, and formatExplain when necessary.
7. For any changes to the grammar, list them and provide an example minimal input and output (AST)

- Agent is not using the new scripts, it's inspecting test output. It's also often re-running tests to capture the output.