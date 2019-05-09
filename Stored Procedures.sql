/*
Stored Procedures Production_Batch
*/

/* BeansProcessed */
GO
CREATE PROCEDURE BeansProcessed
	(@RawProductID INT, @ProcessName NVARCHAR(50), @ProcessWeight FLOAT, @ProcessLoss FLOAT, @DateOfProcess DateTime2)
AS BEGIN
	INSERT INTO ERP.Process 
	(RawProductID, ProcessName, ProcessWeight, ProcessLoss, DateOfProcess) 
		VALUES 
	(@ProcessName, @ProcessWeight, @ProcessLoss, @DateOfProcess)
END


/*
Stored Procedures CUSTOMER
*/

/* AddCustomer */
GO
CREATE PROCEDURE AddCustomer
	(@CompanyName NVARCHAR(50), @ContactPerson NVARCHAR(50), @CustomerAddress NVARCHAR(50), 
	@CustomerTelephone NVARCHAR(20), @CustomerZip NVARCHAR(10), @CustomerTown NVARCHAR(50))
AS BEGIN
	INSERT INTO ERP.Customer 
	(CompanyName, ContactPerson, CustomerAddress, CustomerTelephone, CustomerZip, CustomerTown)
		VALUES 
	(@CompanyName, @ContactPerson, @CustomerAddress, @CustomerTelephone, @CustomerZip, @CustomerTown)
END

/* EditCustomer */
GO
CREATE PROCEDURE EditCustomer
	(@CustomerID INT, @CompanyName NVARCHAR(50), @ContactPerson NVARCHAR(50), @CustomerAddress NVARCHAR(50), 
	@CustomerTelephone NVARCHAR(20), @CustomerZip NVARCHAR(10), @CustomerTown NVARCHAR(50))
AS BEGIN
	UPDATE ERP.Customer 
	SET CompanyName = @CompanyName, ContactPerson = @ContactPerson, CustomerAddress = @CustomerAddress, 
		CustomerTelephone = @CustomerTelephone, CustomerZip = @CustomerZip, CustomerTown = @CustomerTown
	WHERE CustomerID = @CustomerID
END

/* DeleteCustomer */
GO
CREATE PROCEDURE DeleteCustomer
	(@CustomerID INT)
AS BEGIN
	DELETE FROM ERP.Customer 
	WHERE CustomerID = @CustomerID
END

/* ShowCustomers */
GO
CREATE PROCEDURE ShowCustomers
AS BEGIN
	SELECT CustomerID, CompanyName, ContactPerson, CustomerAddress, CustomerTelephone, CustomerZip, CustomerTown
	FROM ERP.Customer
END

/* ShowSpecificCustomers */
GO
CREATE PROCEDURE ShowSpecificCustomers
(@CustomerID INT = NULL, @CompanyName NVARCHAR(50) = NULL, @ContactPerson NVARCHAR(50) = NULL, 
@CustomerAddress NVARCHAR(50) = NULL, @CustomerTelephone NVARCHAR(20) = NULL, @CustomerZip NVARCHAR(10) = NULL, @CustomerTown NVARCHAR(10) = NULL)
AS BEGIN
	SELECT CustomerID, CompanyName, ContactPerson, 
			CustomerAddress, CustomerTelephone, CustomerZip, CustomerTown
	FROM ERP.Customer
	WHERE (CompanyName LIKE @CompanyName+'%' OR @CompanyName IS NULL) AND 
			(ContactPerson LIKE @ContactPerson+'%' OR @ContactPerson IS NULL) AND 
			(CustomerAddress LIKE @CustomerAddress+'%' OR @CustomerAddress IS NULL) AND 
			(CustomerTelephone LIKE @CustomerTelephone+'%' OR @CustomerTelephone IS NULL) AND 
			(CustomerZip LIKE @CustomerZip+'%' OR @CustomerZip IS NULL) AND 
			(CustomerTown LIKE @CustomerTown+'%' OR @CustomerTown IS NULL)
END

/* ShowCustomer */
GO
CREATE PROCEDURE ShowCustomer
	(@CustomerID INT)
AS BEGIN
	SELECT CustomerID, CompanyName, ContactPerson, 
			CustomerAddress, CustomerTelephone, CustomerZip, CustomerTown
	FROM ERP.Customer
	WHERE CustomerID = @CustomerID
END


/*
Stored Procedures RAWPRODUCT
*/


/* AddRawProduct */
GO
CREATE PROCEDURE AddRawProduct
	(@RawProductName NVARCHAR(50), @RawProductWeight FLOAT, @DateOfPurchase DateTime2)
AS BEGIN
	INSERT INTO ERP.RawProduct 
	(RawProductName, RawProductWeight, DateOfPurchase)
		VALUES 
	(@RawProductName, @RawProductWeight, @DateOfPurchase)
END

/* EditRawProduct */
GO
CREATE PROCEDURE EditRawProduct
	(@RawProductID INT, @RawProductName NVARCHAR(50), @RawProductWeight FLOAT, @DateOfPurchase DateTime2)
AS BEGIN
	UPDATE ERP.RawProduct 
	SET RawProductName = @RawProductName, RawProductWeight = @RawProductWeight, DateOfPurchase = @DateOfPurchase
	WHERE RawProductID = @RawProductID
END

/* DeleteRawProduct */
GO
CREATE PROCEDURE DeleteRawProduct
	(@RawProductID INT)
AS BEGIN
	DELETE FROM ERP.RawProduct
	WHERE RawProductID = @RawProductID
END

/* ShowRawProducts */
GO
CREATE PROCEDURE ShowRawProducts
AS BEGIN
	SELECT RawProductID, RawProductName, RawProductWeight, DateOfPurchase
	FROM ERP.RawProduct
