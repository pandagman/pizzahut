USE [pizzahut-db]
GO

CREATE OR ALTER PROC CreateSQLServerlessView_pizzahut @ViewName nvarchar(100)
AS 
BEGIN
    DECLARE @statement VARCHAR(MAX)
    SET @statement = N'CREATE OR ALTER VIEW ' + @ViewName + ' AS
        SELECT
            *
        FROM
            OPENROWSET(
                BULK ''https://pizzahutsa.dfs.core.windows.net/pizzahut-data/transformed-data/' + @ViewName + '/'',
                FORMAT = ''DELTA''
            ) AS [result]'

    EXEC (@statement)
END
GO