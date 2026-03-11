select ans < 1.1 and ans > 0.9 from
(with (select state from model) as model select evalMLMethod(model, predict1, predict2) as ans from defaults limit 2);
select ans > -0.1 and ans < 0.1 from
(with (select state from model) as model select evalMLMethod(model, predict1, predict2) as ans from defaults limit 2);
