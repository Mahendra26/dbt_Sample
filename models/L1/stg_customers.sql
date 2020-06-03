with source as (

    select * from {{ source('dbt_Sample', 'raw_customers') }}

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