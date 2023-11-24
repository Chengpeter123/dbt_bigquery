{% snapshot DIM_ACCOUNTS %}


{{
    config(
        target_database='skilful-gantry-404609',
        target_schema='Data_Mart',
        unique_key='ID',
        strategy='timestamp',
        updated_at='LASTMODIFIEDDATE',
        post_hook="Update skilful-gantry-404609.Landing.INFOFISCUS_CT CT SET LAST_RUN_DATE = CURRENT_TIMESTAMP() WHERE
        SRC_OBJECT =  'ACCOUNTS' AND TGT_OBJECT = 'STG_ACCOUNTS' ;"
        )
        
}}


select * from {{ref('STG_ACCOUNTS')}}


{% endsnapshot %}