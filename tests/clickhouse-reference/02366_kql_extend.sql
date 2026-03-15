CREATE TABLE Ledger
(    
   Supplier Nullable(String),
   Fruit String ,
   Price Float64,
   Purchase Date 
) ENGINE = Memory;
set allow_experimental_kusto_dialect=1;
set dialect = 'kusto';
