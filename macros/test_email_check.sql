{% macro test_email_check(stg_customers, email) %}
with validation as (
    select
        email as email_field
    from stg_customers
validation_errors as (
    select
        email_field
    from validation
    -- if this is true, then date_field is actually not in the desired format!
    where email_field NOT like '%@%' and email_field is NOT null
)
select count(*)
from validation_errors
{% endmacro %}