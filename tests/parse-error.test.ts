import { parse, ParseError } from '../src/index';

/** Helper: call parse() and return the thrown ParseError, or fail. */
function parseError(sql: string): InstanceType<typeof ParseError> {
  try {
    parse(sql);
  } catch (e) {
    if (e instanceof ParseError) return e;
    throw e;
  }
  throw new Error(`Expected parse("${sql}") to throw ParseError`);
}

describe('ParseError', () => {
  it('throws ParseError on invalid SQL', () => {
    expect(() => parse('SELECT ???')).toThrow(ParseError);
  });

  it('is an instance of Error and SyntaxError', () => {
    const err = parseError('SELECT ???');
    expect(err).toBeInstanceOf(ParseError);
    expect(err).toBeInstanceOf(SyntaxError);
    expect(err).toBeInstanceOf(Error);
  });

  it('has a human-readable message', () => {
    const err = parseError('SELECT ???');
    expect(err.message).toEqual(expect.any(String));
    expect(err.message.length).toBeGreaterThan(0);
  });

  it('includes location with line, column, and offset', () => {
    const err = parseError('SELECT ???');
    expect(err.location.start).toEqual(
      expect.objectContaining({
        line: expect.any(Number),
        column: expect.any(Number),
        offset: expect.any(Number),
      }),
    );
    expect(err.location.end).toEqual(
      expect.objectContaining({
        line: expect.any(Number),
        column: expect.any(Number),
        offset: expect.any(Number),
      }),
    );
  });

  it('includes expected and found properties', () => {
    const err = parseError('SELECT ???');
    expect(err.expected).toEqual(expect.arrayContaining([expect.any(Object)]));
    expect([expect.any(String), null]).toContainEqual(err.found);
  });

  it('reports correct location for error on first line', () => {
    const err = parseError('SELECT @@@');
    expect(err.location.start.line).toBe(1);
  });

  it('reports correct line for error on a later line', () => {
    const err = parseError('SELECT 1\nFROM\n???');
    expect(err.location.start.line).toBe(3);
  });

  it('does not throw ParseError for valid SQL', () => {
    expect(() => parse('SELECT 1')).not.toThrow();
  });

  it('returns empty array for empty input', () => {
    expect(parse('')).toEqual([]);
  });

  it('throws on incomplete statement', () => {
    expect(() => parse('SELECT')).toThrow(ParseError);
  });
});
