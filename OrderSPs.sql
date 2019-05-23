USE C_DB10_2018

/*AddOrder*/
GO
ALTER PROCEDURE [dbo].[AddOrder]
 (@CustomerID INT, @DateOfPurchase DateTime2, @TotalPrice FLOAT, @Active BIT)
AS BEGIN
 INSERT INTO ERP.[ORDER]
(CustomerID, DateOfPurchase, TotalPrice, Active) 
VALUES
(@CustomerID, @DateOfPurchase, @TotalPrice, @Active)
END

/*EditOrder*/
GO
ALTER PROCEDURE [dbo].[EditOrder]
    (@OrderID INT, @CustomerID INT, @DateOfPurchase DateTime2, @TotalPrice FLOAT, @Active BIT)
AS BEGIN
    UPDATE ERP.[Order]
    SET CustomerID = @CustomerID, DateOfPurchase = @DateOfPurchase, TotalPrice = @TotalPrice, Active = @Active
    WHERE OrderID = @OrderID
END

/*DeleteOrder*/
GO
ALTER PROCEDURE [dbo].[DeleteOrder]
    (@OrderID INT)
AS BEGIN 
    DELETE FROM ERP.[ORDER]
    WHERE OrderID = @OrderID

END

/*ShowOrder*/
GO
ALTER PROCEDURE [dbo].[ShowOrder]
	(@OrderID INT)
AS BEGIN
	SELECT OrderID, CustomerID, DateOfPurchase, TotalPrice, Active
	FROM ERP.[Order] 
	WHERE OrderID = @OrderID
END

/*ShowOrders*/
GO
ALTER PROCEDURE [dbo].[ShowOrders]
AS BEGIN
	SELECT OrderID, CustomerID, DateOfPurchase, TotalPrice, Active
	FROM ERP.[Order]
END

/*ShowSpecificOrders*/
GO
ALTER PROCEDURE [dbo].[ShowSpecificOrders]
(@OrderID INT = 0, @CustomerID INT = 0, @DateOfPurchase DateTime2 = '01-01-1973 12:00:00', @TotalPrice FLOAT = 0, @Active BIT = 0)
AS BEGIN
	SELECT OrderID, CustomerID, DateOfPurchase, TotalPrice, Active
	FROM ERP.[Order]
	WHERE (OrderID = @OrderID OR @OrderID = 0) AND 
			(CustomerID = @CustomerID OR @CustomerID = 0) AND 
			(DateOfPurchase = @DateOfPurchase OR @DateOfPurchase = '01-01-1973 12:00:00') AND 
			(TotalPrice = @TotalPrice OR @TotalPrice = 0) AND
			(Active = @Active OR @Active = 0)
END

/*GetLastOrderID*/
GO
ALTER PROCEDURE [dbo].[GetLastOrderID]
AS BEGIN
	SELECT IDENT_CURRENT('ERP.Order')
END

/*GetNextOrderID*/
GO
ALTER PROCEDURE [dbo].[GetNextOrderID]
AS BEGIN
	SELECT IDENT_CURRENT('ERP.Order')
END

/*ShowNonActiveOrders*/
GO
ALTER PROCEDURE [dbo].[ShowNonActiveOrders]
	(@Active bit)
AS BEGIN
	SELECT OrderID, CustomerID, DateOfPurchase, TotalPrice, Active
	FROM ERP.[Order] 
	WHERE Active = @Active
END