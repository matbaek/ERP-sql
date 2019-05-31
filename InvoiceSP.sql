USE C_DB10_2018;

/* AddInvoice */
GO
CREATE PROCEDURE AddInvoice
	(@OrderID INT, @DateOfDelivery DateTime2, @FormOfDelivery VARCHAR(100), @FormOfPayment VARCHAR(100), @CreditNota bit, @Send bit)
AS BEGIN
	INSERT INTO ERP.Invoice 
	(OrderID, DateOfDelivery, FormOfDelivery, FormOfPayment, CreditNota, [Send])
		VALUES 
	(@OrderID, @DateOfDelivery, @FormOfDelivery, @FormOfPayment, @CreditNota, @Send)
END

/* EditInvoice */
GO
CREATE PROCEDURE EditInvoice
    (@InvoiceID INT, @OrderID INT, @DateOfDelivery DateTime2, @FormOfDelivery VARCHAR(100), @FormOfPayment VARCHAR(100), @CreditNota BIT, @Send BIT)
AS BEGIN
    UPDATE ERP.Invoice
    SET OrderID = @OrderID, DateOfDelivery = @DateOfDelivery, FormOfDelivery = @FormOfDelivery, FormOfPayment = @FormOfPayment, CreditNota = @CreditNota, [Send] = @Send
    WHERE InvoiceID = @InvoiceID
END

/* ShowInvoices */
GO
CREATE PROCEDURE ShowInvoices
AS BEGIN
	SELECT InvoiceID, OrderID, DateOfDelivery, FormOfDelivery, FormOfPayment, CreditNota, [Send]
	FROM ERP.Invoice
END

/* ShowInvoice */
GO
CREATE PROCEDURE ShowInvoice
	(@InvoiceID INT)
AS BEGIN
	SELECT InvoiceID, OrderID, DateOfDelivery, FormOfDelivery, FormOfPayment, CreditNota, [Send]
	FROM ERP.Invoice
	WHERE InvoiceID = @InvoiceID
END

/* ShowInvoiceFromOrder */
GO
CREATE PROCEDURE ShowInvoiceFromOrder
 (@OrderID INT)
AS BEGIN
 SELECT InvoiceID, OrderID, DateOfDelivery, FormOfDelivery, FormOfPayment, CreditNota, [Send]
	FROM ERP.Invoice
	WHERE OrderID = @OrderID
END