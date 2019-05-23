USE C_DB10_2018

/*AddOrderline*/
GO
ALTER PROCEDURE [dbo].[AddOrderlines]
    (@OrderID INT, @ProductID INT, @Amount FLOAT)

AS BEGIN 
    INSERT INTO ERP.[Orderline]
    (OrderID, ProductID, Amount)
        VALUES
    (@OrderID, @ProductID, @Amount)
END

/*EditOrderline*/
GO
ALTER PROCEDURE [dbo].[EditOrderline]
    (@OrderlineID INT, @OrderID INT, @ProductID INT, @Amount FLOAT)
AS BEGIN
    UPDATE ERP.[Orderline]
    SET OrderID = @OrderID, ProductID = @ProductID, Amount = @Amount
    WHERE OrderlineID = @OrderlineID
END

/*DeleteOrderline*/
GO
ALTER PROCEDURE [dbo].[DeleteOrderline]
    (@OrderlineID INT)
AS BEGIN 
    DELETE FROM ERP.[Orderline]
    WHERE OrderlineID = @OrderlineID

END

/*ShowOrderline*/
GO
ALTER PROCEDURE [dbo].[ShowOrderLines]
	(@OrderID INT)
AS BEGIN
	SELECT OrderlineID, OrderID, ProductID, Amount
	FROM ERP.OrderLine 
	WHERE (OrderID = @OrderID OR @OrderID = 0)
END

