{{
   config(
        materialized = 'view'
        
    )
}} 

WITH ACCOUNTS as (
SELECT 
ID,ISDELETED,MASTERRECORDID,NAME,TYPE,NULL AS RECORDTYPEID,PARENTID, null as BILLINGSTREET,
        BILLINGCITY,BILLINGSTATE,BILLINGPOSTALCODE,BILLINGCOUNTRY, NULL AS BILLINGSTATECODE,
        NULL AS BILLINGCOUNTRYCODE,BILLINGLATITUDE,BILLINGLONGITUDE,BILLINGGEOCODEACCURACY,
        null as SHIPPINGSTREET,SHIPPINGCITY,SHIPPINGSTATE,SHIPPINGPOSTALCODE,SHIPPINGCOUNTRY,
        NULL AS SHIPPINGSTATECODE, NULL AS SHIPPINGCOUNTRYCODE,SHIPPINGLATITUDE,SHIPPINGLONGITUDE,
        SHIPPINGGEOCODEACCURACY,PHONE,FAX,WEBSITE,PHOTOURL,SIC,INDUSTRY,ANNUALREVENUE,
        NUMBEROFEMPLOYEES,OWNERSHIP,TICKERSYMBOL,null as DESCRIPTION,SITE,OWNERID,CREATEDDATE,CREATEDBYID,
        LASTMODIFIEDDATE,LASTMODIFIEDBYID,SYSTEMMODSTAMP,LASTACTIVITYDATE,LASTVIEWEDDATE,
        LASTREFERENCEDDATE,NULL AS ISPARTNER,NULL AS ISCUSTOMERPORTAL,JIGSAW,JIGSAWCOMPANYID,
        ACCOUNTSOURCE,SICDESC,DANDBCOMPANYID,OPERATINGHOURSID,
  CURRENT_TIMESTAMP AS INSERT_DT
,ID AS KEY_ID
FROM {{source('Infofiscus','ACCOUNTS')}}
INNER JOIN skilful-gantry-404609.Landing.INFOFISCUS_CT
ON SRC_OBJECT ='ACCOUNTS' AND TGT_OBJECT = 'STG_ACCOUNTS' 
 WHERE LASTMODIFIEDDATE >= LAST_RUN_DATE

)

SELECT * FROM ACCOUNTS
            