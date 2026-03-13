-- Tags: no-fasttest
-- no-fasttest: depends on model binary and model details via config files
/*
Output language code mapping:
  Bengali           0
  Mandarin Chinese  1
  German            2
  Greek             3
  English           4
  French            5
  Russian           6
  Spanish           7
*/
SELECT
    number,
    naiveBayesClassifier('lang_byte_2', 'She painted the wall a bright yellow')
FROM numbers(10)
ORDER BY number ASC;

SELECT
    model_name,
    input_text,
    naiveBayesClassifier(model_name, input_text) AS classification
FROM
    model_names
CROSS JOIN input_texts
ORDER BY
    model_name ASC,
    input_text ASC;