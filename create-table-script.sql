USE [B2B]
GO

--Address
create table address
(
  address_id  int IDENTITY(1,1) PRIMARY KEY,
  address_type nvarchar(50), 
  AddressLine1 nvarchar(100) NOT NULL,
  AddressLine2 nvarchar(100),
  City         nvarchar(50),
  State        nvarchar(50),
  Zip          nvarchar(50),
  created_dt   datetime,
  updated_dt   datetime,
  CONSTRAINT address_cc_1 CHECK(address_type IN ('HOME', 'OTHER','BUSINESS'))
)
GO
declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'Address table is used to store the address information for all entities in B2B',
   'user', @CurrentUser, 'table', 'address'

execute sp_addextendedproperty 'MS_Description', 
   'System generated Primary key for the Address table',
   'user', @CurrentUser, 'table', 'address', 'column', 'address_id'

execute sp_addextendedproperty 'MS_Description', 
   'Indicates the type of Address Home/Office/Other are possible values',
   'user', @CurrentUser, 'table', 'address', 'column', 'address_type'

execute sp_addextendedproperty 'MS_Description', 
   'Address Lane1 of the Address',
   'user', @CurrentUser, 'table', 'address', 'column', 'AddressLine1'

execute sp_addextendedproperty 'MS_Description', 
   'Address Lane2 of the Address',
   'user', @CurrentUser, 'table', 'address', 'column', 'AddressLine2'

execute sp_addextendedproperty 'MS_Description', 
   'city of the Address',
   'user', @CurrentUser, 'table', 'address', 'column', 'City'

execute sp_addextendedproperty 'MS_Description', 
   'state of the Address',
   'user', @CurrentUser, 'table', 'address', 'column', 'State'

execute sp_addextendedproperty 'MS_Description', 
   'zip code of the Address',
   'user', @CurrentUser, 'table', 'address', 'column', 'zip'

execute sp_addextendedproperty 'MS_Description', 
   'created_dt used to track when the row is created',
   'user', @CurrentUser, 'table', 'address', 'column', 'created_dt'

execute sp_addextendedproperty 'MS_Description', 
   'updated_dt is used to track when the row is updated',
   'user', @CurrentUser, 'table', 'address', 'column', 'updated_dt'
go

create table phonenumbers
(
  phonenumber_id int IDENTITY(1,1) PRIMARY KEY,
  phoneno      int,
  phone_type   nvarchar(50), -- Landline, mobile, work, fax
  created_dt   datetime,
  updated_dt   datetime,
  CONSTRAINT phonenumbers_cc1 CHECK(phone_type IN ('LandLine','Mobile','Work','Fax'))
)
go 
declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'phonenumbers table is used to store the phone numbers for all entities in B2B',
   'user', @CurrentUser, 'table', 'phonenumbers'

execute sp_addextendedproperty 'MS_Description', 
   'System generated Primary key for the phonenumbers table',
   'user', @CurrentUser, 'table', 'phonenumbers', 'column', 'phonenumber_id'

execute sp_addextendedproperty 'MS_Description', 
   'System generated Primary key for the phonenumbers table',
   'user', @CurrentUser, 'table', 'phonenumbers', 'column', 'phoneno'

execute sp_addextendedproperty 'MS_Description', 
   'System generated Primary key for the phonenumbers table',
   'user', @CurrentUser, 'table', 'phonenumbers', 'column', 'phone_type'

execute sp_addextendedproperty 'MS_Description', 
   'created_dt used to track when the row is created',
   'user', @CurrentUser, 'table', 'phonenumbers', 'column', 'created_dt'

execute sp_addextendedproperty 'MS_Description', 
   'updated_dt is used to track when the row is updated',
   'user', @CurrentUser, 'table', 'phonenumbers', 'column', 'updated_dt'
go

CREATE TABLE customers
( customer_id int IDENTITY(1,1) PRIMARY KEY,
  Doc_No      nvarchar(100) not null,
  customer_name nvarchar(100) NOT NULL,
  DOB          datetime,
  address_id   int FOREIGN KEY REFERENCES Address(address_id),
  email        nvarchar(100),
  created_dt   datetime,
  updated_dt   datetime  
)
GO
declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'customers table to store the customer details of B2B system',
   'user', @CurrentUser, 'table', 'customers'

execute sp_addextendedproperty 'MS_Description', 
   'System generated Primary key for the customers table',
   'user', @CurrentUser, 'table', 'customers', 'column', 'customer_id'

