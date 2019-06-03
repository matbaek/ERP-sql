USE C_DB10_2018;

DROP TABLE ERP.Production_Batch
DROP TABLE ERP.RawProduct
DROP TABLE ERP.Product
DROP TABLE ERP.CustomerZip
DROP TABLE ERP.Customer

CREATE TABLE ERP.RawProduct(
	RawProductID INT IDENTITY(1,1), 
	RawProductName NVARCHAR(50) NOT NULL, 
	RawProductWeight FLOAT NOT NULL, 
	DateOfPurchase DateTime2 NOT NULL,
	CONSTRAINT RawProduct_ID PRIMARY KEY (RawProductID)
)

CREATE TABLE ERP.Product(
	ProductID INT IDENTITY(1,1),
	ProductName NVARCHAR(50) NOT NULL,
	ProductWeight FLOAT NOT NULL,
	ProductPrice FLOAT NOT NULL,
	ProductAmount FLOAT NOT NULL,
	DateOfPackaging DateTime2 NOT NULL,
	DateOfExpiration DateTime2 NOT NULL,
	CONSTRAINT Product_ID PRIMARY KEY (ProductID)
)

CREATE TABLE ERP.Production_Batch(
	ProcessID INT IDENTITY(1,1),
	RawProductID INT NOT NULL, 
	ProcessName NVARCHAR(50) NOT NULL,
	ProcessWeight FLOAT NOT NULL,
	ProcessLoss FLOAT NOT NULL,
	DateOfProcess DateTime2 NOT NULL,
	CONSTRAINT ProcessID_PK PRIMARY KEY (ProcessID),
	CONSTRAINT RawProductID_FK FOREIGN KEY (RawProductID) REFERENCES ERP.RawProduct(RawProductID)
)

CREATE TABLE ERP.Customer(
	CustomerID INT IDENTITY(1,1),
	CompanyName NVARCHAR(50) NOT NULL,
	CustomerAddress NVARCHAR(50) NOT NULL,
	CustomerTelephone NVARCHAR(20) NOT NULL,
	CustomerZip NVARCHAR(10) NOT NULL,
	CustomerTown NVARCHAR(50) NOT NULL,
	Email NVARCHAR(200) NOT NULL,
	CONSTRAINT CustomerID PRIMARY KEY (CustomerID)
)
