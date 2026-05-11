-- create bronze tables crm customer info table
IF OBJECT_ID('bronze.crm_cust_info','U') IS NULL
BEGIN
     CREATE TABLE bronze.crm_cust_info(
        cst_id INT ,
        cst_key varchar(50) ,
        cst_firstname varchar(50) ,
        cst_lastname varchar(50) ,
        cst_martial_status varchar(50),
        cst_gndr varchar(50) ,
        cst_create_date DATE
    );
END;

    


-- create bronze tables crm product info table
IF OBJECT_ID('bronze.crm_prd_info','U') IS NULL
BEGIN
    CREATE TABLE bronze.crm_prd_info(
        prd_id INT ,
        prd_key varchar(50) ,
        prd_nm varchar(50) ,
        prd_cost INT,
        prd_line varchar(50) ,
        prd_start_dt DATETIME ,
        prd_end_dt DATETIME
    );
END;
    
   



-- create bronze table bronze.crm_sales_details if not exists
IF OBJECT_ID('bronze.crm_sales_details', 'U') IS NULL
BEGIN
    CREATE TABLE bronze.crm_sales_details(
        sls_ord_num NVARCHAR(50) ,
        sls_prd_key NVARCHAR(50) ,
        sls_cust_id INT , 
        sls_order_dt INT,
        sls_ship_dt INT, 
        sls_due_dt INT,
        sls_sales INT,
        sls_quantity INT,
        sls_price INT
        
    );
END;


--create bronze table erp customer info
IF OBJECT_ID('bronze.erp_cust_az12', 'U') IS NULL
BEGIN
CREATE TABLE bronze.erp_cust_az12(
    cid NVARCHAR(50) ,
    bdate DATE ,
    gen NVARCHAR(50)
);
END;
--create bronze table erp location info
IF OBJECT_ID('bronze.erp_loc_a101', 'U') IS NULL
BEGIN
CREATE TABLE bronze.erp_loc_a101(
    cid NVARCHAR(50) ,
    cntry NVARCHAR(50) ,
);
END;

--create bronze table erp product info
IF OBJECT_ID('bronze.erp_PX_CAT_G1V2', 'U') IS NULL
BEGIN
CREATE TABLE bronze.erp_PX_CAT_G1V2(
    id NVARCHAR(50) ,
    cat NVARCHAR(50) ,
    subcat NVARCHAR(50) ,
    maintenance NVARCHAR(50)
);
END;
