with source as (
    
    select * from {{ref ('raw_payments') }}

),

renamed as (

    select
        id as payment_id,
        order_id,
        payment_method,
        amount,
        tax_amount,
        card_type

    from source

)

select * from renamed