select if(true, if(lowerUTF8(arr.key) = 'a', 1, 2), 3) as x from t left array join arr;
