-- load customer info (crm table)
TRUNCATE TABLE bronze.crm_cust_info;
BULK INSERT bronze.crm_cust_info 
FROM 'F:\sql-q-ds\cust_info(crm).csv'
WITH
(
    FIRSTROW =2,
    FIELDTERMINATOR = ',',
    TABLOCK
)


-- load product info (crm table)
TRUNCATE TABLE bronze.crm_prd_info;
BULK INSERT bronze.crm_prd_info 
FROM 'F:\sql-q-ds\prd_info(crm).csv'
WITH
(
    FIRSTROW =2,
    FIELDTERMINATOR = ',',
    TABLOCK
)

-- load sales details (crm table)
TRUNCATE TABLE bronze.crm_sales_details;
BULK INSERT bronze.crm_sales_details
FROM 'F:\sql-q-ds\sales_details(crm).csv'
WITH
(
    FIRSTROW =2,
    FIELDTERMINATOR = ',',
    TABLOCK
)

-- load erp customer info
TRUNCATE TABLE bronze.erp_cust_az12;
BULK INSERT bronze.erp_cust_az12
FROM 'F:\sql-q-ds\CUST_AZ12.csv'
WITH
(
    FIRSTROW =2,
    FIELDTERMINATOR = ',',
    TABLOCK
)

-- load erp location info
TRUNCATE TABLE bronze.erp_loc_a101;
BULK INSERT bronze.erp_loc_a101
FROM 'F:\sql-q-ds\LOC_A101.csv'
WITH
(
    FIRSTROW =2,
    FIELDTERMINATOR = ',',
    TABLOCK
)
-- load erp product info
TRUNCATE TABLE bronze.erp_PX_CAT_G1V2;
BULK INSERT bronze.erp_PX_CAT_G1V2
FROM 'F:\sql-q-ds\PX_CAT_G1V2.csv'
WITH
(
    FIRSTROW =2,
    FIELDTERMINATOR = ',',
    TABLOCK
)
