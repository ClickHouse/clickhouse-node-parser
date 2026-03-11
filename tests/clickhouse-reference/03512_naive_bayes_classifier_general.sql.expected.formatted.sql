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