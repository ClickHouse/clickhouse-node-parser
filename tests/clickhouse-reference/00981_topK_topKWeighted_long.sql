SELECT arraySort(topK(10)(val1)) FROM topk;
SELECT arraySort(topKWeighted(10)(val1, val2)) FROM topk;
SELECT topKWeighted(10)(toString(number), number) from numbers(3000000);
