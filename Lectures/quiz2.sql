-- Database Quiz 2

-- q1
SELECT vendor_name, invoice_number
FROM invoices
        LEFT JOIN vendors
               ON invoices.vendor_id = vendors.vendor_id;

select invoice_number FROM invoices;

-- q2
SELECT vendor_name, invoice_number
FROM invoices
    RIGHT JOIN vendors
         ON invoices.vendor_id = vendors.vendor_id;
         
select * from vendors;
select * from invoices;
