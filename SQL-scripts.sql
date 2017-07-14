USE B2B
GO
--Getting how much products did a certain company order per month, broken down into subsidiaries
SELECT s.Subsidiary_id,
       sum(od.orderqty) Totalqty
from dbo.orders O 
     JOIN dbo.order_details od ON o.order_id = od.order_id
	JOIN dbo.Subsidiaries s ON o.Subsidiary_id = s.Subsidiary_id
WHERE s.user_id = 1 --value of companyid
GROUP BY s.Subsidiary_id

--Getting total orders paid from all companies coming from a specific end-customer
SELECT u.company_id, o.*
from dbo.orders o 
     JOIN dbo.Subsidiaries s ON o.Subsidiary_id = s.Subsidiary_id
	JOIN dbo.users u ON s.user_id = u.user_id
WHERE o.customer_id = 1 ---value of a customer id

---Insert statemnts for
---Inserting a new company along with defining its subsidiaries
USE [B2B]
GO
INSERT INTO [dbo].[address]
           ([address_type]
           ,[AddressLine1]
           ,[AddressLine2]
           ,[City]
           ,[State]
           ,[Zip]
           ,[created_dt]
           ,[updated_dt])
     VALUES
           ('Business'
           ,'Address Lane 1'
           ,'AddressLine2'
           ,'Los angeles'
           ,'CA'
           ,91207
           ,getdate()
           ,getdate())

INSERT INTO [dbo].[companies]
           ([CUIT]
           ,[company_name]
           ,[Commencement_date]
           ,[website]
           ,[email]
           ,[address_id]
           ,[created_dt]
           ,[updated_dt])
     VALUES
           (100
           ,'Company1'
           ,'01-01-2001'
           ,'www.company1.com'
           ,'contactus@company1.com'
           ,1
           ,getdate()
           ,getdate())

INSERT INTO [dbo].[users]
           ([company_id]
           ,[created_dt]
           ,[updated_dt])
     VALUES
           (1
           ,getdate()
           ,getdate())

INSERT INTO [dbo].[Subsidiaries]
           ([suit]
           ,[user_id]
           ,[FamiliarName]
           ,[address_id]
           ,[created_dt]
           ,[updated_dt])
     VALUES
           (10
           ,1
           ,'subsidiary1'
           ,1
           ,getdate()
           ,getdate())

go	