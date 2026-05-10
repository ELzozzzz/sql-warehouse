IF NOT EXISTS (SELECT 1 FROM sys.schemas WHERE name = 'silver')
	EXEC('CREATE SCHEMA silver');