execute sp_addextendedproperty 'MS_Description', 
   'unique idenitfier of the customer',
   'user', @CurrentUser, 'table', 'customers', 'column', 'Doc_No'

execute sp_addextendedproperty 'MS_Description', 
   'customer name of the customer',
   'user', @CurrentUser, 'table', 'customers', 'column', 'customer_name'

execute sp_addextendedproperty 'MS_Description', 
   'DOB of the customer',
   'user', @CurrentUser, 'table', 'customers', 'column', 'DOB'

execute sp_addextendedproperty 'MS_Description', 
   'Address identifier of the customer',
   'user', @CurrentUser, 'table', 'customers', 'column', 'address_id'

execute sp_addextendedproperty 'MS_Description', 
   'email of the customer',
   'user', @CurrentUser, 'table', 'customers', 'column', 'email'

execute sp_addextendedproperty 'MS_Description', 
   'created_dt used to track when the row is created',
   'user', @CurrentUser, 'table', 'customers', 'column', 'created_dt'

execute sp_addextendedproperty 'MS_Description', 
   'updated_dt is used to track when the row is updated',
   'user', @CurrentUser, 'table', 'customers', 'column', 'updated_dt'
go

create table customer_phonenumbers
(
  customer_phonenumber_id int IDENTITY(1,1) PRIMARY KEY,
  customer_id int FOREIGN KEY REFERENCES customers(customer_id),
  phonenumber_id int FOREIGN KEY REFERENCES phonenumbers(phonenumber_id),
  created_dt   datetime,
  updated_dt   datetime
)
GO
declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'customer_phonenumbers table to store the customer details of B2B system',
   'user', @CurrentUser, 'table', 'customer_phonenumbers'
   
execute sp_addextendedproperty 'MS_Description', 
   'System generated Primary key for the customer_phonenumbers table',
   'user', @CurrentUser, 'table', 'customer_phonenumbers', 'column', 'customer_phonenumber_id'

execute sp_addextendedproperty 'MS_Description', 
   'Foreign key reference to the customers table',
   'user', @CurrentUser, 'table', 'customer_phonenumbers', 'column', 'customer_id'

execute sp_addextendedproperty 'MS_Description', 
   'Foreign key reference to the phonenumbers table',
   'user', @CurrentUser, 'table', 'customer_phonenumbers', 'column', 'phonenumber_id'

execute sp_addextendedproperty 'MS_Description', 
   'created_dt used to track when the row is created',
   'user', @CurrentUser, 'table', 'customer_phonenumbers', 'column', 'created_dt'

execute sp_addextendedproperty 'MS_Description', 
   'updated_dt is used to track when the row is updated',
   'user', @CurrentUser, 'table', 'customer_phonenumbers', 'column', 'updated_dt'
go

create table companies
(
 company_id int IDENTITY(1,1) PRIMARY KEY,
 CUIT       int not null,
 company_name nvarchar(100),
 Commencement_date datetime,
 website    nvarchar(500),
 email      nvarchar(100),
 address_id int FOREIGN KEY REFERENCES address(address_id),
 created_dt   datetime,
  updated_dt   datetime
)
go
declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'companies table to store the companies details of B2B system',
   'user', @CurrentUser, 'table', 'companies'
   
execute sp_addextendedproperty 'MS_Description', 
   'System generated Primary key for the companies table',
   'user', @CurrentUser, 'table', 'companies', 'column', 'company_id'

execute sp_addextendedproperty 'MS_Description', 
   'Companies unique identifier',
   'user', @CurrentUser, 'table', 'companies', 'column', 'CUIT'

execute sp_addextendedproperty 'MS_Description', 
   'company name',
   'user', @CurrentUser, 'table', 'companies', 'column', 'company_name'

execute sp_addextendedproperty 'MS_Description', 
   'company operations commencement date',
   'user', @CurrentUser, 'table', 'companies', 'column', 'Commencement_date'

execute sp_addextendedproperty 'MS_Description', 
   'company email address',
   'user', @CurrentUser, 'table', 'companies', 'column', 'email'

execute sp_addextendedproperty 'MS_Description', 
   'company website URL',
   'user', @CurrentUser, 'table', 'companies', 'column', 'website'

execute sp_addextendedproperty 'MS_Description', 
   'Address identifier of the company',
   'user', @CurrentUser, 'table', 'companies', 'column', 'address_id'

execute sp_addextendedproperty 'MS_Description', 
   'created_dt used to track when the row is created',
   'user', @CurrentUser, 'table', 'companies', 'column', 'created_dt'

