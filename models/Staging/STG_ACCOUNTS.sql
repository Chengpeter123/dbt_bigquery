{{ 
        config(
        materialized="table",
        enabled=true,
        schema = 'Staging'
    
        ) 
}}

    select * from {{ref('VW_ACCOUNTS')}}