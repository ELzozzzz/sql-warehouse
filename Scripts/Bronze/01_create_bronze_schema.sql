-- create bronze schema if it does not exist
IF NOT EXISTS (SELECT 1 FROM sys.schemas WHERE name = 'bronze')
	EXEC('CREATE SCHEMA bronze');



