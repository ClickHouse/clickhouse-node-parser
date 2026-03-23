CREATE TABLE Ledger
(    
   Supplier Nullable(String),
   Fruit String ,
   Price Float64,
   Purchase Date 
) ENGINE = Memory;
INSERT INTO Ledger VALUES  ('Aldi','Apple',4,'2016-09-10'), ('Costco','Apple',2,'2016-09-11'), ('Aldi','Apple',6,'2016-09-10'), ('Costco','Snargaluff',100,'2016-09-12'), ('Aldi','Apple',7,'2016-09-12'), ('Aldi','Snargaluff',400,'2016-09-11'),('Costco','Snargaluff',104,'2016-09-12'),('Aldi','Apple',5,'2016-09-12'),('Aldi','Snargaluff',600,'2016-09-11'),('Costco','Snargaluff',200,'2016-09-10');
set allow_experimental_kusto_dialect=1;
set dialect = 'kusto';
