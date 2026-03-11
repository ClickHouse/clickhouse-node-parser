SELECT if(1, [cast(materialize(2.0),'Decimal(9,3)')], [cast(materialize(1.0),'Decimal(9,3)')]);

SELECT if(1, [cast(materialize(2.0),'Decimal(18,10)')], [cast(materialize(1.0),'Decimal(18,10)')]);

SELECT if(1, [cast(materialize(2.0),'Decimal(38,18)')], [cast(materialize(1.0),'Decimal(38,18)')]);

SELECT if(0, [cast(materialize(2.0),'Decimal(9,3)')], [cast(materialize(1.0),'Decimal(9,3)')]);

SELECT if(0, [cast(materialize(2.0),'Decimal(18,10)')], [cast(materialize(1.0),'Decimal(18,10)')]);

SELECT if(0, [cast(materialize(2.0),'Decimal(38,18)')], [cast(materialize(1.0),'Decimal(38,18)')]);

SELECT if(1, [cast(materialize(2.0),'Decimal(9,3)')], [cast(materialize(1.0),'Decimal(9,0)')]);

SELECT if(0, [cast(materialize(2.0),'Decimal(18,10)')], [cast(materialize(1.0),'Decimal(18,0)')]);

SELECT if(1, [cast(materialize(2.0),'Decimal(38,18)')], [cast(materialize(1.0),'Decimal(38,8)')]);

SELECT if(0, [cast(materialize(2.0),'Decimal(9,0)')], [cast(materialize(1.0),'Decimal(9,3)')]);

SELECT if(1, [cast(materialize(2.0),'Decimal(18,0)')], [cast(materialize(1.0),'Decimal(18,10)')]);

SELECT if(0, [cast(materialize(2.0),'Decimal(38,0)')], [cast(materialize(1.0),'Decimal(38,18)')]);