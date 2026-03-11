SELECT '-- Negative tests';

SELECT punycodeEncode();

SELECT punycodeDecode();

SELECT tryPunycodeDecode();

SELECT punycodeEncode(1);

SELECT punycodeDecode(1);

SELECT tryPunycodeDecode(1);

SELECT punycodeEncode('two', 'strings');

SELECT punycodeDecode('two', 'strings');

SELECT tryPunycodeDecode('two', 'strings');

SELECT punycodeEncode(toFixedString('two', 3));

SELECT punycodeDecode(toFixedString('two', 3));

SELECT tryPunycodeDecode(toFixedString('two', 3));

SELECT
    'a' AS str,
    punycodeEncode(str) AS puny,
    punycodeDecode(puny) AS original,
    tryPunycodeDecode(puny) AS original_try;

SELECT
    'London' AS str,
    punycodeEncode(str) AS puny,
    punycodeDecode(puny) AS original,
    tryPunycodeDecode(puny) AS original_try;

SELECT
    'Lloyd-Atkinson' AS str,
    punycodeEncode(str) AS puny,
    punycodeDecode(puny) AS original,
    tryPunycodeDecode(puny) AS original_try;

SELECT
    'This has spaces' AS str,
    punycodeEncode(str) AS puny,
    punycodeDecode(puny) AS original,
    tryPunycodeDecode(puny) AS original_try;

SELECT
    '-> $1.00 <-' AS str,
    punycodeEncode(str) AS puny,
    punycodeDecode(puny) AS original,
    tryPunycodeDecode(puny) AS original_try;

SELECT
    'а' AS str,
    punycodeEncode(str) AS puny,
    punycodeDecode(puny) AS original,
    tryPunycodeDecode(puny) AS original_try;

SELECT
    'ü' AS str,
    punycodeEncode(str) AS puny,
    punycodeDecode(puny) AS original,
    tryPunycodeDecode(puny) AS original_try;

SELECT
    'α' AS str,
    punycodeEncode(str) AS puny,
    punycodeDecode(puny) AS original,
    tryPunycodeDecode(puny) AS original_try;

SELECT
    '例' AS str,
    punycodeEncode(str) AS puny,
    punycodeDecode(puny) AS original,
    tryPunycodeDecode(puny) AS original_try;

SELECT
    '😉' AS str,
    punycodeEncode(str) AS puny,
    punycodeDecode(puny) AS original,
    tryPunycodeDecode(puny) AS original_try;

SELECT
    'αβγ' AS str,
    punycodeEncode(str) AS puny,
    punycodeDecode(puny) AS original,
    tryPunycodeDecode(puny) AS original_try;

SELECT
    'München' AS str,
    punycodeEncode(str) AS puny,
    punycodeDecode(puny) AS original,
    tryPunycodeDecode(puny) AS original_try;

SELECT
    'Mnchen-3ya' AS str,
    punycodeEncode(str) AS puny,
    punycodeDecode(puny) AS original,
    tryPunycodeDecode(puny) AS original_try;

SELECT
    'München-Ost' AS str,
    punycodeEncode(str) AS puny,
    punycodeDecode(puny) AS original,
    tryPunycodeDecode(puny) AS original_try;

SELECT
    'Bahnhof München-Ost' AS str,
    punycodeEncode(str) AS puny,
    punycodeDecode(puny) AS original,
    tryPunycodeDecode(puny) AS original_try;

SELECT
    'abæcdöef' AS str,
    punycodeEncode(str) AS puny,
    punycodeDecode(puny) AS original,
    tryPunycodeDecode(puny) AS original_try;

SELECT
    'правда' AS str,
    punycodeEncode(str) AS puny,
    punycodeDecode(puny) AS original,
    tryPunycodeDecode(puny) AS original_try;

SELECT
    'ยจฆฟคฏข' AS str,
    punycodeEncode(str) AS puny,
    punycodeDecode(puny) AS original,
    tryPunycodeDecode(puny) AS original_try;

SELECT
    'ドメイン名例' AS str,
    punycodeEncode(str) AS puny,
    punycodeDecode(puny) AS original,
    tryPunycodeDecode(puny) AS original_try;

SELECT
    'MajiでKoiする5秒前' AS str,
    punycodeEncode(str) AS puny,
    punycodeDecode(puny) AS original,
    tryPunycodeDecode(puny) AS original_try;

SELECT
    '「bücher」' AS str,
    punycodeEncode(str) AS puny,
    punycodeDecode(puny) AS original,
    tryPunycodeDecode(puny) AS original_try;

SELECT
    '团淄' AS str,
    punycodeEncode(str) AS puny,
    punycodeDecode(puny) AS original,
    tryPunycodeDecode(puny) AS original_try;

SELECT punycodeEncode('');

SELECT punycodeDecode('');

SELECT tryPunycodeDecode('');

SELECT punycodeEncode(NULL);

SELECT punycodeDecode(NULL);

SELECT tryPunycodeDecode(NULL);

SELECT punycodeDecode('no punycode');

SELECT tryPunycodeDecode('no punycode');

SELECT
    'Wenn Sie ... vom Hauptbahnhof in München ... mit zehn Minuten, ohne, dass Sie am Flughafen noch einchecken müssen, dann starten Sie im Grunde genommen am Flughafen ... am ... am Hauptbahnhof in München starten Sie Ihren Flug. Zehn Minuten. Schauen Sie sich mal die großen Flughäfen an, wenn Sie in Heathrow in London oder sonst wo, meine se ... Charles de Gaulle äh in Frankreich oder in ...äh... in ... in...äh...in Rom. Wenn Sie sich mal die Entfernungen ansehen, wenn Sie Frankfurt sich ansehen, dann werden Sie feststellen, dass zehn Minuten... Sie jederzeit locker in Frankfurt brauchen, um ihr Gate zu finden. Wenn Sie vom Flug ... vom ... vom Hauptbahnhof starten - Sie steigen in den Hauptbahnhof ein, Sie fahren mit dem Transrapid in zehn Minuten an den Flughafen in ... an den Flughafen Franz Josef Strauß. Dann starten Sie praktisch hier am Hauptbahnhof in München. Das bedeutet natürlich, dass der Hauptbahnhof im Grunde genommen näher an Bayern ... an die bayerischen Städte heranwächst, weil das ja klar ist, weil auf dem Hauptbahnhof viele Linien aus Bayern zusammenlaufen.' AS str,
    punycodeEncode(str) AS puny,
    punycodeDecode(puny) AS original,
    tryPunycodeDecode(puny) AS original_try
FORMAT Vertical;

SELECT
    str,
    punycodeEncode(str) AS puny,
    punycodeDecode(puny) AS original,
    tryPunycodeDecode(puny) AS original_try
FROM tab;

SELECT
    puny,
    punycodeDecode(puny) AS original
FROM tab;

SELECT
    puny,
    tryPunycodeDecode(puny) AS original
FROM tab;