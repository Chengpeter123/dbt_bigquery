{{ 
        config(
        materialized="table",
        enabled=true
    
        ) 
}}

    select * from {{ref('VW_ACCOUNTS')}}