-- create bronze tables crm customer info table
    CREATE TABLE bronze.crm_cust_info(
    cst_id INT ,
    cst_key varchar(50) ,
    cst_firstname varchar(50) ,
    cst_lastname varchar(50) ,
    cst_martial_status varchar(50),
    cst_gndr varchar(50) ,
    cst_create_date DATE
);


-- create bronze tables crm product info table
CREATE TABLE bronze.crm_prd_info(
    prd_id INT,
    prd_key VARCHAR(50) ,
    prd_nm VARCHAR(50) ,
    prd_cost INT,
    prd_line VARCHAR(50),
    prd_start_dt DATETIME ,
    prd_end_dt DATETIME
);


-- create bronze tables crm sales info table
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