execute sp_addextendedproperty 'MS_Description', 
   'updated_dt is used to track when the row is updated',
   'user', @CurrentUser, 'table', 'companies', 'column', 'updated_dt'
GO

create table company_phonenumbers
(
 company_phonenumber_id  int IDENTITY(1,1) PRIMARY KEY,
 company_id   int FOREIGN KEY REFERENCES companies(company_id),
 phonenumber_id int FOREIGN KEY REFERENCES dbo.phonenumbers(phonenumber_id),
 created_dt   datetime,
  updated_dt   datetime
)
GO

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'company_phonenumbers table to store the company_phonenumbers of B2B system',
   'user', @CurrentUser, 'table', 'company_phonenumbers'
   
execute sp_addextendedproperty 'MS_Description', 
   'System generated Primary key for the company_phonenumbers table',
   'user', @CurrentUser, 'table', 'company_phonenumbers', 'column', 'company_phonenumber_id'

execute sp_addextendedproperty 'MS_Description', 
   'Foreign key reference to the unique identifier of phonenumbers table',
   'user', @CurrentUser, 'table', 'company_phonenumbers', 'column', 'phonenumber_id'

execute sp_addextendedproperty 'MS_Description', 
   'created_dt used to track when the row is created',
   'user', @CurrentUser, 'table', 'company_phonenumbers', 'column', 'created_dt'

execute sp_addextendedproperty 'MS_Description', 
   'updated_dt is used to track when the row is updated',
   'user', @CurrentUser, 'table', 'company_phonenumbers', 'column', 'updated_dt'
GO

create table products
(
  product_id int IDENTITY(1,1) PRIMARY KEY,
  product_name nvarchar(100),
  created_dt   datetime,
  updated_dt   datetime
)
go
declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'products table to store the products info of B2B system',
   'user', @CurrentUser, 'table', 'products'
   
execute sp_addextendedproperty 'MS_Description', 
   'System generated Primary key for the products table',
   'user', @CurrentUser, 'table', 'products', 'column', 'product_id'

execute sp_addextendedproperty 'MS_Description', 
   'product name',
   'user', @CurrentUser, 'table', 'products', 'column', 'product_name'

execute sp_addextendedproperty 'MS_Description', 
   'created_dt used to track when the row is created',
   'user', @CurrentUser, 'table', 'products', 'column', 'created_dt'

execute sp_addextendedproperty 'MS_Description', 
   'updated_dt is used to track when the row is updated',
   'user', @CurrentUser, 'table', 'products', 'column', 'updated_dt'
GO

create table suppliers
(
  supplier_id int IDENTITY(1,1) PRIMARY KEY,
  company_id  int not NULL FOREIGN KEY REFERENCES dbo.companies(company_id),
  created_dt   datetime,
  updated_dt   datetime
 )
 GO
declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'suppliers table to store the suppliers info of B2B system',
   'user', @CurrentUser, 'table', 'suppliers'
   
execute sp_addextendedproperty 'MS_Description', 
   'System generated Primary key for the suppliers table',
   'user', @CurrentUser, 'table', 'suppliers', 'column', 'supplier_id'

execute sp_addextendedproperty 'MS_Description', 
   'Foreign key reference to that company table',
   'user', @CurrentUser, 'table', 'suppliers', 'column', 'company_id'

execute sp_addextendedproperty 'MS_Description', 
   'created_dt used to track when the row is created',
   'user', @CurrentUser, 'table', 'suppliers', 'column', 'created_dt'

execute sp_addextendedproperty 'MS_Description', 
   'updated_dt is used to track when the row is updated',
   'user', @CurrentUser, 'table', 'suppliers', 'column', 'updated_dt'
GO
 
 create table users
 (
  user_id int IDENTITY(1,1) PRIMARY KEY,
  company_id  int not NULL FOREIGN KEY REFERENCES dbo.companies(company_id),
  created_dt   datetime,
  updated_dt   datetime
 )
 go
 
declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'users table to store the users info of B2B system',
   'user', @CurrentUser, 'table', 'users'
   
execute sp_addextendedproperty 'MS_Description', 
   'System generated Primary key for the users table',
   'user', @CurrentUser, 'table', 'users', 'column', 'user_id'

execute sp_addextendedproperty 'MS_Description', 
   'Foreign key reference to that company table',
   'user', @CurrentUser, 'table', 'users', 'column', 'company_id'

