{% snapshot DIM_ACCOUNTS %}


{{
    config(
        target_schema='Data_Mart',
        unique_key='ID',
        strategy='timestamp',
        updated_at='LASTMODIFIEDDATE'
        )
        
}}


select * from {{ref('STG_ACCOUNTS')}}


{% endsnapshot %}