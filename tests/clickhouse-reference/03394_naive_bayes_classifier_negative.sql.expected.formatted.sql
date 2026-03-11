SELECT naiveBayesClassifier('sentiment', 3);

SELECT naiveBayesClassifier(0, 'hello');

SELECT naiveBayesClassifier('zzz_nonexistent_model_4ae239f8', 'hello');

SELECT naiveBayesClassifier('lang_byte_2', '');