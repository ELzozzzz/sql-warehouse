CREATE OR ALTER PROCEDURE bronze.load_bronze AS 
BEGIN
    DECLARE @start_batch_time DATETIME = GETDATE(),
            @end_batch_time DATETIME;
    DECLARE @start_time DATETIME = GETDATE(),
        @end_time DATETIME;
           SET @start_batch_time = GETDATE(); 
    BEGIN TRY
        PRINT '==============================================================';
        PRINT 'Loading bronze tables...';
        PRINT '==============================================================';

        PRINT '-----------------------------------';
        PRINT 'Loading CRM tables...';
        PRINT '-----------------------------------';
        -- load customer info (crm table)
        PRINT '<<<TRUNCATE TABLE bronze.crm_cust_info';
        SET @start_time = GETDATE();
        TRUNCATE TABLE bronze.crm_cust_info;
        PRINT '<<<BULK INSERT bronze.crm_cust_info';
        BULK INSERT bronze.crm_cust_info 
        FROM 'F:\sql-q-ds\cust_info(crm).csv'
        WITH
        (
            FIRSTROW =2,
            FIELDTERMINATOR = ',',
            TABLOCK
        )
        SET @end_time = GETDATE();
        PRINT 'Time taken to load bronze.crm_cust_info: ' + CAST(DATEDIFF(SECOND, @start_time, @end_time) AS NVARCHAR(10)) + ' seconds';
        

        PRINT '-----------------------------------';
        -- load product info (crm table)
        PRINT '<<<TRUNCATE TABLE bronze.crm_prd_info';
        SET @start_time = GETDATE();
        TRUNCATE TABLE bronze.crm_prd_info;
        PRINT '<<<BULK INSERT bronze.crm_prd_info';
        BULK INSERT bronze.crm_prd_info 
        FROM 'F:\sql-q-ds\prd_info(crm).csv'
        WITH
        (
            FIRSTROW =2,
            FIELDTERMINATOR = ',',
            TABLOCK
        )
        SET @end_time = GETDATE();
        PRINT 'Time taken to load bronze.crm_prd_info: ' + CAST(DATEDIFF(SECOND, @start_time, @end_time) AS NVARCHAR(10)) + ' seconds';

        PRINT '-----------------------------------';
        -- load sales details (crm table)
        PRINT '<<<TRUNCATE TABLE bronze.crm_sales_details';
        SET @start_time = GETDATE();
        TRUNCATE TABLE bronze.crm_sales_details;
        PRINT '<<<BULK INSERT bronze.crm_sales_details';
        BULK INSERT bronze.crm_sales_details
        FROM 'F:\sql-q-ds\sales_details(crm).csv'
        WITH
        (
            FIRSTROW =2,
            FIELDTERMINATOR = ',',
            TABLOCK
        )
        SET @end_time = GETDATE();
        PRINT 'Time taken to load bronze.crm_sales_details: ' + CAST(DATEDIFF(SECOND, @start_time, @end_time) AS NVARCHAR(10)) + ' seconds';
        
        PRINT '-----------------------------------';
        PRINT 'Loading ERP tables...';
        PRINT '-----------------------------------';
        -- load erp customer info
        PRINT '<<<TRUNCATE TABLE bronze.erp_cust_az12';
        SET @start_time = GETDATE();
        TRUNCATE TABLE bronze.erp_cust_az12;
        PRINT '<<<BULK INSERT bronze.erp_cust_az12';
        BULK INSERT bronze.erp_cust_az12
        FROM 'F:\sql-q-ds\CUST_AZ12.csv'
        WITH
        (
            FIRSTROW =2,
            FIELDTERMINATOR = ',',
            TABLOCK
        )
        SET @end_time = GETDATE();
        PRINT 'Time taken to load bronze.erp_cust_az12: ' + CAST(DATEDIFF(SECOND, @start_time, @end_time) AS NVARCHAR(10)) + ' seconds';
        PRINT '-----------------------------------';
        -- load erp location info
        PRINT '<<<TRUNCATE TABLE bronze.erp_loc_a101';
        SET @start_time = GETDATE();
        TRUNCATE TABLE bronze.erp_loc_a101;
        PRINT '<<<BULK INSERT bronze.erp_loc_a101';
        BULK INSERT bronze.erp_loc_a101
        FROM 'F:\sql-q-ds\LOC_A101.csv'
        WITH
        (
            FIRSTROW =2,
            FIELDTERMINATOR = ',',
            TABLOCK
        )
        SET @end_time = GETDATE();
        PRINT 'Time taken to load bronze.erp_loc_a101: ' + CAST(DATEDIFF(SECOND, @start_time, @end_time) AS NVARCHAR(10)) + ' seconds';
        PRINT '-----------------------------------';
        -- load erp product info
        PRINT '<<<TRUNCATE TABLE bronze.erp_PX_CAT_G1V2';
        SET @start_time = GETDATE();
        TRUNCATE TABLE bronze.erp_PX_CAT_G1V2;
        PRINT '<<<BULK INSERT bronze.erp_PX_CAT_G1V2';
        BULK INSERT bronze.erp_PX_CAT_G1V2
        FROM 'F:\sql-q-ds\PX_CAT_G1V2.csv'
        WITH
        (
            FIRSTROW =2,
            FIELDTERMINATOR = ',',
            TABLOCK
        )
        SET @end_time = GETDATE();
        PRINT 'Time taken to load bronze.erp_PX_CAT_G1V2: ' + CAST(DATEDIFF(SECOND, @start_time, @end_time) AS NVARCHAR(10)) + ' seconds';
    END TRY
    BEGIN CATCH
        PRINT 'Error occurred while loading bronze tables.';
        PRINT 'Error Message: ' + ERROR_MESSAGE();
        PRINT 'Error Number: ' + CAST(ERROR_NUMBER() AS NVARCHAR(10));
        PRINT 'Error Line: ' + CAST(ERROR_LINE() AS NVARCHAR(10));
        THROW;
    END CATCH
    SET @end_batch_time = GETDATE();
    PRINT '==============================================================';
    PRINT 'Finished loading bronze tables.';
    PRINT 'Total time taken to load bronze tables: ' + CAST(DATEDIFF(SECOND, @start_batch_time, @end_batch_time) AS NVARCHAR(10)) + ' seconds';
END