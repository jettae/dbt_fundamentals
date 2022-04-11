-- the better way from the exemplar 

select
    id as payment_id,
    orderid as order_id,
    paymentmethod as payment_method,
    status,

    -- amount is stored in cents, convert it to dollars
    amount / 100 as amount,
    created as created_at

from {{ source('stripe', 'payment') }}

-- my goopy first attempt

-- with payments as (
    
--     select 
--         id as payment_id
--         ,orderid as order_id
--         ,amount / 100 as amount -- convert from cents to dollars

--     from raw.stripe.payment

--     where status = 'success' -- only include successful payments
-- )

-- select * from payments