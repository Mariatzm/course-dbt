{% test is_greater_than_zero(model, column_name) %}

with validation as (

    select
        {{ column_name }} as column_to_be_checked
    from {{ model }}

),

validation_errors as (

    select
        column_to_be_checked

    from validation
    -- if this is true, then even_field is actually less than 1 !
    where column_to_be_checked < 1 

)

select *
from validation_errors

{% endtest %}