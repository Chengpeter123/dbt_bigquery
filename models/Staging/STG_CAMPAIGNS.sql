{{ 
        config(
        materialized="table",
        enabled=true,
        schema = 'Staging',
        post_hook="Update {{ env_var('DBT_GCP_PROJECT') }}.Landing.INFOFISCUS_CT CT SET LAST_RUN_DATE = CURRENT_TIMESTAMP() WHERE
        SRC_OBJECT =  'CAMPAIGNS' AND TGT_OBJECT = 'STG_CAMPAIGNS' ;"
    
        ) 
}}

    select * from {{ref('VW_CAMPAIGNS')}}