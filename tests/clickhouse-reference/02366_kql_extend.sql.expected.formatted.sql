CREATE TABLE Ledger
(
    Supplier Nullable(String),
    Fruit String,
    Price Float64,
    Purchase Date
)
ENGINE = Memory;

SET allow_experimental_kusto_dialect = 1;

SET dialect = 'kusto';