END

/* ShowSpecificRawProducts */
GO
CREATE PROCEDURE ShowSpecificRawProducts
(@RawProductName NVARCHAR(50) = NULL, @RawProductWeight FLOAT = 0, @DateOfPurchase DateTime2 = '01-01-1973 12:00:00')
AS BEGIN
	SELECT RawProductID, RawProductName, RawProductWeight, DateOfPurchase
	FROM ERP.RawProduct
	WHERE (RawProductName LIKE @RawProductName+'%' OR @RawProductName IS NULL) AND 
			(RawProductWeight = @RawProductWeight OR @RawProductWeight = 0) AND 
			(DateOfPurchase = @DateOfPurchase OR @DateOfPurchase = '01-01-1973 12:00:00')
END

/* ShowRawProduct */
GO
CREATE PROCEDURE ShowRawProduct
	(@RawProductID INT)
AS BEGIN
	SELECT RawProductID, RawProductName, RawProductWeight, DateOfPurchase
	FROM ERP.RawProduct 
	WHERE RawProductID = @RawProductID
END

/*
Stored Procedures PRODUCT
*/


/* AddProduct */
GO
CREATE PROCEDURE AddProduct
	(@ProductName NVARCHAR(50), @ProductWeight FLOAT, @ProductPrice FLOAT, 
	@ProductAmount FLOAT, @DateOfPackaging DateTime2, @DateOfExpiration DateTime2)
AS BEGIN
	INSERT INTO ERP.Product 
	(ProductName, ProductWeight, ProductPrice, ProductAmount, DateOfPackaging, DateOfExpiration)
		VALUES 
	(@ProductName, @ProductWeight, @ProductPrice, @ProductAmount, @DateOfPackaging, @DateOfExpiration)
END

/* EditProduct */
GO
CREATE PROCEDURE EditProduct
	(@ProductID INT, @ProductName NVARCHAR(50), @ProductWeight FLOAT, @ProductPrice FLOAT, 
	@ProductAmount FLOAT, @DateOfPackaging DateTime2, @DateOfExpiration DateTime2)
AS BEGIN
	UPDATE ERP.Product 
	SET ProductName = @ProductName, ProductWeight = @ProductWeight, ProductPrice = @ProductPrice, 
	ProductAmount = @ProductAmount, DateOfPackaging = @DateOfPackaging, DateOfExpiration = @DateOfExpiration
	WHERE ProductID = @ProductID
END

/* DeleteProduct */
GO
CREATE PROCEDURE DeleteProduct
	(@ProductID INT)
AS BEGIN
	DELETE FROM ERP.Product
	WHERE ProductID = @ProductID
END

/* ShowProducts */
GO
CREATE PROCEDURE ShowProducts
AS BEGIN
	SELECT ProductID, ProductName, ProductWeight, ProductPrice, ProductAmount, DateOfPackaging, DateOfExpiration
	FROM ERP.Product
END

/* ShowSpecificRawProducts */
GO
CREATE PROCEDURE ShowSpecificProducts
(@ProductName NVARCHAR(50) = NULL, @ProductWeight FLOAT = 0, @ProductPrice FLOAT = 0, 
	@ProductAmount FLOAT = 0, @DateOfPackaging DateTime2 = '01-01-1973 12:00:00', @DateOfExpiration DateTime2 = '01-01-1973 12:00:00')
AS BEGIN
	SELECT ProductID, ProductName, ProductWeight, ProductPrice, ProductAmount, DateOfPackaging, DateOfExpiration
	FROM ERP.Product
	WHERE (ProductName LIKE @ProductName+'%' OR @ProductName IS NULL) AND 
			(ProductWeight = @ProductWeight OR @ProductWeight = 0) AND 
			(ProductPrice = @ProductPrice OR @ProductPrice = 0) AND 
			(ProductAmount = @ProductAmount OR @ProductAmount = 0) AND 
			(DateOfPackaging = @DateOfPackaging OR @DateOfPackaging = '01-01-1973 12:00:00') AND 
			(DateOfExpiration = @DateOfExpiration OR @DateOfExpiration = '01-01-1973 12:00:00')
END

/* ShowProduct */
GO
CREATE PROCEDURE ShowProduct
	(@ProductID INT)
AS BEGIN
	SELECT ProductName, ProductWeight, ProductPrice, ProductAmount, DateOfPackaging, DateOfExpiration
	FROM ERP.Product 
	WHERE ProductID = @ProductID
END

/*
Stored Procedures Order
*/


/* AddOrder */


/* EditOrder */


/* DeleteOrder */


/* ShowOrders */
GO
CREATE PROCEDURE ShowOrders
AS BEGIN
	SELECT OrderID, CustomerID, DateOfPurchase, TotalPrice
	FROM ERP.[Order]
END

/* ShowSpecificOrders */
GO
CREATE PROCEDURE ShowSpecificOrders
(@CustomerID INT = 0, @DateOfPurchase DateTime2 = '01-01-1973 12:00:00', @TotalPrice FLOAT = 0)
AS BEGIN
	SELECT OrderID, CustomerID, DateOfPurchase, TotalPrice
	FROM ERP.[Order]
	WHERE (CustomerID = @CustomerID OR @CustomerID = 0) AND 
			(DateOfPurchase = @DateOfPurchase OR @DateOfPurchase = '01-01-1973 12:00:00') AND 
			(TotalPrice = @TotalPrice OR @TotalPrice = 0)
END

/* ShowOrder */
GO
CREATE PROCEDURE ShowOrder
	(@CustomerID INT)
AS BEGIN
	SELECT OrderID, CustomerID, DateOfPurchase, TotalPrice
	FROM ERP.[Order] 
	WHERE CustomerID = @CustomerID
END