execute sp_addextendedproperty 'MS_Description', 
   'created_dt used to track when the row is created',
   'user', @CurrentUser, 'table', 'users', 'column', 'created_dt'

execute sp_addextendedproperty 'MS_Description', 
   'updated_dt is used to track when the row is updated',
   'user', @CurrentUser, 'table', 'users', 'column', 'updated_dt'
GO

 create table Subsidiaries
 (
   Subsidiary_id  int IDENTITY(1,1) PRIMARY KEY,
   suit           int not null,
   user_id        int not NULL FOREIGN KEY REFERENCES dbo.users(user_id),
   FamiliarName   nvarchar(100),
   address_id     int FOREIGN KEY REFERENCES dbo.address(address_id),
   created_dt   datetime,
   updated_dt   datetime
 )
 go
 declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'Subsidiaries table to store the Subsidiaries info of B2B system',
   'user', @CurrentUser, 'table', 'Subsidiaries'
   
execute sp_addextendedproperty 'MS_Description', 
   'System generated Primary key for the Subsidiaries table',
   'user', @CurrentUser, 'table', 'Subsidiaries', 'column', 'Subsidiary_id'

execute sp_addextendedproperty 'MS_Description', 
   'unique identifier of the subsidiaries table',
   'user', @CurrentUser, 'table', 'Subsidiaries', 'column', 'SUIT'

execute sp_addextendedproperty 'MS_Description', 
   'Foreign key reference to that users table',
   'user', @CurrentUser, 'table', 'Subsidiaries', 'column', 'user_id'

execute sp_addextendedproperty 'MS_Description', 
   'FamiliarName of the subsidiaries',
   'user', @CurrentUser, 'table', 'Subsidiaries', 'column', 'FamiliarName'

execute sp_addextendedproperty 'MS_Description', 
   'Foreign key reference to that address table',
   'user', @CurrentUser, 'table', 'Subsidiaries', 'column', 'address_id'

execute sp_addextendedproperty 'MS_Description', 
   'created_dt used to track when the row is created',
   'user', @CurrentUser, 'table', 'Subsidiaries', 'column', 'created_dt'

execute sp_addextendedproperty 'MS_Description', 
   'updated_dt is used to track when the row is updated',
   'user', @CurrentUser, 'table', 'Subsidiaries', 'column', 'updated_dt'
GO

 create table supplierproductofferings
 (
   supplierproductoffering_id int IDENTITY(1,1) PRIMARY KEY,
   supplier_id int not NULL FOREIGN KEY REFERENCES dbo.suppliers(supplier_id),
   product_id int not NULL FOREIGN KEY REFERENCES dbo.products(product_id),
   default_price int,
   created_dt   datetime,
   updated_dt   datetime
 )
 GO

 declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'supplierproductofferings table to store the supplierproductofferings info of B2B system',
   'user', @CurrentUser, 'table', 'supplierproductofferings'
   
execute sp_addextendedproperty 'MS_Description', 
   'System generated Primary key for the supplierproductofferings table',
   'user', @CurrentUser, 'table', 'supplierproductofferings', 'column', 'supplierproductoffering_id'

execute sp_addextendedproperty 'MS_Description', 
   'Foreign key reference to that suppliers table',
   'user', @CurrentUser, 'table', 'supplierproductofferings', 'column', 'supplier_id'

execute sp_addextendedproperty 'MS_Description', 
   'Foreign key reference to that products table',
   'user', @CurrentUser, 'table', 'supplierproductofferings', 'column', 'product_id'

execute sp_addextendedproperty 'MS_Description', 
   'default_price of the product by seller',
   'user', @CurrentUser, 'table', 'supplierproductofferings', 'column', 'default_price'

execute sp_addextendedproperty 'MS_Description', 
   'created_dt used to track when the row is created',
   'user', @CurrentUser, 'table', 'supplierproductofferings', 'column', 'created_dt'

execute sp_addextendedproperty 'MS_Description', 
   'updated_dt is used to track when the row is updated',
   'user', @CurrentUser, 'table', 'supplierproductofferings', 'column', 'updated_dt'
GO
 
 create table userproductinfo
 (
   userproductinfo_id int IDENTITY(1,1) PRIMARY KEY,
   user_id  int not NULL FOREIGN KEY REFERENCES dbo.users(user_id),
   product_id int not NULL FOREIGN KEY REFERENCES dbo.products(product_id),
   price int,
   created_dt   datetime,
  updated_dt   datetime
 )
 GO
 declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'userproductinfo table to store the userproductinfo info of B2B system',
   'user', @CurrentUser, 'table', 'userproductinfo'
   
