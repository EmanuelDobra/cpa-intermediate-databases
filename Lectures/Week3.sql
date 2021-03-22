SELECT invoice_number, vendor_name
FROM  vendors
		INNER JOIN invoices -- inner is default, not needed
        ON vendors.vendor_id = invoices.vendor_id
ORDER BY invoice_number;

-- Aliases

SELECT invoice_number, vendor_name, v.vendor_id
FROM vendors v -- cannot use vendors anymore in this statement, must use v
		INNER JOIN invoices i -- must use i now
        ON v.vendor_id = i.vendor_id
ORDER BY invoice_number;


