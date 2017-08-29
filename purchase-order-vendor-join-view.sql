-- JOIN VIEWS
select PurchaseOrder.Id, PurchasedDate, Name as 'Vendor'
	from PurchaseOrder
	join Vendor
		on PurchaseOrder.VendorId = Vendor.Id