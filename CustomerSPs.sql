USE C_DB10_2018

/*AddCustomer*/
GO
ALTER PROCEDURE [dbo].[AddCustomer]
	(@CompanyName NVARCHAR(50), @CustomerAddress NVARCHAR(50), 
	@CustomerTelephone NVARCHAR(20), @CustomerZip NVARCHAR(10), @CustomerTown NVARCHAR(50))
AS BEGIN
	INSERT INTO ERP.Customer 
	(CompanyName, CustomerAddress, CustomerTelephone, CustomerZip, CustomerTown)
		VALUES 
	(@CompanyName, @CustomerAddress, @CustomerTelephone, @CustomerZip, @CustomerTown)
END

/*EditCustomer*/
GO
ALTER PROCEDURE [dbo].[EditCustomer]
	(@CustomerID INT, @CompanyName NVARCHAR(50), @CustomerAddress NVARCHAR(50), 
	@CustomerTelephone NVARCHAR(20), @CustomerZip NVARCHAR(10), @CustomerTown NVARCHAR(50))
AS BEGIN
	UPDATE ERP.Customer 
	SET CompanyName = @CompanyName, CustomerAddress = @CustomerAddress, 
		CustomerTelephone = @CustomerTelephone, CustomerZip = @CustomerZip, CustomerTown = @CustomerTown
	WHERE CustomerID = @CustomerID
END

/*DeleteCustomer*/
GO
ALTER PROCEDURE [dbo].[DeleteCustomer]
	(@CustomerID INT)
AS BEGIN
	DELETE FROM ERP.Customer 
	WHERE CustomerID = @CustomerID
END

/*ShowCustomer*/
GO
ALTER PROCEDURE [dbo].[ShowCustomer]
	(@CustomerID INT)
AS BEGIN
	SELECT CustomerID, CompanyName, CustomerAddress, CustomerTelephone, CustomerZip, CustomerTown
	FROM ERP.Customer
	WHERE CustomerID = @CustomerID
END

/*ShowCustomers*/
GO
ALTER PROCEDURE [dbo].[ShowCustomers]
AS BEGIN
	SELECT CustomerID, CompanyName, CustomerAddress, CustomerTelephone, CustomerZip, CustomerTown
	FROM ERP.Customer
END

/*ShowSpecificCustomers*/
GO
ALTER PROCEDURE [dbo].[ShowSpecificCustomers]
(@CustomerID INT = NULL, @CompanyName NVARCHAR(50) = NULL, 
@CustomerAddress NVARCHAR(50) = NULL, @CustomerTelephone NVARCHAR(20) = NULL, @CustomerZip NVARCHAR(10) = NULL, @CustomerTown NVARCHAR(10) = NULL)
AS BEGIN
	SELECT CustomerID, CompanyName,
			CustomerAddress, CustomerTelephone, CustomerZip, CustomerTown
	FROM ERP.Customer
	WHERE (CompanyName LIKE @CompanyName+'%' OR @CompanyName IS NULL) AND 
			(CustomerAddress LIKE @CustomerAddress+'%' OR @CustomerAddress IS NULL) AND 
			(CustomerTelephone LIKE @CustomerTelephone+'%' OR @CustomerTelephone IS NULL) AND 
			(CustomerZip LIKE @CustomerZip+'%' OR @CustomerZip IS NULL) AND 
			(CustomerTown LIKE @CustomerTown+'%' OR @CustomerTown IS NULL)
END