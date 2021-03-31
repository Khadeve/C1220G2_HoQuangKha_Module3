CREATE VIEW customer_views AS
    SELECT 
        customer_number, customer_name, phone
    FROM
        customers;
    
SELECT 
    *
FROM
    customer_views;

CREATE OR REPLACE VIEW customer_views AS
    SELECT 
        customer_number,
        customer_name,
        contact_last_name,
        contact_first_name
    FROM
        customers
    WHERE
        city = 'Nantes';

drop view customer_views;