execute sp_addextendedproperty 'MS_Description', 
   'System generated Primary key for the userproductinfo table',
   'user', @CurrentUser, 'table', 'userproductinfo', 'column', 'userproductinfo_id'

execute sp_addextendedproperty 'MS_Description', 
   'Foreign key reference to that users table',
   'user', @CurrentUser, 'table', 'userproductinfo', 'column', 'user_id'

execute sp_addextendedproperty 'MS_Description', 
   'Foreign key reference to that products table',
   'user', @CurrentUser, 'table', 'userproductinfo', 'column', 'product_id'

execute sp_addextendedproperty 'MS_Description', 
   'price of the product by user',
   'user', @CurrentUser, 'table', 'userproductinfo', 'column', 'price'

execute sp_addextendedproperty 'MS_Description', 
   'created_dt used to track when the row is created',
   'user', @CurrentUser, 'table', 'userproductinfo', 'column', 'created_dt'

execute sp_addextendedproperty 'MS_Description', 
   'updated_dt is used to track when the row is updated',
   'user', @CurrentUser, 'table', 'userproductinfo', 'column', 'updated_dt'
GO
 
 create table orders
 (
   order_id int IDENTITY(1,1) PRIMARY KEY,
   customer_id  int not NULL FOREIGN KEY REFERENCES dbo.customers(customer_id),
   Subsidiary_id  int not NULL FOREIGN KEY REFERENCES dbo.subsidiaries(Subsidiary_id),
   order_date   datetime,
   created_dt   datetime,
  updated_dt   datetime
 )
 GO

 declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'orders table to store the orders info of B2B system',
   'user', @CurrentUser, 'table', 'orders'
   
execute sp_addextendedproperty 'MS_Description', 
   'System generated Primary key for the orders table',
   'user', @CurrentUser, 'table', 'orders', 'column', 'order_id'

execute sp_addextendedproperty 'MS_Description', 
   'Foreign key reference to that customers table',
   'user', @CurrentUser, 'table', 'orders', 'column', 'customer_id'

execute sp_addextendedproperty 'MS_Description', 
   'Foreign key reference to that Subsidiaries table',
   'user', @CurrentUser, 'table', 'orders', 'column', 'Subsidiary_id'

execute sp_addextendedproperty 'MS_Description', 
   'Order creation date',
   'user', @CurrentUser, 'table', 'orders', 'column', 'order_date'

execute sp_addextendedproperty 'MS_Description', 
   'created_dt used to track when the row is created',
   'user', @CurrentUser, 'table', 'orders', 'column', 'created_dt'

execute sp_addextendedproperty 'MS_Description', 
   'updated_dt is used to track when the row is updated',
   'user', @CurrentUser, 'table', 'orders', 'column', 'updated_dt'
GO
 
 create table order_details
 (
   order_detail_id  int not null,
   order_id int not NULL FOREIGN KEY REFERENCES dbo.orders(order_id),
   product_id int not NULL FOREIGN KEY REFERENCES dbo.products(product_id),
   orderqty   int not null,
   created_dt   datetime,
   updated_dt   datetime
 )
 GO

 declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'order_details table to store the order_details info of B2B system',
   'user', @CurrentUser, 'table', 'order_details'
   
execute sp_addextendedproperty 'MS_Description', 
   'System generated Primary key for the order_details table',
   'user', @CurrentUser, 'table', 'order_details', 'column', 'order_detail_id'

execute sp_addextendedproperty 'MS_Description', 
   'Foreign key reference to that orders table',
   'user', @CurrentUser, 'table', 'order_details', 'column', 'order_id'

execute sp_addextendedproperty 'MS_Description', 
   'Foreign key reference to that products table',
   'user', @CurrentUser, 'table', 'order_details', 'column', 'product_id'

execute sp_addextendedproperty 'MS_Description', 
   'orderqty is the product quantity ordered by customers',
   'user', @CurrentUser, 'table', 'order_details', 'column', 'orderqty'

execute sp_addextendedproperty 'MS_Description', 
   'created_dt used to track when the row is created',
   'user', @CurrentUser, 'table', 'order_details', 'column', 'created_dt'

execute sp_addextendedproperty 'MS_Description', 
   'updated_dt is used to track when the row is updated',
   'user', @CurrentUser, 'table', 'order_details', 'column', 'updated_dt'
GO