USE C_DB10_2018

/*AddProduct*/
GO
ALTER PROCEDURE [dbo].[AddProduct]
	(@ProductName NVARCHAR(50), @ProductWeight FLOAT, @ProductPrice FLOAT, 
	@ProductAmount FLOAT, @DateOfPackaging DateTime2, @DateOfExpiration DateTime2)
AS BEGIN
	INSERT INTO ERP.Product 
	(ProductName, ProductWeight, ProductPrice, ProductAmount, DateOfPackaging, DateOfExpiration)
		VALUES 
	(@ProductName, @ProductWeight, @ProductPrice, @ProductAmount, @DateOfPackaging, @DateOfExpiration)
END

/*EditProduct*/
GO
ALTER PROCEDURE [dbo].[EditProduct]
	(@ProductID INT, @ProductName NVARCHAR(50), @ProductWeight FLOAT, @ProductPrice FLOAT, 
	@ProductAmount FLOAT, @DateOfPackaging DateTime2, @DateOfExpiration DateTime2)
AS BEGIN
	UPDATE ERP.Product 
	SET ProductName = @ProductName, ProductWeight = @ProductWeight, ProductPrice = @ProductPrice, 
	ProductAmount = @ProductAmount, DateOfPackaging = @DateOfPackaging, DateOfExpiration = @DateOfExpiration
	WHERE ProductID = @ProductID
END

/*DeleteProduct*/
GO
ALTER PROCEDURE [dbo].[DeleteProduct]
	(@ProductID INT)
AS BEGIN
	DELETE FROM ERP.Product
	WHERE ProductID = @ProductID
END

/*ShowProduct*/
GO
ALTER PROCEDURE [dbo].[ShowProduct]
	(@ProductID INT)
AS BEGIN
	SELECT ProductID, ProductName, ProductWeight, ProductPrice, ProductAmount, DateOfPackaging, DateOfExpiration
	FROM ERP.Product 
	WHERE ProductID = @ProductID
END

/*ShowProducts*/
GO
ALTER PROCEDURE [dbo].[ShowProducts]
AS BEGIN
	SELECT ProductID, ProductName, ProductWeight, ProductPrice, ProductAmount, DateOfPackaging, DateOfExpiration
	FROM ERP.Product
END

/*ShowSpecificProducts*/
GO
ALTER PROCEDURE [dbo].[ShowSpecificProducts]
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