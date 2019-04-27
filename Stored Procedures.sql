/*
Stored Procedures PROCESS
*/

GO
CREATE PROCEDURE BeansProcessed
	(@Name NVARCHAR(50), @Weight FLOAT, @DateOfProcess DateTime2, @Loss FLOAT)
AS BEGIN
	INSERT INTO ERP.Process 
	([Name], [Weight], [DateOfProcess], [Loss]) 
		VALUES 
	(@Name, @Weight, @DateOfProcess, @Loss)
END


/*
Stored Procedures CUSTOMER
*/


GO
CREATE PROCEDURE AddCustomer
	(@CompanyName NVARCHAR(50), @ProductOwner NVARCHAR(50), @Address NVARCHAR(50), 
	@Zip NVARCHAR(10), @Town NVARCHAR(50), @Telephone NVARCHAR(20))
AS BEGIN
	INSERT INTO ERP.Customer 
	([CompanyName], [ProductOwner], [Address], [Zip], [Town], [Telephone])
		VALUES 
	(@CompanyName, @ProductOwner, @Address, @Zip, @Town, @Telephone)
END

GO
CREATE PROCEDURE EditCustomer
	(@ID INT, @CompanyName NVARCHAR(50), @ProductOwner NVARCHAR(50), @Address NVARCHAR(50), 
	@Zip NVARCHAR(10), @Town NVARCHAR(50), @Telephone NVARCHAR(20))
AS BEGIN
	UPDATE ERP.Customer 
	SET [CompanyName] = @CompanyName, [ProductOwner] = @ProductOwner, [Address] = @Address, 
		[Zip] = @Zip, [Town] = @Town, [Telephone] = @Telephone 
	WHERE [ID] = @ID
END

GO
CREATE PROCEDURE DeleteCustomer
	(@ID INT)
AS BEGIN
	DELETE FROM ERP.Customer 
	WHERE ID = @ID
END


/*
Stored Procedures RAWPRODUCT
*/


GO
CREATE PROCEDURE AddRawProduct
	(@Name NVARCHAR(50), @Weight FLOAT, @DateOfPurchase DateTime2)
AS BEGIN
	INSERT INTO ERP.RawProduct 
	([Name], [Weight], [DateOfPurchase])
		VALUES 
	(@Name, @Weight, @DateOfPurchase)
END

GO
CREATE PROCEDURE EditRawProduct
	(@ID INT, @Name NVARCHAR(50), @Weight FLOAT, @DateOfPurchase DateTime2)
AS BEGIN
	UPDATE ERP.RawProduct 
	SET [Name] = @Name, [Weight] = @Weight, [DateOfPurchase] = @DateOfPurchase
	WHERE [ID] = @ID
END

GO
CREATE PROCEDURE DeleteRawProduct
	(@ID INT)
AS BEGIN
	DELETE FROM ERP.RawProduct
	WHERE ID = @ID
END


/*
Stored Procedures PRODUCT
*/


GO
CREATE PROCEDURE AddProduct
	(@Name NVARCHAR(50), @Weight FLOAT, @Price FLOAT, @Amount FLOAT, @DateOfPackaging DateTime2, @DateOfExpiration DateTime2)
AS BEGIN
	INSERT INTO ERP.Product 
	([Name], [Weight], [Price], [Amount], [DateOfPackaging], [DateOfExpiration])
		VALUES 
	(@Name, @Weight, @Price, @Amount, @DateOfPackaging, @DateOfExpiration)
END

GO
CREATE PROCEDURE EditProduct
	(@ID INT, @Name NVARCHAR(50), @Weight FLOAT, @Price FLOAT, @Amount FLOAT, 
	@DateOfPackaging DateTime2, @DateOfExpiration DateTime2)
AS BEGIN
	UPDATE ERP.Product 
	SET [Name] = @Name, [Weight] = @Weight, [Price] = @Price, [Amount] = @Amount, 
	[DateOfPackaging] = @DateOfPackaging, [DateOfExpiration] = @DateOfExpiration
	WHERE [ID] = @ID
END

GO
CREATE PROCEDURE DeleteProduct
	(@ID INT)
AS BEGIN
	DELETE FROM ERP.Product
	WHERE ID = @ID
END
