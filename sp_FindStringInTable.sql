CREATE PROCEDURE [dbo].[sp_FindStringInTable] @stringToFind VARCHAR(max), @table sysname 
AS

SET NOCOUNT ON

BEGIN TRY
   DECLARE @sqlCommand varchar(max) = 'SELECT * FROM [' + @table + '] WHERE ' 
	   
   SELECT @sqlCommand = @sqlCommand + '[' + COLUMN_NAME + '] LIKE ''' + @stringToFind + ''' OR '
   FROM INFORMATION_SCHEMA.COLUMNS 
   WHERE TABLE_NAME = @table 
   AND DATA_TYPE IN ('int','text','varchar')

   SET @sqlCommand = left(@sqlCommand,len(@sqlCommand)-3)
   EXEC (@sqlCommand)
   PRINT @sqlCommand
END TRY

BEGIN CATCH 
   PRINT 'There was an error. Check to make sure object exists.'
   PRINT error_message()
END CATCH 