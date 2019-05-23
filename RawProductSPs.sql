USE C_DB10_2018

/*AddRawProduct*/
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[AddRawProduct]
	(@RawProductName NVARCHAR(50), @RawProductWeight FLOAT, @DateOfPurchase DateTime2)
AS BEGIN
	INSERT INTO ERP.RawProduct 
	(RawProductName, RawProductWeight, DateOfPurchase)
		VALUES 
	(@RawProductName, @RawProductWeight, @DateOfPurchase)
END

/*EditRawProduct*/
GO
ALTER PROCEDURE [dbo].[EditRawProduct]
	(@RawProductID INT, @RawProductName NVARCHAR(50), @RawProductWeight FLOAT, @DateOfPurchase DateTime2)
AS BEGIN
	UPDATE ERP.RawProduct 
	SET RawProductName = @RawProductName, RawProductWeight = @RawProductWeight, DateOfPurchase = @DateOfPurchase
	WHERE RawProductID = @RawProductID
END

/*DeleteRawProduct*/
GO
ALTER PROCEDURE [dbo].[DeleteRawProduct]
	(@RawProductID INT)
AS BEGIN
	DELETE FROM ERP.RawProduct
	WHERE RawProductID = @RawProductID
END

/*ShowRawProduct*/
GO
ALTER PROCEDURE [dbo].[ShowRawProduct]
	(@RawProductID INT)
AS BEGIN
	SELECT RawProductID, RawProductName, RawProductWeight, DateOfPurchase
	FROM ERP.RawProduct 
	WHERE RawProductID = @RawProductID
END

/*ShowRawProducts*/
GO
ALTER PROCEDURE [dbo].[ShowRawProducts]
AS BEGIN
	SELECT RawProductID, RawProductName, RawProductWeight, DateOfPurchase
	FROM ERP.RawProduct
END

/*ShowSpecificRawProduct*/
GO
ALTER PROCEDURE [dbo].[ShowSpecificRawProducts]
(@RawProductName NVARCHAR(50) = NULL, @RawProductWeight FLOAT = 0, @DateOfPurchase DateTime2 = '01-01-0001 00:00:00')
AS BEGIN
	SELECT RawProductID, RawProductName, RawProductWeight, DateOfPurchase
	FROM ERP.RawProduct
	WHERE (RawProductName LIKE @RawProductName+'%' OR @RawProductName IS NULL) AND 
			(RawProductWeight = @RawProductWeight OR @RawProductWeight = 0) AND 
			(DateOfPurchase = @DateOfPurchase OR @DateOfPurchase = '01-01-1973 12:00:00')
END