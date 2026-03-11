select ans > -67.01 and ans < -66.9 from
(with (select state from model) as model select evalMLMethod(model, predict1, predict2) as ans from defaults limit 1);
-- Check that returned weights are close to real
select ans > 0.49 and ans < 0.51 from
(select stochasticLinearRegression(0.03, 0.00001, 2, 'Nesterov')(target, param1, param2)[1] as ans from defaults);
select ans > -2.01 and ans < -1.99 from
(select stochasticLinearRegression(0.03, 0.00001, 2, 'Nesterov')(target, param1, param2)[2] as ans from defaults);
select ans > 2.99 and ans < 3.01 from
(select stochasticLinearRegression(0.03, 0.00001, 2, 'Nesterov')(target, param1, param2)[3] as ans from defaults);
SELECT ANS[1] > -1.1 AND ANS[1] < -0.9 AND ANS[2] > 5.9 AND ANS[2] < 6.1 AND ANS[3] > 9.9 AND ANS[3] < 10.1 FROM
(SELECT stochasticLinearRegression(0.05, 0, 1, 'SGD')(target, p1, p2) AS ANS FROM grouptest GROUP BY user_id ORDER BY user_id LIMIT 1, 1);
SELECT ANS[1] > 1.9 AND ANS[1] < 2.1 AND ANS[2] > 2.9 AND ANS[2] < 3.1 AND ANS[3] > -3.1 AND ANS[3] < -2.9 FROM
(SELECT stochasticLinearRegression(0.05, 0, 1, 'SGD')(target, p1, p2) AS ANS FROM grouptest GROUP BY user_id ORDER BY user_id LIMIT 0, 1);
