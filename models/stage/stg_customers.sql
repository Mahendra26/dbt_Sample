with source as (

    select * from {{ref('raw_customers')}}
),

renamed as (

    select
        id as customer_id,
        initials,
        first_name,
        last_name,
        email,
        gender,
        mobile

    from source

)

select * from renamed