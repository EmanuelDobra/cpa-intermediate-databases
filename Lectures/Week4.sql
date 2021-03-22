-- Feb 25

SELECT *FROM terms;
SELECT * FROM invoices;

SELECT vendor_name, invoice_number, invoice_due_date, terms_description
FROM vendors v
	join invoices i
	on v.vendor_id = i.vendor_id
    join terms t
    on i.terms_id = t.terms_id
    order by invoice_number desc;
    
select memberFName, programType, memberContactLName
from program p
	join members m
	on p.programID = m.programID
    join membercontact mc
    on m.memberID = mc.memberID;
    