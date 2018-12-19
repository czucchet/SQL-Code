USE [z'9bbaf92f-d960-4e33-a9cd-228c72cc97ef]
GO
     /****** Object:  StoredProcedure [dbo].[00.MASTER_RUN_ALL]    Script Date: 4/10/2018 9:29:25 AM ******/
     SET ANSI_NULLS ON
     GO
     SET QUOTED_IDENTIFIER ON
     GO
     ALTER PROC [dbo].[00.MASTER_RUN_ALL]
     AS
     
     /******************************************************************************************************
     *                           DATA ASSURANCE                                                            *
     *******************************************************************************************************
     UPDATES            - Version 0.1 {03/03/2015} {Simon Tsai} - {Created script and updated the script}
     - Version 0.2 {03/03/2015} {Simon Tsai) - {Added Commentary}
     - Version 0.3 {19/03/2015} {Simon Tsai} - {Added RES_TOTAL_LEVEL_SUMMARY
     AND RES_POSITION_LEVEL_SUMMARY}
     - Version 0.4 {11/08/2015} {Fei Li) - {Added  BLD_VAL_MASTER}
     - Version 0.5 {14/08/2015} {Fei Li} - {Added  BLD_TEST_FIELD,BLD_FIELD_MAPPING}
     - Version 0.6 {25/08/2015} {Fei Li} - {Added  TST_OVERTIME_ANALYSIS}
     - Version 0.7 {28/08/2015} {Fei Li} - {Modify employee leave balance to leave taken}
     - Version 0.8 {31/08/2015} {Fei Li} - {Added leave result and leave tests}
     - Version 0.9 {19/02/2015} {Fei Li} - {Added script update the employee data with dummy data}
     
     SCRIPT DESCRIPTION - {Create script to run all applicable stored procedures}
     
     SUMMARY OF SCRIPT  - 01. Creates index on tables and the raw data
     - 02. Builds common data tables and defining the data types required
     - 03. Reads and creates reference tables
     - 04. Reading and cleansing the raw data tables into the common data model
     - 05. Creates employee test results table and payslip test result table
     - 06. Data cleansing script to populate the PWC_ fields in the common data models
     - 07. Execute the employee tests
     - 08. Execute the pay slip tests
     - 09. Reconciliation test to reconcile the payslip data with the EFT data
     - 10. Build and store results of employee to employee test that tests
     - 11. Update Payslip Detail table to include a flag that indicate whether a 
     payslip is a duplicate 
     - 12. Starters and leaves reconciliation testing
     - 13. Test payslip before employee start date
     - 14. Run and store the results of the leave tests 
     - 15. Creates the test description table
     - 16. Prepare the test tables with relevant information to be read by QLIKVIEW
     - 17. Update the employee master table to record the number of test failed by each 
     employee
     - 18. Creates a table that dynamically picks up all test generated from the 
     RES_EMPLOYEE and RES_PAYSLIP table. This table will be used by QLIKVIEW.
     ******************************************************************************************************/
     
     /******************************************************************************************************
     01. The following script creates the index on the tables and the raw data
     Comments added by Simon Tsai on 03/03/2015
     ******************************************************************************************************/
     
     EXEC [dbo].[01.BLD_INDEX_TABLE]
     PRINT 'Sucessfully finished running [dbo].[01.BLD_INDEX_TABLE] stored procedure'
     PRINT 'Completed on ' + CONVERT(NVARCHAR(50),SYSDATETIME())
     
     EXEC [dbo].[02.BLD_INDEX_ON_RAW]
     PRINT 'Sucessfully finished running [dbo].[02.BLD_INDEX_ON_RAW] stored procedure'
     PRINT 'Completed on ' + CONVERT(NVARCHAR(50),SYSDATETIME())
     
     /******************************************************************************************************
     02. The following scripts builds the data table by defining the data types for the variables
     Comments added by Simon Tsai on 03/03/2015
     ******************************************************************************************************/
     
     EXEC [dbo].[03.BLD_EMP_TABLES]
     PRINT 'Sucessfully finished running [dbo].[03.BLD_EMP_TABLES] stored procedure'
     PRINT 'Completed on ' + CONVERT(NVARCHAR(50),SYSDATETIME())
     
     EXEC [dbo].[04.BLD_PAYROLL_TABLES]
     PRINT 'Sucessfully finished running [dbo].[04.BLD_PAYROLL_TABLES] stored procedure'
     PRINT 'Completed on ' + CONVERT(NVARCHAR(50),SYSDATETIME())
     
     EXEC [dbo].[05.BLD_REFERENCE_TABLES]
     PRINT 'Sucessfully finished running [dbo].[05.BLD_REFERENCE_TABLES] stored procedure'
     PRINT 'Completed on ' + CONVERT(NVARCHAR(50),SYSDATETIME())
     
     /******************************************************************************************************
     03. The following scripts creates the reference tables which includes
     - Trial balance
     - Pay code information table
     - Pay type information table
     - User defined parameters
     Comments added by Simon Tsai on 03/03/2015
     ******************************************************************************************************/
     
     EXEC [dbo].[05A.PREP_REF_TRIAL_BALANCE]
     PRINT 'Sucessfully finished running [dbo].[05A.PREP_REF_TRIAL_BALANCE] stored procedure'
     PRINT 'Completed on ' + CONVERT(NVARCHAR(50),SYSDATETIME())
     
     EXEC [dbo].[05B.PREP_REF_PAYCODE]
     PRINT 'Sucessfully finished running [dbo].[05B.PREP_REF_PAYCODE] stored procedure'
     PRINT 'Completed on ' + CONVERT(NVARCHAR(50),SYSDATETIME())
     
     EXEC [dbo].[05C.PREP_REF_PAYTYPE]
     PRINT 'Sucessfully finished running [dbo].[05B.PREP_REF_PAYCODE] stored procedure'
     PRINT 'Completed on ' + CONVERT(NVARCHAR(50),SYSDATETIME())
     
     EXEC [dbo].[05D.BLD_REF_PARAMETERS]
     PRINT 'Sucessfully finished running [dbo].[05D.BLD_REF_PARAMETERS] stored procedure'
     PRINT 'Completed on ' + CONVERT(NVARCHAR(50),SYSDATETIME())
     
     /******************************************************************************************************
     04. The following scripts reads the data from the raw data tables and cleanse the data to fit into a 
     common data model
     Comments added by Simon Tsai on 03/03/2015
     ******************************************************************************************************/
     
     EXEC [dbo].[06.PREP_EMP_BANK_ACCOUNT]
     PRINT 'Sucessfully finished running [dbo].[06.PREP_EMP_BANK_ACCOUNT] stored procedure'
     PRINT 'Completed on ' + CONVERT(NVARCHAR(50),SYSDATETIME())
     
     EXEC [dbo].[07.PREP_EMP_ADDRESS]
     PRINT 'Sucessfully finished running [dbo].[07.PREP_EMP_ADDRESS] stored procedure'
     PRINT 'Completed on ' + CONVERT(NVARCHAR(50),SYSDATETIME())
     
     EXEC [dbo].[08.PREP_EMP_NUMBER]
     PRINT 'Sucessfully finished running [dbo].[08.PREP_EMP_NUMBER] stored procedure'
     PRINT 'Completed on ' + CONVERT(NVARCHAR(50),SYSDATETIME())
     
     EXEC [dbo].[09.PREP_EMP_POSITION_HISTORY]
     PRINT 'Sucessfully finished running [dbo].[09.PREP_EMP_POSITION_HISTORY] stored procedure'
     PRINT 'Completed on ' + CONVERT(NVARCHAR(50),SYSDATETIME())
     
     EXEC [dbo].[10.PREP_EMP_MASTER]
     PRINT 'Sucessfully finished running [dbo].[10.PREP_EMP_MASTER] stored procedure'
     PRINT 'Completed on ' + CONVERT(NVARCHAR(50),SYSDATETIME())
     
     EXEC [dbo].[11.PREP_PAYSLIPS_DETAILS]
     PRINT 'Sucessfully finished running [dbo].[11.PREP_PAYSLIPS_DETAILS] stored procedure'
     PRINT 'Completed on ' + CONVERT(NVARCHAR(50),SYSDATETIME())
     
     EXEC [dbo].[12.PREP_PAYSLIPS_HEADER]
     PRINT 'Sucessfully finished running [dbo].[12.PREP_PAYSLIPS_HEADER] stored procedure'
     PRINT 'Completed on ' + CONVERT(NVARCHAR(50),SYSDATETIME())
     
     EXEC [dbo].[13.PREP_BANK_EFT]
     PRINT 'Sucessfully finished running [dbo].[13.PREP_BANK_EFT] stored procedure'
     PRINT 'Completed on ' + CONVERT(NVARCHAR(50),SYSDATETIME())
     
     EXEC [dbo].[13A.PREP_EMP_LEAVE_TAKEN]
     PRINT 'Sucessfully finished running [dbo].[13A.PREP_EMP_LEAVE_TAKEN] stored procedure'
     PRINT 'Completed on ' + CONVERT(NVARCHAR(50),SYSDATETIME())
     
     /******************************************************************************************************
     05. Create results table for the employee test and the payslip tests
     Comments added by Simon Tsai on 03/03/2015
     ******************************************************************************************************/
     
     EXEC [dbo].[14.BLD_RES_EMPLOYEE]
     PRINT 'Sucessfully finished running [dbo].[14.BLD_RES_EMPLOYEE] stored procedure'
     PRINT 'Completed on ' + CONVERT(NVARCHAR(50),SYSDATETIME())
     
     EXEC [dbo].[14A.BLD_RES_LEAVE]
     PRINT 'Sucessfully finished running [dbo].[14A.BLD_RES_LEAVE] stored procedure'
     PRINT 'Completed on ' + CONVERT(NVARCHAR(50),SYSDATETIME())
     
     EXEC [dbo].[15.BLD_RES_PAYSLIP]
     PRINT 'Sucessfully finished running [dbo].[15.BLD_RES_PAYSLIP] stored procedure'
     PRINT 'Completed on ' + CONVERT(NVARCHAR(50),SYSDATETIME())
     
     /******************************************************************************************************
     06. Script to cleanse the client data and store the cleansed data in the PWC_ fields
     Comments added by Simon Tsai on 03/03/2015
     ******************************************************************************************************/
     
     EXEC [dbo].[16.UPDATE_EMP_MASTER]
     PRINT 'Sucessfully finished running [dbo].[16.UPDATE_EMP_MASTER] stored procedure'
     PRINT 'Completed on ' + CONVERT(NVARCHAR(50),SYSDATETIME())
     
     EXEC [dbo].[39.UPDATE_EMP_BANK_ACCOUNT]
     PRINT 'Sucessfully finished running [dbo].[39.UPDATE_EMP_BANK_ACCOUNT] stored procedure'
     PRINT 'Completed on ' + CONVERT(NVARCHAR(50),SYSDATETIME())
     
     
     /******************************************************************************************************
     07. Run and store the results of the Employee tests
     Comments added by Simon Tsai on 03/03/2015
     ******************************************************************************************************/
     
     EXEC [dbo].[17.TST_TERM_BEFORE_START]
     PRINT 'Sucessfully finished running [dbo].[17.TST_TERM_BEFORE_START] stored procedure'
     PRINT 'Completed on ' + CONVERT(NVARCHAR(50),SYSDATETIME())
     
     EXEC [dbo].[20.TST_EMPLOYEE_MISSING_DATA]
     PRINT 'Sucessfully finished running [dbo].[20.TST_EMPLOYEE_MISSING_DATA] stored procedure'
     PRINT 'Completed on ' + CONVERT(NVARCHAR(50),SYSDATETIME())
     
     EXEC [dbo].[21.TST_EMPLOYEE_WITH_ZERO_PAYSLIP]
     PRINT 'Sucessfully finished running [dbo].[21.TST_EMPLOYEE_WITH_ZERO_PAYSLIP] stored procedure'
     PRINT 'Completed on ' + CONVERT(NVARCHAR(50),SYSDATETIME())
     
     EXEC [dbo].[23.TST_PAYROLL_POSITION_OVERLAP]
     PRINT 'Sucessfully finished running [dbo].[23.TST_PAYROLL_POSITION_OVERLAP] stored procedure'
     PRINT 'Completed on ' + CONVERT(NVARCHAR(50),SYSDATETIME())
     
     EXEC [dbo].[29.TST_Name_Validity]
     PRINT 'Sucessfully finished running [dbo].[29.TST_Name_Validity] stored procedure'
     PRINT 'Completed on ' + CONVERT(NVARCHAR(50),SYSDATETIME())
     
     EXEC [dbo].[31.TST_Bank_Validity]
     PRINT 'Sucessfully finished running [dbo].[31.TST_Bank_Validity] stored procedure'
     PRINT 'Completed on ' + CONVERT(NVARCHAR(50),SYSDATETIME())
     
     /******************************************************************************************************
     08. Run and store the results of the Payslip tests
     Comments added by Simon Tsai on 03/03/2015
     ******************************************************************************************************/
     
     EXEC [dbo].[18.TST_PAYSLIP_AFTER_TERMINATION]
     PRINT 'Sucessfully finished running [dbo].[18.TST_PAYSLIP_AFTER_TERMINATION] stored procedure'
     PRINT 'Completed on ' + CONVERT(NVARCHAR(50),SYSDATETIME())
     
     EXEC [dbo].[19.TST_EMPLOYEE_WITH_ONE_PAYSLIP]
     PRINT 'Sucessfully finished running [dbo].[19.TST_EMPLOYEE_WITH_ONE_PAYSLIP] stored procedure'
     PRINT 'Completed on ' + CONVERT(NVARCHAR(50),SYSDATETIME())
     
     EXEC [dbo].[22.TST_EMPLOYEE_NOT_IN_MASTER]
     PRINT 'Sucessfully finished running [dbo].[22.TST_EMPLOYEE_NOT_IN_MASTER] stored procedure'
     PRINT 'Completed on ' + CONVERT(NVARCHAR(50),SYSDATETIME())
     
     EXEC [dbo].[24.TST_ROUND_DOLLAR_PAYSLIP]
     PRINT 'Sucessfully finished running [dbo].[24.TST_ROUND_DOLLAR_PAYSLIP] stored procedure'
     PRINT 'Completed on ' + CONVERT(NVARCHAR(50),SYSDATETIME())
     
     EXEC [dbo].[26.TST_MULTIPLE_PAYSLIP]
     PRINT 'Sucessfully finished running [dbo].[26.TST_MULTIPLE_PAYSLIP] stored procedure'
     PRINT 'Completed on ' + CONVERT(NVARCHAR(50),SYSDATETIME())
     
     EXEC [dbo].[27.TST_PAYSLIP_PROCESSED_ON_WEEKEND]
     PRINT 'Sucessfully finished running [dbo].[27.TST_PAYSLIP_PROCESSED_ON_WEEKEND] stored procedure'
     PRINT 'Completed on ' + CONVERT(NVARCHAR(50),SYSDATETIME())
     
     EXEC [dbo].[28.TST_EFT_PROCESSED_ON_WEEKEND]
     PRINT 'Sucessfully finished running [dbo].[28.TST_EFT_PROCESSED_ON_WEEKEND] stored procedure'
     PRINT 'Completed on ' + CONVERT(NVARCHAR(50),SYSDATETIME())
     
     EXEC [dbo].[34.TST_PAYSLIP_BEFORE_START_DATE]
     PRINT 'Sucessfully finished running [dbo].[34.TST_PAYSLIP_BEFORE_START_DATE] stored procedure'
     PRINT 'Completed on ' + CONVERT(NVARCHAR(50),SYSDATETIME())
     
     EXEC [dbo].[35.TST_OVERTIME_ANALYSIS]
     PRINT 'Sucessfully finished running [dbo].[35.TST_OVERTIME_ANALYSIS] stored procedure'
     PRINT 'Completed on ' + CONVERT(NVARCHAR(50),SYSDATETIME())
     
     
     
     /******************************************************************************************************
     09. Reconciliation test to reconcile the payslip data with the EFT data
     Comments added by Simon Tsai on 03/03/2015
     ******************************************************************************************************/
     
     EXEC [dbo].[25.TST_PAYSLIPS_TO_EFT]
     PRINT 'Sucessfully finished running [dbo].[25.TST_PAYSLIPS_TO_EFT] stored procedure'
     PRINT 'Completed on ' + CONVERT(NVARCHAR(50),SYSDATETIME())
     
     /******************************************************************************************************
     10. Build and store results of employee to employee test that tests for the following 4 attributes
     - Employee Contact Detail
     - Employee Address
     - Employee Bank Account Detail
     - Employee Name
     Comments added by Simon Tsai on 03/03/2015
     ******************************************************************************************************/
     
     EXEC [dbo].[30.RES_E2E_MATCH]
     PRINT 'Sucessfully finished running [dbo].[30.RES_E2E_MATCH] stored procedure'
     PRINT 'Completed on ' + CONVERT(NVARCHAR(50),SYSDATETIME())
     
     /******************************************************************************************************
     11. Update Payslip Detail table to include a flag that indicate whether a payslip is a duplicate 
     Comments added by Simon Tsai on 03/03/2015
     ******************************************************************************************************/
     
     EXEC [dbo].[32.TST_DUPLICATE_PAYSLIP]
     PRINT 'Sucessfully finished running [dbo].[32.TST_DUPLICATE_PAYSLIP] stored procedure'
     PRINT 'Completed on ' + CONVERT(NVARCHAR(50),SYSDATETIME())
     
     /******************************************************************************************************
     12. Starters and leaves reconciliation testing
     - Starting employee number + new starters - terminated employees = Closing employee number
     Comments added by Simon Tsai on 03/03/2015
     ******************************************************************************************************/
     
     EXEC [dbo].[33.TST_STARTER_LEAVER_RECONCILIATION]
     PRINT 'Sucessfully finished running [dbo].[33.TST_STARTER_LEAVER_RECONCILIATION] stored procedure'
     PRINT 'Completed on ' + CONVERT(NVARCHAR(50),SYSDATETIME())
     
     /******************************************************************************************************
     13. Test payslip before employee start date
     ******************************************************************************************************/
     
     EXEC [dbo].[34.TST_PAYSLIP_BEFORE_START_DATE]
     PRINT 'Sucessfully finished running [dbo].[34.TST_PAYSLIP_BEFORE_START_DATE] stored procedure'
     PRINT 'Completed on ' + CONVERT(NVARCHAR(50),SYSDATETIME())
     
     /******************************************************************************************************
     14. Run and store the results of the leave tests 
     ******************************************************************************************************/
     
     EXEC [dbo].[36A.TST_ANN_LEAVE_EXCEEDS_20DAYS]
     PRINT 'Sucessfully finished running [dbo].[36A.TST_ANN_LEAVE_EXCEEDS_20DAYS] stored procedure'
     PRINT 'Completed on ' + CONVERT(NVARCHAR(50),SYSDATETIME())
     
     EXEC [dbo].[36B.TST_SICK_LEAVE_EXCEEDS_10DAYS]
     PRINT 'Sucessfully finished running [dbo].[36B.TST_SICK_LEAVE_EXCEEDS_10DAYS] stored procedure'
     PRINT 'Completed on ' + CONVERT(NVARCHAR(50),SYSDATETIME())
     
     EXEC [dbo].[36C.TST_SICK_LEAVE_EXCEEDS_ANN_LEAVE]
     PRINT 'Sucessfully finished running [dbo].[36C.TST_SICK_LEAVE_EXCEEDS_ANN_LEAVE] stored procedure'
     PRINT 'Completed on ' + CONVERT(NVARCHAR(50),SYSDATETIME())
     
     EXEC [dbo].[36D.TST_NON_ZERO_UNPAID_LEAVE]
     PRINT 'Sucessfully finished running [dbo].[36D.TST_NON_ZERO_UNPAID_LEAVE] stored procedure'
     PRINT 'Completed on ' + CONVERT(NVARCHAR(50),SYSDATETIME())
     
     EXEC [dbo].[36E.TST_SICK_LEAVE_LESS_THAN_ONE_WORKING_DAY]
     PRINT 'Sucessfully finished running [dbo].[36E.TST_SICK_LEAVE_LESS_THAN_ONE_WORKING_DAY] stored procedure'
     PRINT 'Completed on ' + CONVERT(NVARCHAR(50),SYSDATETIME())
     
     EXEC [dbo].[36F.TST_ONE_DAY_SICK_LEAVE]
     PRINT 'Sucessfully finished running [dbo].[36F.TST_ONE_DAY_SICK_LEAVE] stored procedure'
     PRINT 'Completed on ' + CONVERT(NVARCHAR(50),SYSDATETIME())
     
     
     /******************************************************************************************************
     15. Creates the test description table
     Comments added by Simon Tsai on 03/03/2015
     ******************************************************************************************************/
     
     EXEC [dbo].[37.BLD_TEST_DESCRIPTION]
     PRINT 'Sucessfully finished running [dbo].[37.BLD_TEST_DESCRIPTION] stored procedure'
     PRINT 'Completed on ' + CONVERT(NVARCHAR(50),SYSDATETIME())
     
     /******************************************************************************************************
     16. Prepare the test tables with relevant information to be read by QLIKVIEW
     Comments added by Simon Tsai on 03/03/2015
     ******************************************************************************************************/
     
     EXEC [dbo].[38.BLD_TEST_RESULT_DESCRIPTION]
     PRINT 'Sucessfully finished running [dbo].[38.BLD_TEST_RESULT_DESCRIPTION] stored procedure'
     PRINT 'Completed on ' + CONVERT(NVARCHAR(50),SYSDATETIME())
     
     /******************************************************************************************************
     17. Update the employee master table to record the number of test failed by each employee
     Comments added by Simon Tsai on 03/03/2015
     ******************************************************************************************************/
     
     EXEC [dbo].[40.UPDATE_EMP_MASTER_TEST_FAILED]
     PRINT 'Sucessfully finished running [dbo].[40.UPDATE_EMP_MASTER_TEST_FAILED] stored procedure'
     PRINT 'Completed on ' + CONVERT(NVARCHAR(50),SYSDATETIME())
     
     /******************************************************************************************************
     18. Creates a table that dynamically picks up all test generated from the RES_EMPLOYEE and 
     RES_PAYSLIP table. This table will be used by QLIKVIEW.
     Comments added by Simon Tsai on 03/03/2015
     ******************************************************************************************************/
     
     EXEC [dbo].[41.BLD_RES_USER_DEFINED]
     PRINT 'Sucessfully finished running [dbo].[41.BLD_RES_USER_DEFINED] stored procedure'
     PRINT 'Completed on ' + CONVERT(NVARCHAR(50),SYSDATETIME())
     
     /******************************************************************************************************
     19. Creates a table summarises the employee payslip information and create a table summarises the
     employee history information
     Comments added by Simon Tsai on 19/03/2015
     ******************************************************************************************************/
     
     EXEC [dbo].[42.BLD_RES_TOTAL_LEVEL_SUMMARY]
     PRINT 'Sucessfully finished running [dbo].[42.BLD_RES_TOTAL_LEVEL_SUMMARY] stored procedure'
     PRINT 'Completed on ' + CONVERT(NVARCHAR(50),SYSDATETIME())
     
     EXEC [dbo].[43.BLD_RES_POSITION_LEVEL_SUMMARY]
     PRINT 'Sucessfully finished running [dbo].[43.BLD_RES_POSITION_LEVEL_SUMMARY] stored procedure'
     PRINT 'Completed on ' + CONVERT(NVARCHAR(50),SYSDATETIME())
     
     
     /******************************************************************************************************
     20. Creates a table summarises the data validation results for payslip header,payslip detail,eft,employee
     master,employee address,employee contact and employee bank details
     Comments added by Fei Li on 11/08/2015
     ******************************************************************************************************/
     
     EXEC [dbo].[44.BLD_VAL_MASTER]
     PRINT 'Sucessfully finished running [dbo].[44.BLD_VAL_MASTER] stored procedure'
     PRINT 'Completed on ' + CONVERT(NVARCHAR(50),SYSDATETIME())
     
     /******************************************************************************************************
     21. Creates a table summarises the list of CDM fields required for each testS and a table 
     summarises the table and fields mapping from source table, interface table and CDM tables
     Comments added by Fei Li on 14/08/2015
     ******************************************************************************************************/
     
     EXEC [dbo].[45.BLD_TEST_FIELD]
     PRINT 'Sucessfully finished running [dbo].[45.BLD_TEST_FIELD] stored procedure'
     PRINT 'Completed on ' + CONVERT(NVARCHAR(50),SYSDATETIME())
     
     EXEC [dbo].[46.BLD_FIELD_MAPPING]
     PRINT 'Sucessfully finished running [dbo].[46.BLD_FIELD_MAPPING] stored procedure'
     PRINT 'Completed on ' + CONVERT(NVARCHAR(50),SYSDATETIME())
     
     /******************************************************************************************************
     22. Script to update the employee data with dummy data
     Comments added by Fei Li on 19/02/2016
     ******************************************************************************************************/
     EXEC [dbo].[47.UPDATE_EMP_MASTER_WITH_DUMMY_RECORDS]
     PRINT 'Sucessfully finished running [dbo].[47.UPDATE_EMP_MASTER_WITH_DUMMY_RECORDS] stored procedure'
     PRINT 'Completed on ' + CONVERT(NVARCHAR(50),SYSDATETIME())USE [z'9bbaf92f-d960-4e33-a9cd-228c72cc97ef]
GO
/****** Object:  StoredProcedure [dbo].[01.BLD_INDEX_TABLE]    Script Date: 4/10/2018 9:30:16 AM ******/
  SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROC [dbo].[01.BLD_INDEX_TABLE]
AS 

/*******************************************************************************************************
  *                           DATA ASSURANCE                                                             *
  ********************************************************************************************************
  UPDATES            - Version 0.1 {04/02/2015} {Simon Tsai} - {Created the index table}
- Version 0.2 {06/02/2015} {Avideep Agarwal} - {Reviewed}
- Version 0.3 {03/03/2015} {Simon Tsai} - {Added Commentary}

SCRIPT DESCRIPTION - {CREATE INDEX TABLE FOR PAYROLL}

TABLE INFORMATION
INPUT TABLE(S)
- [Disbursements]
- [Employee Data]
- [Employee Occupancy Data]
- [Job Details]
- [Occupancy Allowances]
- [Payroll Transactions]

OUTPUT TABLE(S)
- [REF_TABLE_INDEX]

SUMMARY OF SCRIPT  - 01. DROP TABLE STATEMENT
- 02. CREATE DATA TABLE WITH DATA TYPE DEFINITION
- 03. CREATE REFERENCES AND INSERTING IT INTO REFERENCE TABLE INDEX
- 04. UPDATE CAF TABLE NAMES

********************************************************************************************************
  01. DROP TABLE STATEMENT
*******************************************************************************************************/
  
  IF OBJECT_ID('REF_TABLE_INDEX') IS NOT NULL
DROP TABLE REF_TABLE_INDEX

/*******************************************************************************************************
  02. CREATE DATA TABLE WITH DATA TYPE DEFINITION
*******************************************************************************************************/
  
  CREATE TABLE [DBO].[REF_TABLE_INDEX]
(
  [PWC_ID] INT IDENTITY(1,1) NOT NULL
  ,[CAF_TABLE_NAME] NVARCHAR(MAX) NULL
  ,[Table_Name] NVARCHAR(MAX) NOT NULL
  ,[Column_Name] NVARCHAR(MAX) NOT NULL
  ,[Index_ID] NVARCHAR(MAX) NOT NULL
)

/******************************************************************************************************
  03. CREATE REFERENCES AND INSERTING IT INTO REFERENCE TABLE INDEX
******************************************************************************************************/
  
  DECLARE @DB_NAME NVARCHAR(MAX)
SET @DB_NAME = REPLACE(REPLACE(SUBSTRING(DB_NAME(),3,100),'-','_'),'`','')

/* INSERTING INDEX FOR THE Disbursements TABLE */
  INSERT INTO dbo.REF_TABLE_INDEX ( Table_Name, Column_Name, Index_ID ) VALUES ('Disbursements', 'EMPLOYEE_NO', 'ID_' + @DB_NAME + '_Disbursements_EMPLOYEE_NO')
INSERT INTO dbo.REF_TABLE_INDEX ( Table_Name, Column_Name, Index_ID ) VALUES ('Disbursements', 'PAYGRP', 'ID_' + @DB_NAME + '_Disbursements_PAYGRP')
INSERT INTO dbo.REF_TABLE_INDEX ( Table_Name, Column_Name, Index_ID ) VALUES ('Disbursements', 'PAYPERNO', 'ID_' + @DB_NAME + '_Disbursements_PAYPERNO')
INSERT INTO dbo.REF_TABLE_INDEX ( Table_Name, Column_Name, Index_ID ) VALUES ('Disbursements', 'PAYPERYR', 'ID_' + @DB_NAME + '_Disbursements_PAYPERYR')

/* INSERTING INDEX FOR THE Employee Data TABLE */
  INSERT INTO dbo.REF_TABLE_INDEX ( Table_Name, Column_Name, Index_ID ) VALUES ('Employee Data', 'EMPLOYEE_NO', 'ID_' + @DB_NAME + '_Employee_Data_EMPLOYEE_NO')

/* INSERTING INDEX FOR THE Employee Occupancy Data TABLE */
  INSERT INTO dbo.REF_TABLE_INDEX ( Table_Name, Column_Name, Index_ID ) VALUES ('Employee Occupancy Data', 'EMPLOYEE_NO	', 'ID_' + @DB_NAME + '_Employee_Occupancy_Data_EMPLOYEE_NO')
INSERT INTO dbo.REF_TABLE_INDEX ( Table_Name, Column_Name, Index_ID ) VALUES ('Employee Occupancy Data', 'JOB_NO	', 'ID_' + @DB_NAME + '_Employee_Occupancy_Data_JOB_NO')

/* INSERTING INDEX FOR THE Job Details TABLE */
  INSERT INTO dbo.REF_TABLE_INDEX ( Table_Name, Column_Name, Index_ID ) VALUES ('Job Details', 'EMPLOYEE_NO', 'ID_' + @DB_NAME + '_Job_Details_EMPLOYEE_NO')
INSERT INTO dbo.REF_TABLE_INDEX ( Table_Name, Column_Name, Index_ID ) VALUES ('Job Details', 'JOB_NO', 'ID_' + @DB_NAME + '_Job_Details_JOB_NO')
INSERT INTO dbo.REF_TABLE_INDEX ( Table_Name, Column_Name, Index_ID ) VALUES ('Job Details', 'PAYGRP', 'ID_' + @DB_NAME + '_Job_Details_PAYGRP')

/* INSERTING INDEX FOR THE Occupancy Allowances TABLE */
  INSERT INTO dbo.REF_TABLE_INDEX ( Table_Name, Column_Name, Index_ID ) VALUES ('Occupancy Allowances', 'EMPLOYEE#', 'ID_' + @DB_NAME + '_Occupancy_Allowances_EMPLOYEE_NO')
INSERT INTO dbo.REF_TABLE_INDEX ( Table_Name, Column_Name, Index_ID ) VALUES ('Occupancy Allowances', 'JOB#', 'ID_' + @DB_NAME + '_Occupancy_Allowances_JOB_NO')

/* INSERTING INDEX FOR THE Payroll Transactions TABLE */
  INSERT INTO dbo.REF_TABLE_INDEX ( Table_Name, Column_Name, Index_ID ) VALUES ('Payroll Transactions', 'EMPLOYEE#', 'ID_' + @DB_NAME + '_Payroll_Transactions_EMPLOYEE_NO')
INSERT INTO dbo.REF_TABLE_INDEX ( Table_Name, Column_Name, Index_ID ) VALUES ('Payroll Transactions', 'JOB#', 'ID_' + @DB_NAME + '_Payroll_Transactions_JOB_NO')
INSERT INTO dbo.REF_TABLE_INDEX ( Table_Name, Column_Name, Index_ID ) VALUES ('Payroll Transactions', 'PAYGRP', 'ID_' + @DB_NAME + '_Payroll_Transactions_PAYGRP')
INSERT INTO dbo.REF_TABLE_INDEX ( Table_Name, Column_Name, Index_ID ) VALUES ('Payroll Transactions', 'PAYPERNO', 'ID_' + @DB_NAME + '_Payroll_Transactions_PAYPERNO')
INSERT INTO dbo.REF_TABLE_INDEX ( Table_Name, Column_Name, Index_ID ) VALUES ('Payroll Transactions', 'PAYPERYR', 'ID_' + @DB_NAME + '_Payroll_Transactions_PAYPERYR')

/******************************************************************************************************
  04. UPDATE CAF TABLE NAMES
******************************************************************************************************/
  
  UPDATE RTI
SET RTI.CAF_TABLE_NAME = '[Client].[' + CONVERT(NVARCHAR(MAX), DS.TableCode) + ']'
FROM dbo.REF_TABLE_INDEX AS RTI
INNER JOIN
Store.DataSet AS DS
ON RTI.Table_Name = DS.DataSetName

USE [z'9bbaf92f-d960-4e33-a9cd-228c72cc97ef]
     GO
     /****** Object:  StoredProcedure [dbo].[01.BLD_INDEX_TABLE]    Script Date: 4/10/2018 9:30:16 AM ******/
     SET ANSI_NULLS ON
     GO
     SET QUOTED_IDENTIFIER ON
     GO
     ALTER PROC [dbo].[01.BLD_INDEX_TABLE]
     AS 
     
     /*******************************************************************************************************
     *                           DATA ASSURANCE                                                             *
     ********************************************************************************************************
     UPDATES            - Version 0.1 {04/02/2015} {Simon Tsai} - {Created the index table}
     - Version 0.2 {06/02/2015} {Avideep Agarwal} - {Reviewed}
     - Version 0.3 {03/03/2015} {Simon Tsai} - {Added Commentary}
     
     SCRIPT DESCRIPTION - {CREATE INDEX TABLE FOR PAYROLL}
     
     TABLE INFORMATION
     INPUT TABLE(S)
     - [Disbursements]
     - [Employee Data]
     - [Employee Occupancy Data]
     - [Job Details]
     - [Occupancy Allowances]
     - [Payroll Transactions]
     
     OUTPUT TABLE(S)
     - [REF_TABLE_INDEX]
     
     SUMMARY OF SCRIPT  - 01. DROP TABLE STATEMENT
     - 02. CREATE DATA TABLE WITH DATA TYPE DEFINITION
     - 03. CREATE REFERENCES AND INSERTING IT INTO REFERENCE TABLE INDEX
     - 04. UPDATE CAF TABLE NAMES
     
     ********************************************************************************************************
     01. DROP TABLE STATEMENT
     *******************************************************************************************************/
     
     IF OBJECT_ID('REF_TABLE_INDEX') IS NOT NULL
     DROP TABLE REF_TABLE_INDEX
     
     /*******************************************************************************************************
     02. CREATE DATA TABLE WITH DATA TYPE DEFINITION
     *******************************************************************************************************/
     
     CREATE TABLE [DBO].[REF_TABLE_INDEX]
     (
     [PWC_ID] INT IDENTITY(1,1) NOT NULL
     ,[CAF_TABLE_NAME] NVARCHAR(MAX) NULL
     ,[Table_Name] NVARCHAR(MAX) NOT NULL
     ,[Column_Name] NVARCHAR(MAX) NOT NULL
     ,[Index_ID] NVARCHAR(MAX) NOT NULL
     )
     
     /******************************************************************************************************
     03. CREATE REFERENCES AND INSERTING IT INTO REFERENCE TABLE INDEX
     ******************************************************************************************************/
     
     DECLARE @DB_NAME NVARCHAR(MAX)
     SET @DB_NAME = REPLACE(REPLACE(SUBSTRING(DB_NAME(),3,100),'-','_'),'`','')
     
     /* INSERTING INDEX FOR THE Disbursements TABLE */
     INSERT INTO dbo.REF_TABLE_INDEX ( Table_Name, Column_Name, Index_ID ) VALUES ('Disbursements', 'EMPLOYEE_NO', 'ID_' + @DB_NAME + '_Disbursements_EMPLOYEE_NO')
     INSERT INTO dbo.REF_TABLE_INDEX ( Table_Name, Column_Name, Index_ID ) VALUES ('Disbursements', 'PAYGRP', 'ID_' + @DB_NAME + '_Disbursements_PAYGRP')
     INSERT INTO dbo.REF_TABLE_INDEX ( Table_Name, Column_Name, Index_ID ) VALUES ('Disbursements', 'PAYPERNO', 'ID_' + @DB_NAME + '_Disbursements_PAYPERNO')
     INSERT INTO dbo.REF_TABLE_INDEX ( Table_Name, Column_Name, Index_ID ) VALUES ('Disbursements', 'PAYPERYR', 'ID_' + @DB_NAME + '_Disbursements_PAYPERYR')
     
     /* INSERTING INDEX FOR THE Employee Data TABLE */
     INSERT INTO dbo.REF_TABLE_INDEX ( Table_Name, Column_Name, Index_ID ) VALUES ('Employee Data', 'EMPLOYEE_NO', 'ID_' + @DB_NAME + '_Employee_Data_EMPLOYEE_NO')
     
     /* INSERTING INDEX FOR THE Employee Occupancy Data TABLE */
     INSERT INTO dbo.REF_TABLE_INDEX ( Table_Name, Column_Name, Index_ID ) VALUES ('Employee Occupancy Data', 'EMPLOYEE_NO	', 'ID_' + @DB_NAME + '_Employee_Occupancy_Data_EMPLOYEE_NO')
     INSERT INTO dbo.REF_TABLE_INDEX ( Table_Name, Column_Name, Index_ID ) VALUES ('Employee Occupancy Data', 'JOB_NO	', 'ID_' + @DB_NAME + '_Employee_Occupancy_Data_JOB_NO')
     
     /* INSERTING INDEX FOR THE Job Details TABLE */
     INSERT INTO dbo.REF_TABLE_INDEX ( Table_Name, Column_Name, Index_ID ) VALUES ('Job Details', 'EMPLOYEE_NO', 'ID_' + @DB_NAME + '_Job_Details_EMPLOYEE_NO')
     INSERT INTO dbo.REF_TABLE_INDEX ( Table_Name, Column_Name, Index_ID ) VALUES ('Job Details', 'JOB_NO', 'ID_' + @DB_NAME + '_Job_Details_JOB_NO')
     INSERT INTO dbo.REF_TABLE_INDEX ( Table_Name, Column_Name, Index_ID ) VALUES ('Job Details', 'PAYGRP', 'ID_' + @DB_NAME + '_Job_Details_PAYGRP')
     
     /* INSERTING INDEX FOR THE Occupancy Allowances TABLE */
     INSERT INTO dbo.REF_TABLE_INDEX ( Table_Name, Column_Name, Index_ID ) VALUES ('Occupancy Allowances', 'EMPLOYEE#', 'ID_' + @DB_NAME + '_Occupancy_Allowances_EMPLOYEE_NO')
     INSERT INTO dbo.REF_TABLE_INDEX ( Table_Name, Column_Name, Index_ID ) VALUES ('Occupancy Allowances', 'JOB#', 'ID_' + @DB_NAME + '_Occupancy_Allowances_JOB_NO')
     
     /* INSERTING INDEX FOR THE Payroll Transactions TABLE */
       INSERT INTO dbo.REF_TABLE_INDEX ( Table_Name, Column_Name, Index_ID ) VALUES ('Payroll Transactions', 'EMPLOYEE#', 'ID_' + @DB_NAME + '_Payroll_Transactions_EMPLOYEE_NO')
     INSERT INTO dbo.REF_TABLE_INDEX ( Table_Name, Column_Name, Index_ID ) VALUES ('Payroll Transactions', 'JOB#', 'ID_' + @DB_NAME + '_Payroll_Transactions_JOB_NO')
     INSERT INTO dbo.REF_TABLE_INDEX ( Table_Name, Column_Name, Index_ID ) VALUES ('Payroll Transactions', 'PAYGRP', 'ID_' + @DB_NAME + '_Payroll_Transactions_PAYGRP')
     INSERT INTO dbo.REF_TABLE_INDEX ( Table_Name, Column_Name, Index_ID ) VALUES ('Payroll Transactions', 'PAYPERNO', 'ID_' + @DB_NAME + '_Payroll_Transactions_PAYPERNO')
     INSERT INTO dbo.REF_TABLE_INDEX ( Table_Name, Column_Name, Index_ID ) VALUES ('Payroll Transactions', 'PAYPERYR', 'ID_' + @DB_NAME + '_Payroll_Transactions_PAYPERYR')
     
     /******************************************************************************************************
       04. UPDATE CAF TABLE NAMES
     ******************************************************************************************************/
       
       UPDATE RTI
     SET RTI.CAF_TABLE_NAME = '[Client].[' + CONVERT(NVARCHAR(MAX), DS.TableCode) + ']'
     FROM dbo.REF_TABLE_INDEX AS RTI
     INNER JOIN
     Store.DataSet AS DS
     ON RTI.Table_Name = DS.DataSetName
     
     USE [z'9bbaf92f-d960-4e33-a9cd-228c72cc97ef]
          GO
          /****** Object:  StoredProcedure [dbo].[02.BLD_INDEX_ON_RAW]    Script Date: 4/10/2018 9:30:55 AM ******/
          SET ANSI_NULLS ON
          GO
          SET QUOTED_IDENTIFIER ON
          GO
          ALTER PROC [dbo].[02.BLD_INDEX_ON_RAW]
          AS
          
          /********************************************************************************************************
          *                           DATA ASSURANCE                                                              *
          *********************************************************************************************************
          UPDATES            - Version 0.1 {05/02/2015} {Simon Tsai} - {Notes}
          - Version 0.2 {06/02/2015} {Avideep Agarwal} - {Reviewed}
          - Version 0.3 {02/03/2015} {Simon Tsai} - {Added logic to check if index already exist}
          - Version 0.4 {03/03/2015} {Simon Tsai} - {Added Commentary)
          
          SCRIPT DESCRIPTION - {Create index on RAW tables}
          
          SUMMARY OF SCRIPT  - 01. DECLARE VARIABLES TO BE USED BY SCRIPT
          - 02. ESTABLISH A COUNTER TO DETERMINE HOW MANY INDEXES TO LOOP THROUGH IN THE 
          REF_TABLE_INDEX
          - 03. START DATA LOOPING PROCESS TO EXAMINE EACH OF THE INDEXES IN THE REF_TABLE_INDEX
          - 04. GET THE NAME OF THE TABLE
          - 05. IF THE INDEX DOES NOT EXIST THEN CREATE A NEW INDEX - STORE AS A STRING
          - 06. SQL EXECUTE THE STORED STRING
          
          *********************************************************************************************************
          01. DECLARE VARIABLES TO BE USED BY SCRIPT
          ********************************************************************************************************/
          
          DECLARE @Index_Count INT
          DECLARE @Index_Process_Count INT
          DECLARE @Table_Name NVARCHAR(MAX)
          DECLARE @Index_Name NVARCHAR(MAX)
          DECLARE @Index_Column NVARCHAR(MAX)
          DECLARE @Query NVARCHAR(MAX)
          DECLARE @DROPQUERY NVARCHAR(MAX)
          
          /********************************************************************************************************
          02. ESTABLISH A COUNTER TO DETERMINE HOW MANY INDEXES TO LOOP THROUGH IN THE REF_TABLE_INDEX
          ********************************************************************************************************/
          
          SELECT 
          @Index_Count = COUNT(*) 
          FROM 
          dbo.REF_TABLE_INDEX AS RTI
          
          SET @Index_Process_Count = 1
          
          /********************************************************************************************************
          03. START DATA LOOPING PROCESS TO EXAMINE EACH OF THE INDEXES IN THE REF_TABLE_INDEX
          ********************************************************************************************************/
          
          WHILE @Index_Process_Count<=@Index_Count
          BEGIN
          
          /********************************************************************************************************
          04. GET THE NAME OF THE TABLE
          ********************************************************************************************************/
          
          SELECT
          @Table_Name = REPLACE(LTRIM(RTRIM(RTI.CAF_TABLE_NAME)),'	','')
          ,@Index_Name = REPLACE(LTRIM(RTRIM(RTI.Index_ID)),'	','')
          ,@Index_Column = REPLACE(LTRIM(RTRIM(RTI.Column_Name)),'	','')
          FROM
          dbo.REF_TABLE_INDEX AS RTI
          WHERE
          RTI.PWC_ID = @Index_Process_Count
          
          /********************************************************************************************************
          05. IF THE INDEX DOES NOT EXIST THEN CREATE A NEW INDEX - STORE AS A STRING
          ********************************************************************************************************/
          
          IF NOT EXISTS (SELECT * FROM SYS.indexes WHERE NAME = LTRIM(RTRIM(@Index_Name))) BEGIN
          SET @Query =
          'CREATE INDEX ' + LTRIM(RTRIM(@Index_Name)) + ' ON ' + LTRIM(RTRIM(@Table_Name)) + 
          ' ([' + LTRIM(RTRIM(@Index_Column)) + '])'
          END 
          
          /********************************************************************************************************
          06. SQL EXECUTE THE STORED STRING
          RESET THE @QUERY STORED STRING TO BLANK
          INCREMENT THE COUNTER FOR THE LOOP TO EXAMINE THE NEXT INDEX
          ********************************************************************************************************/
          
          EXEC sp_executesql @Query
          SET @Query = ''
          SET @Index_Process_Count = @Index_Process_Count + 1
          ENDUSE [z'9bbaf92f-d960-4e33-a9cd-228c72cc97ef]
     GO
     /****** Object:  StoredProcedure [dbo].[03.BLD_EMP_TABLES]    Script Date: 4/10/2018 9:31:31 AM ******/
       SET ANSI_NULLS ON
     GO
     SET QUOTED_IDENTIFIER ON
     GO
     ALTER PROC [dbo].[03.BLD_EMP_TABLES]
     AS
     
     /******************************************************************************************************
       *                           DATA ASSURANCE                                                            *
       *******************************************************************************************************
       UPDATES            - Version 0.1 {05/02/2015} {Simon Tsai} - {Creates the empty tables for Employee 
         information}
     - Version 0.2 {06/02/2015} {Avideep Agarwal} - {Reviewed}
     - Version 0.3 {13/02/2015} {Simon Tsai} - {Added employee leave balance table}
     - Version 0.4 {03/03/2015} {Simon Tsai} - {Added Commentary}
     - Version 0.5 {28/08/2015} {Fei Li} - {Modify employee leave balance to leave taken}
     - Version 0.6 {31/08/2015} {Fei Li} - {Added Days column in PREP_EMP_LEAVE_TAKEN}
     - Version 0.7 {31/08/2015} {Fei Li} - {Added PWC_LEAVE_TESTS_FAILED IN PREP_EMP_MASTER}
     
     SCRIPT DESCRIPTION - {Creates the empty tables for Employee information}
     
     TABLE INFORMATION
     INPUT TABLE(S)
     - N/A
     
     OUTPUT TABLE(S)
     - [DBO].[PREP_EMP_BANK_ACCOUNT]
     - [DBO].[PREP_EMP_ADDRESS]
     - [DBO].[PREP_EMP_NUMBER]
     - [DBO].[PREP_EMP_MASTER]
     - [DBO].[PREP_EMP_POSITION_HISTORY]
     - [DBO].[PREP_EMP_LEAVE_TAKEN]
     
     SUMMARY OF SCRIPT  - 01. DROP TABLE STATEMENT
     - 02. CREATE EMPTY TABLES FOR PREP_EMP_BANK_ACCOUNT
     - 03. CREATE EMPTY TABLES FOR PREP_EMP_ADDRESS
     - 04. CREATE EMPTY TABLES FOR PREP_EMP_NUMBER
     - 05. CREATE EMPTY TABLES FOR PREP_EMP_MASTER
     - 06. REATE EMPTY TABLES FOR PREP_EMP_POSITION_HISTORY
     - 07. CREATE EMPTY TABLES FOR PREP_EMP_LEAVE_TAKEN
     
     *******************************************************************************************************
       01. DROP TABLE STATEMENT
     ******************************************************************************************************/
       
       IF OBJECT_ID('PREP_EMP_BANK_ACCOUNT') IS NOT NULL
     DROP TABLE PREP_EMP_BANK_ACCOUNT
     
     IF OBJECT_ID('PREP_EMP_ADDRESS') IS NOT NULL
     DROP TABLE PREP_EMP_ADDRESS
     
     IF OBJECT_ID('PREP_EMP_NUMBER') IS NOT NULL
     DROP TABLE PREP_EMP_NUMBER
     
     IF OBJECT_ID('PREP_EMP_MASTER') IS NOT NULL
     DROP TABLE PREP_EMP_MASTER
     
     IF OBJECT_ID('PREP_EMP_POSITION_HISTORY') IS NOT NULL
     DROP TABLE PREP_EMP_POSITION_HISTORY
     
     IF OBJECT_ID('PREP_EMP_LEAVE_TAKEN') IS NOT NULL
     DROP TABLE PREP_EMP_LEAVE_TAKEN
     
     /*****************************************************************************************************
       02. CREATE EMPTY TABLES FOR PREP_EMP_BANK_ACCOUNT
     *****************************************************************************************************/
       
       CREATE TABLE [DBO].[PREP_EMP_BANK_ACCOUNT]
     (
       PWC_ACCOUNT_ID INT IDENTITY(1,1) NOT NULL
       ,EMPLOYEE_ID NVARCHAR(1000) NOT NULL	
       ,SYSTEM_NAME NVARCHAR(1000)
       ,BSB_NUMBER NVARCHAR(1000)
       ,ACCOUNT_NUMBER NVARCHAR(1000)
       ,ACCOUNT_NAME NVARCHAR(1000)
       ,[STATUS] NVARCHAR(1000)
       ,PWC_BSB_NUMBER NVARCHAR(1000)
       ,PWC_ACCOUNT_NUMBER NVARCHAR(1000)
       ,PWC_ACCOUNT_NAME NVARCHAR(1000)
       ,PWC_BSB_STATUS NVARCHAR(1000)
       ,PWC_BANK_NAME NVARCHAR(1000)
     )
     
     /*****************************************************************************************************
       03. CREATE EMPTY TABLES FOR PREP_EMP_ADDRESS
     *****************************************************************************************************/
       
       CREATE TABLE [DBO].[PREP_EMP_ADDRESS]
     (
       PWC_ADDRESS_ID  INT IDENTITY(1,1) NOT NULL
       ,EMPLOYEE_ID NVARCHAR(1000) NOT NULL	
       ,ADDRESS_TYPE NVARCHAR(1000)
       ,ADDRESS_1 NVARCHAR(1000)
       ,ADDRESS_2 NVARCHAR(1000)
       ,ADDRESS_3 NVARCHAR(1000)
       ,ADDRESS_4 NVARCHAR(1000)
       ,UNIT_NUMBER NVARCHAR(1000)
       ,STREET_NUMBER NVARCHAR(1000)
       ,STREET_NAME NVARCHAR(1000)
       ,CITY NVARCHAR(1000)
       ,[STATE] NVARCHAR(1000)
       ,POSTCODE NVARCHAR(1000)
       ,COUNTRY NVARCHAR(1000)
       --,PO_BOX NVARCHAR(1000)
       --,PO_BOX_POSTCODE NVARCHAR(1000)
       ,SYSTEM_NAME NVARCHAR(1000)
       ,PWC_TOTAL_ADDRESS NVARCHAR(1000)
     )
     
     /*****************************************************************************************************
       04. CREATE EMPTY TABLES FOR PREP_EMP_NUMBER
     *****************************************************************************************************/
       
       CREATE TABLE [DBO].[PREP_EMP_NUMBER]
     (
       PWC_NUM_ID  INT IDENTITY(1,1) NOT NULL
       ,EMPLOYEE_ID NVARCHAR(1000) NOT NULL	
       ,CONTACT_TYPE NVARCHAR(1000)
       --,AREA_CODE INT
       ,NUMBER NVARCHAR(1000)
       ,SYSTEM_NAME NVARCHAR(1000)
       ,PWC_CONTACT_NUMBER_TYPE NVARCHAR(1000)
       ,PWC_CONTACT_NUMBER NVARCHAR(1000)
     )
     
     /*****************************************************************************************************
       05. CREATE EMPTY TABLES FOR PREP_EMP_MASTER
     *****************************************************************************************************/
       
       CREATE TABLE [DBO].[PREP_EMP_MASTER]
     (
       EMPLOYEE_ID NVARCHAR(1000) NOT NULL
       ,SURNAME NVARCHAR(1000)
       ,FIRST_NAME NVARCHAR(1000)
       ,SECOND_NAME NVARCHAR(1000)
       ,THIRD_NAME NVARCHAR(1000)
       ,FOURTH_NAME NVARCHAR(1000)
       ,INITIAL NVARCHAR(1000)
       ,COMPANY NVARCHAR(1000)
       ,DEPARTMENT NVARCHAR(1000)
       ,SUB_DEPARTMENT NVARCHAR(1000)
       ,POSITION NVARCHAR(1000)
       ,LOCATION NVARCHAR(1000)
       ,[TYPE] NVARCHAR(1000)
       ,[STATUS] NVARCHAR(1000)
       ,[START_DATE] DATE
       ,TERM_DATE DATE
       ,TERM_REASON NVARCHAR(1000)
       ,DOB DATE
       ,TFN NVARCHAR(1000)
       ,SUPER_NUMBER NVARCHAR(1000)
       ,GENDER NVARCHAR(1000)
       ,SYSTEM_NAME NVARCHAR(1000)
       ,PWC_EMPLOYEE_NAME NVARCHAR(1000)
       ,PWC_TFN NVARCHAR(1000)
       ,PWC_SUPERANNUATION_NUMBER NVARCHAR(50)
       ,PWC_TERMINATED_FLAG NVARCHAR(1000)
       ,PWC_EMPLOYEE_TESTS_FAILED NVARCHAR(1000)
       ,PWC_PAYSLIP_TESTS_FAILED NVARCHAR(1000)
       ,PWC_LEAVE_TESTS_FAILED NVARCHAR(1000)
       ,PWC_PAYSLIP_COUNT INT
       ,PWC_TOTAL_GROSS DECIMAL(18,4)
       ,PWC_TOTAL_NET DECIMAL(18,4)
       ,PWC_TOTAL_TAX DECIMAL(18,4)
       ,PWC_TOTAL_SUPER DECIMAL(18,4)
       ,PWC_TERMINATION_DATE DATE
       ,PWC_AGE INT
       ,PWC_AGE_GROUP NVARCHAR(1000)
       ,PWC_TENURE INT
       ,PWC_TENURE_GROUP NVARCHAR(1000)
       ,PWC_BEGINNING_ACTIVE_EMPLOYEE INT
       ,PWC_NEW_HIRE INT
       ,PWC_TERMINATED INT
       ,PWC_ENDING_ACTIVE_EMPLOYEE INT
     )
     
     /*****************************************************************************************************
       06. CREATE EMPTY TABLES FOR PREP_EMP_POSITION_HISTORY
     *****************************************************************************************************/
       
       CREATE TABLE [DBO].[PREP_EMP_POSITION_HISTORY]
     (
       EMPLOYEE_ID NVARCHAR(1000) NOT NULL
       ,JOB_ID NVARCHAR(1000)
       ,[TYPE] NVARCHAR(1000)
       ,[STATUS] NVARCHAR(1000)
       ,COMPANY NVARCHAR(1000)
       ,DEPARTMENT NVARCHAR(1000)
       ,SUB_DEPARTMENT NVARCHAR(1000)
       ,POSITION_CODE NVARCHAR(1000)
       ,POSITION_DESC NVARCHAR(1000)
       ,LOCATION NVARCHAR(1000)
       ,[COMMENCE_DATE] DATE
       ,[POSITION_START_DATE] DATE
       ,[POSITION_TERM_DATE] DATE
       ,TERM_DATE DATE
       ,TERMINATION_CODE NVARCHAR(1000)
       ,TERMINATION_REASON NVARCHAR(1000)
       ,PAYMENT_FREQUENCY NVARCHAR(1000)
       ,PAYMENT_METHOD NVARCHAR(1000)
       ,SYSTEM_NAME NVARCHAR(1000)
       ,SALARY DECIMAL(18,4)
       ,PWC_LATEST_JOB_ID NVARCHAR(1000)
       ,PWC_LASTEST_COMMENCE_DATE DATE
       ,PWC_EARLIEST_COMMENCE_DATE DATE
       ,PWC_EARLIEST_POSITION_START_DATE DATE
       ,PWC_LATEST_POSITION_START_DATE DATE
       ,PWC_LATEST_POSITION_END_DATE DATE
     )
     
     /*****************************************************************************************************
       07. CREATE EMPTY TABLES FOR PREP_EMP_LEAVE_TAKEN
     *****************************************************************************************************/
       
       CREATE TABLE [DBO].[PREP_EMP_LEAVE_TAKEN]
     (
       EMPLOYEE_ID  NVARCHAR(1000) NOT NULL
       ,JOB_ID NVARCHAR(1000) NOT NULL
       ,PAY_RUN_ID NVARCHAR(1000)
       ,PAY_PERIOD NVARCHAR(1000)
       ,PAY_YEAR NVARCHAR(1000)
       ,LINE_ID NVARCHAR(1000)
       ,PAYCODE_ID NVARCHAR(1000)
       ,PAYCODE_DESC NVARCHAR(1000)
       ,PAYSLIP_ID NVARCHAR(1000)
       ,LEAVE_TYPE NVARCHAR(1000)
       ,LEAVE_TYPE_DESC NVARCHAR(1000)
       ,LEAVE_SUB_TYPE NVARCHAR(1000)
       ,HOURS DECIMAL(18,4)
       ,AMOUNT DECIMAL(18,4)
       ,DESCRIPTION NVARCHAR(1000)
       ,SYSTEM_NAME NVARCHAR(1000)
       ,PAYRATE DECIMAL(18,4)
       ,START_DATE DATE
       ,END_DATE DATE
       ,DAYS DECIMAL(18,4)
     )USE [z'9bbaf92f-d960-4e33-a9cd-228c72cc97ef]
GO
           /****** Object:  StoredProcedure [dbo].[04.BLD_PAYROLL_TABLES]    Script Date: 4/10/2018 9:31:56 AM ******/
           SET ANSI_NULLS ON
           GO
           SET QUOTED_IDENTIFIER ON
           GO
           ALTER PROC [dbo].[04.BLD_PAYROLL_TABLES]
           AS
           
           /**********************************************************************************************************
           *                           DATA ASSURANCE                                                                *
           ***********************************************************************************************************
           UPDATES            - Version 0.1 {06/02/2015} {Simon Tsai} - {Creates the empty tables for Payroll 
           information}
           - Version 0.2 {06/02/2015} {Avideep Agarwal} - {Reviewed}
           - Version 0.3 {10/02/2015} {Simon Tsai} - {Created PREP_BANK_EFT}
           - Version 0.4 {10/02/2015} {Avideep Agarwal} - {Reviewed}
           - Version 0.5 {12/02/2015} {Simon Tsai} - {Added Payrate to Payslip detail}
           - Version 0.6 {03/03/2015} {Simon Tsai} - {Added Commentary}
           - Version 0.7 {17/08/2015} {Fei Li} - {Added pwc_duplicate_id in prep_payslip_details}
           - Version 0.8 {18/02/2016} {Fei Li} - {Added PWC_BSB_NUMBER ,PWC_ACCOUNT_NUMBER,PWC_ACCOUNT_NAME in PREP_BANK_EFT table}
           
           SCRIPT DESCRIPTION - {Creates the empty tables for Payroll information}
           
           TABLE INFORMATION
           INPUT TABLE(S)
           - N/A
           
           OUTPUT TABLE(S)
           - [DBO].[PREP_PAYSLIPS_HEADER]
           - [DBO].[PREP_PAYSLIP_DETAILS]
           - [DBO].[PREP_BANK_EFT]
           
           SUMMARY OF SCRIPT  - 01. DROP TABLE STATEMENT
           - 02. CREATE EMPTY TABLES FOR PREP_PAYSLIPS_HEADER
           - 03. CREATE EMPTY TABLES FOR PREP_PAYSLIPS_DETAILS
           - 04. CREATE EMPTY TABLES FOR PREP_BANK_EFT
           
           **********************************************************************************************************
           01. DROP TABLE STATEMENT
           *********************************************************************************************************/
           
           IF OBJECT_ID('PREP_PAYSLIPS_HEADER') IS NOT NULL
           DROP TABLE PREP_PAYSLIPS_HEADER
           
           IF OBJECT_ID('PREP_PAYSLIPS_DETAILS') IS NOT NULL
           DROP TABLE PREP_PAYSLIPS_DETAILS
           
           IF OBJECT_ID('PREP_BANK_EFT') IS NOT NULL
           DROP TABLE PREP_BANK_EFT
           
           /*********************************************************************************************************
           02. CREATE EMPTY TABLES FOR PREP_PAYSLIPS_HEADER
           *********************************************************************************************************/
           
           CREATE TABLE [DBO].[PREP_PAYSLIPS_HEADER]
           (
           EMPLOYEE_ID NVARCHAR(1000) NOT NULL
           ,PAY_RUN_ID NVARCHAR(1000) NOT NULL
           ,PAYSLIP_ID NVARCHAR(1000) NOT NULL
           ,[PAY_PERIOD] NVARCHAR(20)
           ,[PAY_YEAR] NVARCHAR(4)
           ,COMPANY NVARCHAR(1000)
           ,DEPARTMENT NVARCHAR(1000)
           ,PAYMENT_DATE DATE
           ,PAY_PERIOD_FROM DATE
           ,PAY_PERIOD_TO DATE
           ,REGULAR_HOURS DECIMAL(18,4)
           ,OVERTIME_HOURS DECIMAL(18,4)
           ,BASE_VALUE DECIMAL(18,4)
           ,OVERTIME_VALUE DECIMAL(18,4)
           ,ADDITIONS_BEFORE_TAX DECIMAL(18,4)
           ,GROSS DECIMAL(18,4)
           ,DEDUCTIONS_BEFORE_TAX DECIMAL(18,4)
           ,TAXABLE_INCOME DECIMAL(18,4)
           ,TAX DECIMAL(18,4)
           ,ADDITIONS_AFTER_TAX DECIMAL(18,4)
           ,DEDUCTIONS_AFTER_TAX DECIMAL(18,4)
           ,NET DECIMAL(18,4)
           ,SUPER DECIMAL(18,4)
           ,ACCRUED_LEAVE DECIMAL(18,4)
           ,AUTHORISED_BY NVARCHAR(1000)
           ,AUTHORISED_DATE DATE
           ,COMMENT NVARCHAR(1000)
           ,SYSTEM_NAME NVARCHAR(1000)
           ,PAYRATE_BASE DECIMAL(18,4)
           ,PAYRATE_OVERTIME DECIMAL(18,4)
           ,PWC_PAYRATE_BASE_MOVEMENT DECIMAL(18,4)
           ,PWC_PAYRATE_OVERTIME_MOVEMENT DECIMAL(18,4)
           ,PWC_NET_AMOUNT DECIMAL(18,4)
           ,PWC_GROSS_AMOUNT DECIMAL(18,4)
           )
           
           /*********************************************************************************************************
           03. CREATE EMPTY TABLES FOR PREP_PAYSLIPS_DETAILS
           *********************************************************************************************************/
           
           CREATE TABLE [DBO].[PREP_PAYSLIPS_DETAILS]
           (
           PWC_ID INT IDENTITY(1,1) NOT NULL	
           ,EMPLOYEE_ID NVARCHAR(1000) NOT NULL	
           ,JOB_ID NVARCHAR(1000)
           ,PAY_RUN_ID NVARCHAR(1000) NOT NULL
           ,[PAY_PERIOD] NVARCHAR(20)
           ,[PAY_YEAR] NVARCHAR(4)
           ,LINE_ID INT
           ,PAYCODE_ID NVARCHAR(1000)
           ,PAYCODE_DESC NVARCHAR(1000)
           ,PAYSLIP_ID NVARCHAR(1000)
           ,[PAY_TYPE] NVARCHAR(1000)
           ,[PAY_TYPE_DESC] NVARCHAR(1000)
           ,SUB_TYPE NVARCHAR(1000)
           ,[HOURS] DECIMAL(18,4)
           ,AMOUNT DECIMAL(18,4)
           ,COMPANY_AMOUNT DECIMAL(18,4)
           ,[DESCRIPTION] NVARCHAR(1000)
           ,SYSTEM_NAME NVARCHAR(1000)
           ,PAYRATE DECIMAL(18,4)
           ,[START_DATE] DATE
           ,[END_DATE] DATE
           ,PWC_DUPLICATE_FLAG INT
           ,PWC_DUPLICATE_ID NVARCHAR(1000)
           )
           
           /*********************************************************************************************************
           04. CREATE EMPTY TABLES FOR PREP_BANK_EFT
           *********************************************************************************************************/
           
           CREATE TABLE [DBO].[PREP_BANK_EFT]
           (
           [EMPLOYEE_ID] NVARCHAR(1000) NOT NULL
           ,[PAYGRP] NVARCHAR(1000) NOT NULL
           ,[PAYGRP_DESC] NVARCHAR(1000)
           ,[PAYPERNO] NVARCHAR(1000) NOT NULL
           ,[PAYPERYR] NVARCHAR(1000) NOT NULL
           ,[PERIOD_END_DATE] DATE
           ,[PAYMETHOD] NVARCHAR(1000)
           ,[PAYMETHOD_DESC] NVARCHAR(1000)
           ,[AMOUNT] DECIMAL(18,4)
           ,[NETPAY] DECIMAL(18,4)
           ,[CHEQUE_DATE] DATE
           ,[CHEQUE_NUMBER] NVARCHAR(1000)
           ,[ACCOUNT_NAME] NVARCHAR(1000)
           ,[ACCOUNT_NUMBER] NVARCHAR(1000)
           ,[BSB_NUMBER] NVARCHAR(1000)
           ,[BSB_NUMBER_DESC] NVARCHAR(1000)
           ,[DISBURSE_ID] NVARCHAR(1000) 
           ,[DISBURSE_DATE] DATE
           ,[REFERENCE] NVARCHAR(1000)
           ,SYSTEM_NAME NVARCHAR(1000)
           ,PWC_BSB_NUMBER NVARCHAR(1000)
           ,PWC_ACCOUNT_NUMBER NVARCHAR(1000)
           ,PWC_ACCOUNT_NAME NVARCHAR (1000)
           )USE [z'9bbaf92f-d960-4e33-a9cd-228c72cc97ef]
GO
/****** Object:  StoredProcedure [dbo].[05.BLD_REFERENCE_TABLES]    Script Date: 4/10/2018 9:32:23 AM ******/
  SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROC [dbo].[05.BLD_REFERENCE_TABLES]
AS

/************************************************************************************************************
  *                           DATA ASSURANCE                                                                  *
  *************************************************************************************************************
  UPDATES            - Version 0.1 {06/02/2015} {Simon Tsai} - {Creates the empty tables for REFERENCE 
    information}
- Version 0.2 {09/02/2015} {Simon Tsai} - {Updated the empty table for new REFERENCE TABLES}
- Version 0.3 {09/02/2015} {Avideep Agarwal} - {Reviewed}
- Version 0.4 {03/03/2015} {Simon Tsai} - {Added Commentary}
- Version 0.5 {11/08/2015} {Fei Li} - {Added REF_VAL_MASTER}
- Version 0.6 {13/08/2015} {Fei Li} - {Added REF_TEST_FIELD,REF_FIELD_MAPPING TABLES}
- Version 0.7 {28/08/2015} {Fei Li} - {Change PAY_CHECK to LEAVE_TYPE for REF_PAYTYPE table}
- Version 0.8 {15/10/2015} {Fei Li} - {Added Description field in REF_PAYTYPE table}

SCRIPT DESCRIPTION - {Creates the empty tables for REFERENCE information}

TABLE INFORMATION
INPUT TABLE(S)
- N/A

OUTPUT TABLE(S)
- [DBO].[REF_TRIAL_BALANCE]
- [DBO].[REF_PAYCODE]
- [DBO].[REF_PAYTYPE]
- [DBO].[REF_VAL_MASTER]
- [DBO].[REF_TEST_FIELD]
- [DBO].[REF_FIELD_MAPPING]

SUMMARY OF SCRIPT  - 01. DROP TABLE STATEMENT
- 02. CREATE EMPTY TABLES FOR REF_TRIAL_BALANCE
- 03. CREATE EMPTY TABLES FOR REF_PAYCODE
- 04. CREATE EMPTY TABLES FOR REF_PAYTYPE
- 05. CREATE EMPTY TABLES FOR REF_VAL_MASTER
- 06. CREATE EMPTY TABLES FOR REF_TEST_FIELD
- 07. CREATE EMPTY TABLES FOR REF_FIELD_MAPPING

************************************************************************************************************
  01. DROP TABLE STATEMENT
***********************************************************************************************************/
  
  IF OBJECT_ID('REF_TRIAL_BALANCE') IS NOT NULL
DROP TABLE REF_TRIAL_BALANCE

IF OBJECT_ID('REF_PAYCODE') IS NOT NULL
DROP TABLE REF_PAYCODE

IF OBJECT_ID('REF_PAYTYPE') IS NOT NULL
DROP TABLE REF_PAYTYPE

IF OBJECT_ID('REF_VAL_MASTER') IS NOT NULL
DROP TABLE REF_VAL_MASTER

IF OBJECT_ID('REF_TEST_FIELD') IS NOT NULL
DROP TABLE REF_TEST_FIELD

IF OBJECT_ID('REF_FIELD_MAPPING') IS NOT NULL
DROP TABLE REF_FIELD_MAPPING

/**********************************************************************************************************
  02. CREATE EMPTY TABLES FOR REF_TRIAL_BALANCE
**********************************************************************************************************/
  
  CREATE TABLE [DBO].[REF_TRIAL_BALANCE]
(
  [PWC_ID] INT IDENTITY(1,1) NOT NULL
  ,[GL_CODE] NVARCHAR(1000) NOT NULL
  ,[GL_DESC] NVARCHAR(1000) NOT NULL
  ,[GL_AMOUNT] DECIMAL(18,4)
)

/**********************************************************************************************************
  03. CREATE EMPTY TABLES FOR REF_PAYCODE
**********************************************************************************************************/
  
  CREATE TABLE [DBO].[REF_PAYCODE]
(
  [PWC_ID] INT IDENTITY(1,1) NOT NULL
  ,[CODE_TYPE] NVARCHAR(1000) NOT NULL
  ,[PAY_CODE] NVARCHAR(1000) NOT NULL
  ,[LEAVE_TYPE] NVARCHAR(1000)
  ,[Description] NVARCHAR(1000)
  ,[START_DATE] DATE
  ,[END_DATE] DATE
)

/**********************************************************************************************************
  04. CREATE EMPTY TABLES FOR REF_PAYTYPE
**********************************************************************************************************/
  
  CREATE TABLE [DBO].[REF_PAYTYPE]
(
  [PWC_ID] INT IDENTITY(1,1) NOT NULL
  ,[PAY_TYPE_CODE] NVARCHAR(1000) NOT NULL
  ,[DESCRIPTION] NVARCHAR(1000) NOT NULL
)


/**********************************************************************************************************
  05. CREATE EMPTY TABLES FOR VAL_MASTER
**********************************************************************************************************/
  
  CREATE TABLE [DBO].[REF_VAL_MASTER]
(
  [PWC_ID] INT IDENTITY(1,1) NOT NULL
  ,[EMPLOYEE_ID] NVARCHAR(1000) 
  ,[VAL_N_MASTER] INT 
  ,[VAL_N_ADDRESS] INT 
  ,[VAL_N_BANK] INT NOT NULL
  ,[VAL_N_CONTACT] INT 
  ,[VAL_N_EFT] INT 
  ,[VAL_N_HEADER] INT 
  ,[VAL_N_DETAIL] INT 
  ,[VAL_N_PAYSLIP_HEADER] INT
  ,[VAL_N_PAYSLIP_DETAIL] INT
  ,[VAL_NET_EFT] DECIMAL(18,4) 
  ,[VAL_NET_HEADER] DECIMAL(18,4)
  ,[VAL_BASE_HEADER] DECIMAL(18,4) 
  ,[VAL_BASE_DETAIL] DECIMAL(18,4) 
  ,[VAL_T_FLAG] NVARCHAR(1000) 
)

/**********************************************************************************************************
  06. CREATE EMPTY TABLES FOR REF_TEST_FIELD
**********************************************************************************************************/
  
  CREATE TABLE [DBO].[REF_TEST_FIELD]
(
  [PWC_ID] INT IDENTITY(1,1) NOT NULL
  ,[TEST_ID] NVARCHAR (1000)
  ,[CDM_TABLE_NAME] NVARCHAR (1000)
  ,[CDM_COLUMN_NAME] NVARCHAR (1000)
)

/**********************************************************************************************************
  07. CREATE EMPTY TABLES FOR REF_FIELD_MAPPING
**********************************************************************************************************/
  
  CREATE TABLE [DBO].[REF_FIELD_MAPPING]
(
  [PWC_ID] INT IDENTITY(1,1) NOT NULL
  ,[CDM_TABLE_NAME] NVARCHAR (1000)
  ,[CDM_COLUMN_NAME] NVARCHAR (1000)
  ,[INT_TABLE_NAME] NVARCHAR (1000)
  ,[INT_COLUMN_NAME] NVARCHAR (1000)
  ,[SOURCE_TABLE_NAME] NVARCHAR (1000)
  ,[SOURCE_COLUMN_NAME] NVARCHAR (1000)
)USE [z'9bbaf92f-d960-4e33-a9cd-228c72cc97ef]
GO
      /****** Object:  StoredProcedure [dbo].[05A.PREP_REF_TRIAL_BALANCE]    Script Date: 4/10/2018 9:32:48 AM ******/
      SET ANSI_NULLS ON
      GO
      SET QUOTED_IDENTIFIER ON
      GO
      ALTER PROC [dbo].[05A.PREP_REF_TRIAL_BALANCE]
      AS
      
      /***************************************************************************************************************
      *                           DATA ASSURANCE                                                                     *
      ****************************************************************************************************************
      UPDATES            - Version 0.1 {09/02/2015} {Simon Tsai} - {Creates the empty tables for TRIAL BALANCE 
      information}
      - Version 0.2 {09/02/2015} {Avideep Agarwal} - {Reviewed}
      - Version 0.3 {12/02/2015} {Avideep Agarwal} - {Added Truncate table statement}
      - Version 0.4 {03/03/2015} {Simon Tsai} - {Added Commentary}
      
      SCRIPT DESCRIPTION - {Creates the empty tables for TRIAL 
      BALANCE informati}
      
      TABLE INFORMATION
      INPUT TABLE(S)
      - N/A
      
      OUTPUT TABLE(S)
      - [DBO].[REF_TRIAL_BALANCE]
      
      SUMMARY OF SCRIPT  - 01. TRUNCATE TABLE
      - 02. INSERT DATA
      - 03. CREATE INDEX ON TABLE
      
      ***************************************************************************************************************
      01. TRUNCATE TABLE
      **************************************************************************************************************/
      
      TRUNCATE TABLE [REF_TRIAL_BALANCE]
      
      /**************************************************************************************************************
      02. INSERT DATA
      **************************************************************************************************************/
      
      USE [z'9bbaf92f-d960-4e33-a9cd-228c72cc97ef]
GO
/****** Object:  StoredProcedure [dbo].[05B.PREP_REF_PAYCODE]    Script Date: 4/10/2018 9:33:12 AM ******/
  SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROC [dbo].[05B.PREP_REF_PAYCODE]
AS

/*********************************************************************************************************
  *                           DATA ASSURANCE                                                               *
  **********************************************************************************************************
  UPDATES            - Version 0.1 {06/02/2015} {Simon Tsai}		-	{Creates the empty tables for PAYCODE 
    information}
- Version 0.2 {09/02/2015} {Avideep Agarwal} -	{Reviewed}
- Version 0.3 {12/02/2015} {Avideep Agarwal} -	{Added Truncate table statement}
- Version 0.4 {03/03/2015} {Simon Tsai}      -	{Added Commentary}
- Version 0.5 {03/08/2015} {Fei A Li}        -	{Replace description by Paycheck}
- Version 0.6 {28/08/2015} {Fei A Li}        -	{Change PAY_CHECK to LEAVE_TYPE and added index for leave type}
- Version 0.7 {15/10/2015} {Fei A Li}        -	{Added description field}

SCRIPT DESCRIPTION - {Creates the empty tables for PAYCODE information}

TABLE INFORMATION
INPUT TABLE(S)
- N/A

OUTPUT TABLE(S)
- [DBO].[REF_PAYCODE]

SUMMARY OF SCRIPT  - 01. TRUNCATE TABLE
- 02. INSERT DATA
- 03. CREATE INDEX ON TABLE

**********************************************************************************************************
  01. TRUNCATE TABLE
*********************************************************************************************************/
  
  TRUNCATE TABLE [REF_PAYCODE]

/*********************************************************************************************************
  02. INSERT DATA
*********************************************************************************************************/
  
  INSERT INTO [DBO].[REF_PAYCODE]
(
  [Code_Type]
  ,[Pay_Code]
  ,[Leave_Type]
  ,[Description]
  --,[START_DATE]
  --,[END_DATE]
)

SELECT DISTINCT
ISNULL(LTRIM(RTRIM([PWC_PAYCODE_Type])),'UNKNOWN')									AS [Code_Type]
,ISNULL(LTRIM(RTRIM(CLI_PAYCODE_ID)),'UNKNOWN')									AS [Pay_Code]
,LTRIM(RTRIM(PWC_LEAVE_TYPE))													AS [Leave_Type]
,LTRIM(RTRIM(CLI_PAYCODE_DESC))													AS [Description]
--,'PWC_UNKNOWN'																AS [START_DATE]	
--,'PWC_UNKNOWN'																AS [END_DATE]		   	
FROM
[Interface].[PAYCODE_MAPPING]


/*********************************************************************
  03. CREATE INDEX ON TABLE
**********************************************************************/
  CREATE INDEX [ID_CODE_TYPE]
ON [REF_PAYCODE] (
  [Code_Type]
)

CREATE INDEX [ID_Pay_Code]
ON [REF_PAYCODE] (
  [Pay_Code]
)

CREATE INDEX [ID_LEAVE_TYPE]
ON [REF_PAYCODE] (
  [Leave_Type]
)USE [z'9bbaf92f-d960-4e33-a9cd-228c72cc97ef]
GO
      /****** Object:  StoredProcedure [dbo].[05C.PREP_REF_PAYTYPE]    Script Date: 4/10/2018 9:34:35 AM ******/
      SET ANSI_NULLS ON
      GO
      SET QUOTED_IDENTIFIER ON
      GO
      ALTER PROC [dbo].[05C.PREP_REF_PAYTYPE]
      AS
      
      /********************************************************************************************************
      *                           DATA ASSURANCE                                                              *
      *********************************************************************************************************
      UPDATES            - Version 0.1 {06/02/2015} {Simon Tsai} - {Creates the empty tables for PAYTYPE 
      information}
      - Version 0.2 {09/02/2015} {Avideep Agarwal} - {Reviewed}
      - Version 0.3 {12/02/2015} {Avideep Agarwal} - {Added Truncate table statement}
      - Version 0.4 {03/03/2015} {Simon Tsai} - {Added Commentary}
      
      SCRIPT DESCRIPTION - {Creates the empty tables for PAYTYPE information}
      
      TABLE INFORMATION
      INPUT TABLE(S)
      - N/A
      
      OUTPUT TABLE(S)
      - [DBO].[REF_PAYTYPE]
      
      SUMMARY OF SCRIPT  - 01. TRUNCATE TABLE
      - 02. INSERT DATA
      - 03. CREATE INDEX ON TABLE
      
      ********************************************************************************************************
      01. TRUNCATE TABLE
      *******************************************************************************************************/
      USE [z'9bbaf92f-d960-4e33-a9cd-228c72cc97ef]
GO
/****** Object:  StoredProcedure [dbo].[05D.BLD_REF_PARAMETERS]    Script Date: 4/10/2018 9:34:59 AM ******/
  SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROC [dbo].[05D.BLD_REF_PARAMETERS]
AS

/**********************************************************************************************************
  *                           DATA ASSURANCE                                                                *
  ***********************************************************************************************************
  UPDATES            - Version 0.1 {12/02/2015} {Avideep Agarwal} - {Notes}
- Version 0.2 {03/03/2015} {Simon Tsai} - {Added Commentary}
- Version 0.3 {22/02/2016} {Fei Li} - {Added 'Test' in the list of invalid name test}

SCRIPT DESCRIPTION - {Create parameters table}

SUMMARY OF SCRIPT  - 01. DROP TABLE STATEMENT
- 02. CREATE TABLE STATEMENT
- 03. INSERT DATA (NOTE: USER DEFINED LIST BELOW)

***********************************************************************************************************
  DROP TABLE STATEMENT
**********************************************************************************************************/
  
  IF OBJECT_ID('REF_PARAMETERS') IS NOT NULL
DROP TABLE [REF_PARAMETERS]

/*********************************************************************************************************
  02. CREATE TABLE STATEMENT
*********************************************************************************************************/
  
  CREATE TABLE [DBO].[REF_PARAMETERS]
(
  [PWC_ID] INT IDENTITY(1, 1)  NOT NULL
  ,[PARAMETER_ID] NVARCHAR(MAX) NOT NULL
  ,[VALUE] NVARCHAR(MAX) NOT NULL
)

/*********************************************************************************************************
  03. INSERT DATA
NOTE: This list is to be maintained for each client as the expected 
*********************************************************************************************************/
  
  INSERT INTO dbo.REF_PARAMETERS(Parameter_ID, Value) VALUES('Employee_Name','Cash')
INSERT INTO dbo.REF_PARAMETERS(Parameter_ID, Value) VALUES('Employee_Name','Cheque')
INSERT INTO dbo.REF_PARAMETERS(Parameter_ID, Value) VALUES('Employee_Name','Purchase')
INSERT INTO dbo.REF_PARAMETERS(Parameter_ID, Value) VALUES('Employee_Name','Do not use')
INSERT INTO dbo.REF_PARAMETERS(Parameter_ID, Value) VALUES('Employee_Name','Don’t Use')
INSERT INTO dbo.REF_PARAMETERS(Parameter_ID, Value) VALUES('Employee_Name','Dont use')
INSERT INTO dbo.REF_PARAMETERS(Parameter_ID, Value) VALUES('Employee_Name','Not to be Used')
INSERT INTO dbo.REF_PARAMETERS(Parameter_ID, Value) VALUES('Employee_Name','Error')
INSERT INTO dbo.REF_PARAMETERS(Parameter_ID, Value) VALUES('Employee_Name','Check')
INSERT INTO dbo.REF_PARAMETERS(Parameter_ID, Value) VALUES('Employee_Name','Test')
INSERT INTO dbo.REF_PARAMETERS(Parameter_ID, Value) VALUES('Payslip_Rnd_Amt_Div','100')
INSERT INTO dbo.REF_PARAMETERS(Parameter_ID, Value) VALUES('Payslip_Rnd_Amt_Min','100')USE [z'9bbaf92f-d960-4e33-a9cd-228c72cc97ef]
                                                                                            GO
                                                                                            /****** Object:  StoredProcedure [dbo].[06.PREP_EMP_BANK_ACCOUNT]    Script Date: 4/10/2018 9:35:29 AM ******/
                                                                                            SET ANSI_NULLS ON
                                                                                            GO
                                                                                            SET QUOTED_IDENTIFIER ON
                                                                                            GO
                                                                                            ALTER PROC [dbo].[06.PREP_EMP_BANK_ACCOUNT]
                                                                                            AS
                                                                                            
                                                                                            /************************************************************************************************************
                                                                                            *                           DATA ASSURANCE                                                                  *
                                                                                            *************************************************************************************************************
                                                                                            UPDATES            - Version 0.1 {05/02/2015} {Simon Tsai} - {Populate the EMP_BANK_ACCOUNT table with data}
                                                                                            - Version 0.2 {06/02/2015} {Avideep Agarwal} - {Reviewed}
                                                                                            - Version 0.3 {09/02/2015} {Avideep Agarwal} - {Added indexes}
                                                                                            - Version 0.4 {12/02/2015} {Avideep Agarwal} - {Added Truncate table statement}
                                                                                            - Version 0.5 {03/03/2015} {Simon Tsai} - {Added Commentary}
                                                                                            
                                                                                            SCRIPT DESCRIPTION - {Populate the EMP_BANK_ACCOUNT table with data}
                                                                                            
                                                                                            TABLE INFORMATION
                                                                                            INPUT TABLE(S)
                                                                                            - [INTERFACE].[Disbursements]
                                                                                            - [DBO].[PREP_EMP_BANK_ACCOUNT]
                                                                                            
                                                                                            UPDATE OUTPUT TABLE(S)
                                                                                            - [DBO].[PREP_EMP_BANK_ACCOUNT]
                                                                                            
                                                                                            SUMMARY OF SCRIPT  - 01. TRUNCATE TABLE
                                                                                            - 02. INSERT DATA
                                                                                            - 03. CLEANSE DATA TO POPULATE PWC_ FIELDS
                                                                                            - 04. CREATE INDEX ON TABLE
                                                                                            
                                                                                            
                                                                                            *************************************************************************************************************
                                                                                            01. TRUNCATE TABLE
                                                                                            ************************************************************************************************************/
                                                                                            
                                                                                            TRUNCATE TABLE [PREP_EMP_BANK_ACCOUNT]
                                                                                            
                                                                                            
                                                                                            
                                                                                            
                                                                                            /************************************************************************************************************
                                                                                            02. INSERT DATA
                                                                                            ************************************************************************************************************/
                                                                                            
                                                                                            INSERT INTO [DBO].[PREP_EMP_BANK_ACCOUNT]
                                                                                            (
                                                                                            [EMPLOYEE_ID]
                                                                                            ,[SYSTEM_NAME] 
                                                                                            ,[BSB_NUMBER] 
                                                                                            ,[ACCOUNT_NUMBER]
                                                                                            ,[ACCOUNT_NAME]
                                                                                            )
                                                                                            
                                                                                            
                                                                                            SELECT DISTINCT
                                                                                            LTRIM(RTRIM([EMPLOYEE_ID]))						AS [EMPLOYEE_ID]
                                                                                            ,LTRIM(RTRIM([SYSTEM_NAME]))						AS [SYSTEM_NAME]
                                                                                            ,LTRIM(RTRIM([BSB_NUMBER]))						AS [BSB_NUMBER]
                                                                                            ,LTRIM(RTRIM([ACCOUNT_NUMBER]))				    AS [ACCOUNT_NUMBER]
                                                                                            ,LTRIM(RTRIM([ACCOUNT_NAME]))					AS [ACCOUNT_NAME]
                                                                                            
                                                                                            
                                                                                            FROM
                                                                                            [Interface].[EMPLOYEE_BANK_DETAILS]
                                                                                            WHERE
                                                                                            ISNULL(ISNULL([ACCOUNT_NUMBER],'') + ISNULL([BSB_NUMBER],''),'') <> ''
                                                                                            
                                                                                            /************************************************************************************************************
                                                                                            03. CLEANSE DATA TO POPULATE PWC_ FIELDS
                                                                                            USERS ARE NOT REQUIRED TO CHANGE ANY OF THE DATA BELOW
                                                                                            ************************************************************************************************************/
                                                                                            
                                                                                            UPDATE [DBO].[PREP_EMP_BANK_ACCOUNT]
                                                                                            SET PWC_BSB_NUMBER = RIGHT('000000000000000'+dbo.fn_StripCharacters(BSB_NUMBER, '^0-9'),15)
                                                                                            ,PWC_ACCOUNT_NUMBER = RIGHT('00000000000000000000'+dbo.fn_StripCharacters(ACCOUNT_NUMBER, '^0-9'),20)
                                                                                            ,PWC_ACCOUNT_NAME = dbo.fn_StripCharacters(ACCOUNT_NAME, '^a-z0-9 ')
                                                                                            
                                                                                            
                                                                                            
                                                                                            /************************************************************************************************************
                                                                                            04. CREATE INDEX ON TABLE
                                                                                            USERS ARE NOT REQUIRED TO CHANGE ANY OF THE DATA BELOW
                                                                                            ************************************************************************************************************/
                                                                                            
                                                                                            CREATE INDEX [ID_EMPLOYEE_ID]
                                                                                            ON [PREP_EMP_BANK_ACCOUNT] (
                                                                                            EMPLOYEE_ID
                                                                                            )
                                                                                            
                                                                                            --CREATE INDEX [ID_SYSTEM_NAME]
                                                                                            --ON [PREP_EMP_BANK_ACCOUNT] (
                                                                                            --	SYSTEM_NAME
                                                                                            --)
                                                                                            
                                                                                            CREATE INDEX [ID_PWC_BSB_NUMBER]
                                                                                            ON [PREP_EMP_BANK_ACCOUNT] (
                                                                                            PWC_BSB_NUMBER
                                                                                            )
                                                                                            
                                                                                            CREATE INDEX [ID_PWC_ACCOUNT_NUMBER]
                                                                                            ON [PREP_EMP_BANK_ACCOUNT] (
                                                                                            PWC_ACCOUNT_NUMBER
                                                                                            )
                                                                                            
                                                                                            CREATE INDEX [ID_PWC_ACCOUNT_NAME]
                                                                                            ON [PREP_EMP_BANK_ACCOUNT] (
                                                                                            PWC_ACCOUNT_NAME
                                                                                            )USE [z'9bbaf92f-d960-4e33-a9cd-228c72cc97ef]
GO
/****** Object:  StoredProcedure [dbo].[07.PREP_EMP_ADDRESS]    Script Date: 4/10/2018 9:35:51 AM ******/
  SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROC [dbo].[07.PREP_EMP_ADDRESS]
AS

/*******************************************************************************************************
  *                           DATA ASSURANCE                                                             *
  ********************************************************************************************************
  UPDATES            - Version 0.1 {05/02/2015} {Simon Tsai} - {Populate the EMP_ADDRESS table with data}
- Version 0.2 {09/02/2015} {Simon Tsai} - {Created index on table}
- Version 0.3 {10/02/2015} {Avideep Agarwal} - {Add address cleansing and reviewed}
- Version 0.4 {12/02/2015} {Avideep Agarwal} - {Added Truncate table statement}
- Version 0.5 {03/03/2015} {Simon Tsai} - {Added Commentary)

SCRIPT DESCRIPTION - {Populate the EMP_ADDRESS table with data}

TABLE INFORMATION
INPUT TABLE(S)
- [INTERFACE].[Employee Data]
- [DBO].[PREP_EMP_ADDRESS]

UPDATE OUTPUT TABLE(S)
- [DBO].[PREP_EMP_ADDRESS]

SUMMARY OF SCRIPT  - 01. TRUNCATE TABLE
- 02. CREATE CTE TO GET ADDRESS3
- 03. CREATE CTE TO GET ADDRESS_POST3
- 04. CREATE CTE TO GET EITHER ADDRESS3 OR ADDRESS_POST3 DEPENDING ON WHICH IS NOT 
NULL
- 05. INSERT DATA
- 06. CREATE INDEX ON TABLE

********************************************************************************************************
  01. TRUNCATE TABLE
*******************************************************************************************************/
  
  TRUNCATE TABLE PREP_EMP_ADDRESS



/*******************************************************************************************************
  02. CREATE CTE TO GET ADDRESS3
*******************************************************************************************************/
  /*******************************************************************************************************
  05. INSERT DATA
*******************************************************************************************************/
  
  INSERT INTO [dbo].[PREP_EMP_ADDRESS]
(
  [EMPLOYEE_ID]
  ,[ADDRESS_TYPE]
  ,[ADDRESS_1]
  ,[ADDRESS_2]
  ,[ADDRESS_3]
  --	,[ADDRESS_4]
  ,[UNIT_NUMBER]
  --	,[STREET_NUMBER]
  --	,[STREET_NAME]
  ,[CITY]
  ,[STATE]
  ,[POSTCODE]
  ,[COUNTRY]
  ,[SYSTEM_NAME]
  ,[PWC_TOTAL_ADDRESS]
)


SELECT
[EMPLOYEE_ID]													AS [EMPLOYEE_ID]
,[ADDRESS_TYPE]													AS [ADDRESS_TYPE]
,[ADDRESS_1]														AS [ADDRESS_1]
,[ADDRESS_2]														AS [ADDRESS_2]
,[ADDRESS_3]														AS [ADDRESS_3]
--	,[ADDRESS_4]													AS [ADDRESS_4]
,[UNIT_NUMBER]													AS [UNIT_NUMBER]
--	,[STREET_NUMBER]												AS [STREET_NUMBER]
--	,[STREET_NAME]													AS [STREET_NAME]
,[CITY]															AS [CITY]
,[STATE]															AS [STATE]
,[POSTCODE]														AS [POSTCODE]
,[COUNTRY]														AS [COUNTRY]
,[SYSTEM_NAME]													AS [SYSTEM_NAME]
,BIA.CleanAddress(RTRIM(LTRIM(ISNULL([ADDRESS_1], ''))) + ' ' +
                    RTRIM(LTRIM(ISNULL([CITY], ''))) + ' ' +
                    RTRIM(LTRIM(ISNULL([STATE], ''))) + ' ' +
                    RTRIM(LTRIM(ISNULL([POSTCODE], ''))))			AS [PWC_TOTAL_ADDRESS]

FROM
[Interface].[EMPLOYEE_ADDRESS] AS ED
WHERE
RTRIM(LTRIM(ISNULL([ADDRESS_1], ''))) + RTRIM(LTRIM(ISNULL([CITY], ''))) <> ''





/*******************************************************************************************************
  06. CREATE INDEX ON TABLE
*******************************************************************************************************/
  
  CREATE INDEX [ID_EMPLOYEE_ID]
ON [PREP_EMP_ADDRESS] (
  EMPLOYEE_ID
)

CREATE INDEX [ID_SYSTEM_NAME]
ON [PREP_EMP_ADDRESS] (
  SYSTEM_NAME
)

CREATE INDEX [ID_PWC_TOTAL_ADDRESS]
ON [PREP_EMP_ADDRESS] (
  PWC_TOTAL_ADDRESS
)USE [z'9bbaf92f-d960-4e33-a9cd-228c72cc97ef]
GO
      /****** Object:  StoredProcedure [dbo].[08.PREP_EMP_NUMBER]    Script Date: 4/10/2018 9:36:12 AM ******/
      SET ANSI_NULLS ON
      GO
      SET QUOTED_IDENTIFIER ON
      GO
      ALTER PROC [dbo].[08.PREP_EMP_NUMBER]
      AS
      
      /******************************************************************************************************
      *                           DATA ASSURANCE                                                            *
      *******************************************************************************************************
      UPDATES            - Version 0.1 {13/11/2014} {Simon Tsai} - {Creates the empty tables for Employee 
      information}
      - Version 0.2 {06/02/2015} {Avideep Agarwal} - {Reviewed}
      - Version 0.3 {12/02/2015} {Avideep Agarwal} - {Added Truncate table statement}
      - Version 0.4 {03/03/2015} {Simon Tsai} - {Added Commentary)
      
      SCRIPT DESCRIPTION - {Creates the empty tables for Employee information}
      
      TABLE INFORMATION
      INPUT TABLE(S)
      - N/A
      
      OUTPUT TABLE(S)
      - [DBO].[PREP_EMP_NUMBER]
      
      SUMMARY OF SCRIPT  - 01. TRUNCATE TABLE
      - 02. INSERT DATA - JOIN THE DIFFERENT TYPES OF CONTACT NUMBERS TOGETHER
      - 03. CLEANSE DATA TO POPULATE PWC_ FIELDS
      - 04. CREATE INDEX ON TABLE
      
      *******************************************************************************************************
      01. TRUNCATE TABLE
      ******************************************************************************************************/
      
      TRUNCATE TABLE [PREP_EMP_NUMBER]
      
      /******************************************************************************************************
      02. INSERT DATA - JOIN THE DIFFERENT TYPES OF CONTACT NUMBERS TOGETHER
      ******************************************************************************************************/
      
      INSERT INTO [DBO].[PREP_EMP_NUMBER]
      (
      [EMPLOYEE_ID]
      ,[CONTACT_TYPE]
      ,[NUMBER]
      ,[SYSTEM_NAME]
      )
      
      
      SELECT 
      [EMPLOYEE_ID]														    AS [EMPLOYEE_ID]
      ,[CONTACT_TYPE]															AS [CONTACT_TYPE]
      ,[NUMBER]																AS [NUMBER]
      ,[SYSTEM_NAME]			 												AS [SYSTEM_NAME]
      FROM [Interface].[EMPLOYEE_CONTACT_DETAILS]
      --WHERE NOT ISNULL([MOBILE_NUMBER],'') = '' AND NOT [MOBILE_NUMBER] = '0'
      --UNION ALL
      --SELECT 
      
      --    [CONTACT_TYPE]															AS [CONTACT_TYPE]
      --   ,[NUMBER]																AS [NUMBER]
      --   ,[SYSTEM_NAME]			 												AS [SYSTEM_NAME]
      --FROM [Interface].[EMPLOYEE_CONTACT_DETAILS]
      --WHERE NOT ISNULL([HOME_NUMBER],'') = '' AND NOT [HOME_NUMBER] = '0'
      
      
      
      /******************************************************************************************************
      03. CLEANSE DATA TO POPULATE PWC_ FIELDS
      ******************************************************************************************************/
      
      UPDATE [DBO].[PREP_EMP_NUMBER]
      SET PWC_CONTACT_NUMBER = dbo.fn_StripCharacters(NUMBER, '^0-9')
      ,PWC_CONTACT_NUMBER_TYPE = CONTACT_TYPE
      
      DELETE FROM [DBO].[PREP_EMP_NUMBER]
      WHERE PWC_CONTACT_NUMBER IS NULL
      OR LEN(PWC_CONTACT_NUMBER) <= 6
      
      
      
      
      
      
      /******************************************************************************************************
      04. CREATE INDEX ON TABLE
      ******************************************************************************************************/
      
      CREATE INDEX [ID_EMPLOYEE_ID]
      ON [PREP_EMP_NUMBER] (
      EMPLOYEE_ID
      )
      
      CREATE INDEX [ID_PWC_CONTACT_NUMBER]
      ON [PREP_EMP_NUMBER] (
      PWC_CONTACT_NUMBER
      )USE [z'9bbaf92f-d960-4e33-a9cd-228c72cc97ef]
GO
/****** Object:  StoredProcedure [dbo].[09.PREP_EMP_POSITION_HISTORY]    Script Date: 4/10/2018 9:36:33 AM ******/
  SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROC [dbo].[09.PREP_EMP_POSITION_HISTORY]
AS

/****************************************************************************************************************
  *                           DATA ASSURANCE                                                                      *
  *****************************************************************************************************************
  UPDATES            - Version 0.1 {06/02/2015} {Simon Tsai} - {Creates the empty tables for POSITION 
    HISTORY information}
- Version 0.2 {09/02/2015} {Avideep Agarwal} - {Reviewed}
- Version 0.3 {12/02/2015} {Avideep Agarwal} - {Added Truncate table statement}
- Version 0.4 {03/03/2015} {Simon Tsai} - {Added Commentary)

SCRIPT DESCRIPTION - {Creates the empty tables for POSITION HISTORY information}

TABLE INFORMATION
INPUT TABLE(S)
- N/A

OUTPUT TABLE(S)
- [DBO].[PREP_EMP_POSITION_HISTORY]

SUMMARY OF SCRIPT  - 01. TRUNCATE TABLE
- 02. INSERT DATA
- 03. CREATE INDEX ON TABLE
/****************
  *****************************************************************************************************************
  01. TRUNCATE TABLE
****************************************************************************************************************/
  
  TRUNCATE TABLE [PREP_EMP_POSITION_HISTORY]

/****************************************************************************************************************
  02. INSERT DATA
IF THE DATE FIELDS HAPPENS TO BE SYSTEM DEFAULT FIELDS - '1. Default system date' THEN IGNORE IT AND SET AS NULL
****************************************************************************************************************/
  
  INSERT INTO [DBO].[PREP_EMP_POSITION_HISTORY]
(
  [EMPLOYEE_ID]
  ,[JOB_ID]
  ,[TYPE]
  ,[STATUS]
  ,[COMPANY] 
  ,[DEPARTMENT] 
  ,[SUB_DEPARTMENT]
  ,[POSITION_CODE]
  ,[POSITION_DESC] 
  ,[LOCATION]
  ,[COMMENCE_DATE] 
  ,[POSITION_START_DATE]
  ,[POSITION_TERM_DATE] 
  ,[TERM_DATE] 
  ,[TERMINATION_CODE]
  ,[TERMINATION_REASON]
  ,[PAYMENT_FREQUENCY]
  ,[PAYMENT_METHOD]
  ,[SYSTEM_NAME]
  ,[SALARY]
)
SELECT 
LTRIM(RTRIM([EMPLOYEE_ID]))																AS [EMPLOYEE_ID]
,LTRIM(RTRIM([JOB_ID]))																	AS [JOB_ID]
,LTRIM(RTRIM([TYPE]))																		AS [TYPE]
,LTRIM(RTRIM([STATUS]))																	AS [STATUS]
,LTRIM(RTRIM([COMPANY]))																	AS [COMPANY]
,LTRIM(RTRIM([DEPARTMENT]))																AS [DEPARTMENT]
,LTRIM(RTRIM([SUB_DEPARTMENT]))															AS [SUB_DEPARTMENT]
,LTRIM(RTRIM([POSITION_CODE]))															AS [POSITION_CODE]
,LTRIM(RTRIM([POSITION_DESC]))															AS [POSITION_DESC]
,LTRIM(RTRIM([LOCATION]))																	AS [LOCATION]
,CONVERT(DATE,LTRIM(RTRIM([COMMENCE_DATE])),103)											AS [COMMENCE_DATE]
,CONVERT(DATE,LTRIM(RTRIM([POSITION_START_DATE])),103)									AS [POSITION_START_DATE]
,CONVERT(DATE,LTRIM(RTRIM([POSITION_START_DATE])),103)									AS [POSITION_TERM_DATE]
,CONVERT(DATE,LTRIM(RTRIM([TERM_DATE])),103)												AS [TERM_DATE]
,LTRIM(RTRIM([TERMINATION_CODE]))															AS [TERMINATION_CODE]
,LTRIM(RTRIM([TERMINATION_REASON]))														AS [TERMINATION_REASON]
,LTRIM(RTRIM([PAYMENT_FREQUENCY]))														AS [PAYMENT_FREQUENCY]
,LTRIM(RTRIM([PAYMENT_METHOD]))															AS [PAYMENT_METHOD]
,LTRIM(RTRIM([SYSTEM_NAME]))																AS [SYSTEM_NAME]
,LTRIM(RTRIM([SALARY]))																	AS [SALARY]
FROM [Interface].[EMPLOYEE_POSITION_HISTORY]


/****************************************************************************************************************
  03. CREATE INDEX ON TABLE
****************************************************************************************************************/
  
  CREATE INDEX [ID_EMPLOYEE_ID]
ON [PREP_EMP_POSITION_HISTORY] (
  EMPLOYEE_ID
)

CREATE INDEX [ID_SYSTEM_NAME]
ON [PREP_EMP_POSITION_HISTORY] (
  SYSTEM_NAME
)

CREATE INDEX [ID_JOB_ID]
ON [PREP_EMP_POSITION_HISTORY] (
  JOB_ID
)

************************/USE [z'9bbaf92f-d960-4e33-a9cd-228c72cc97ef]
                              GO
                              /****** Object:  StoredProcedure [dbo].[10.PREP_EMP_MASTER]    Script Date: 4/10/2018 9:36:59 AM ******/
                              SET ANSI_NULLS ON
                              GO
                              SET QUOTED_IDENTIFIER ON
                              GO
                              ALTER PROC [dbo].[10.PREP_EMP_MASTER]
                              AS
                              
                              /******************************************************************************************************
                              *                           DATA ASSURANCE                                                            *
                              *******************************************************************************************************
                              UPDATES            - Version 0.1 {05/02/2015} {Simon Tsai} - {Creates the empty tables for MASTER 
                              Employee information}
                              - Version 0.2 {09/02/2015} {Avideep Agarwal} - {Reviewed}
                              - Version 0.3 {12/02/2015} {Avideep Agarwal} - {Added Truncate table statement}
                              - Version 0.4 {03/03/2015} {Simon Tsai} - {Added Commentary}
                              - Version 0.5 {19/08/2015} {Fei Li} - {Status flag}
                              
                              
                              SCRIPT DESCRIPTION - {Creates the empty tables for MASTER 
                              Employee information}
                              
                              TABLE INFORMATION
                              INPUT TABLE(S)
                              - N/A
                              
                              OUTPUT TABLE(S)
                              - [DBO].[PREP_EMP_MASTER]
                              
                              SUMMARY OF SCRIPT  - 00. DECLARE VARIABLES
                              - 01. TRUNCATE TABLE
                              - 02. INSERT DATA
                              - 06. CREATE INDEX ON TABLE
                              
                              *******************************************************************************************************
                              00. DECLARE VARIABLES
                              ******************************************************************************************************/
                              DECLARE @V_START NVARCHAR(1000),
                              @V_END NVARCHAR(1000),
                              @C_STATUS NVARCHAR(1000);
                              
                              SELECT	@C_STATUS=[COLUMN_NAME] 
                              FROM 
                              [INFORMATION_SCHEMA].[COLUMNS]
                              WHERE 
                              [TABLE_NAME]='EMPLOYEE_MASTER' AND [COLUMN_NAME] LIKE '%STATUS%' ;
                              SELECT @V_START=[Value] 
                              FROM 
                              [Store].[Setting]
                              WHERE 
                              [KEY] ='AUDIT_PERIOD_START';
                              SELECT @V_END=[Value] 
                              FROM 
                              [Store].[Setting]
                              WHERE [KEY] ='AUDIT_PERIOD_END';
                              
                              /*******************************************************************************************************
                              01. TRUNCATE TABLE
                              ******************************************************************************************************/
                              
                              TRUNCATE TABLE [DBO].[PREP_EMP_MASTER]
                              
                              
                              /******************************************************************************************************
                              02. INSERT DATA
                              ******************************************************************************************************/
                              
                              INSERT INTO [DBO].[PREP_EMP_MASTER]
                              (
                              [EMPLOYEE_ID] 
                              ,[SURNAME] 
                              ,[FIRST_NAME] 
                              ,[SECOND_NAME] 
                              ,[THIRD_NAME] 
                              ,[FOURTH_NAME]
                              ,[INITIAL]
                              ,[COMPANY] 
                              ,[DEPARTMENT] 
                              ,[SUB_DEPARTMENT] 
                              ,[POSITION] 
                              ,[LOCATION] 
                              ,[TYPE] 
                              ,[STATUS] 
                              ,[START_DATE] 
                              ,[TERM_DATE]
                              ,[TERM_REASON] 
                              ,[DOB]
                              ,[GENDER] 
                              ,[SYSTEM_NAME]
                              )
                              SELECT LTRIM(RTRIM(MULTIPLE_ENTRIES.[EMPLOYEE_ID]))				AS [EMPLOYEE_ID]
                              ,LTRIM(RTRIM([SURNAME]))										AS [SURNAME]
                              ,LTRIM(RTRIM([FIRST_NAME]))									AS [FIRST_NAME] 
                              ,LTRIM(RTRIM([SECOND_NAME]))									AS [SECOND_NAME]
                              ,LTRIM(RTRIM([THIRD_NAME]))									AS [THIRD_NAME]
                              ,LTRIM(RTRIM([FOURTH_NAME]))									AS [FOURTH_NAME]
                              ,LTRIM(RTRIM([INITIAL]))										AS [INITIAL] 
                              ,LTRIM(RTRIM([COMPANY]))										AS [COMPANY] 
                              ,LTRIM(RTRIM([DEPARTMENT]))									AS [DEPARTMENT] 
                              ,LTRIM(RTRIM([SUB_DEPARTMENT]))								AS [SUB_DEPARTMENT]
                              ,LTRIM(RTRIM([POSITION]))									AS [POSITION]
                              ,LTRIM(RTRIM([LOCATION]))									AS [LOCATION]
                              ,LTRIM(RTRIM([TYPE]))										AS [TYPE]
                              ,CASE WHEN [STATUS] IS NOT NULL  
                              THEN LTRIM(RTRIM([STATUS]))
                              WHEN [STATUS] IS NULL AND [START_DATE] IS NOT NULL AND [TERM_DATE] IS NOT NULL AND
                              CONVERT(DATE,[TERM_DATE],103)<@V_END
                              THEN 'INACTIVE'
                              WHEN [STATUS] IS NULL AND [START_DATE] IS NOT NULL AND [TERM_DATE] IS NOT NULL AND
                              CONVERT(DATE,[TERM_DATE],103)>@V_END AND CONVERT(DATE,[TERM_DATE],103)>@V_END
                              THEN 'INACTIVE'
                              WHEN [STATUS] IS NULL AND [START_DATE] IS NOT NULL AND [TERM_DATE] IS NULL AND
                              CONVERT(DATE,[START_DATE],103)>@V_END
                              THEN 'INACTIVE' 
                              WHEN [STATUS] IS NULL AND [START_DATE] IS NULL AND [TERM_DATE] IS NULL
                              THEN  'PWC_UNKNOWN'
                              ELSE 'ACTIVE'	END															AS [STATUS]
                              ,CONVERT(DATE, [START_DATE], 103)																				AS [START_DATE] 
                              ,CONVERT(DATE, [TERM_DATE], 103)																					AS [TERM_DATE]
                              ,LTRIM(RTRIM([TERM_REASON]))																				AS [TERM_REASON] 					
                              ,CONVERT(DATE, [DOB], 103)																						AS [DOB]
                              ,LTRIM(RTRIM([GENDER]))																					AS [GENDER] 
                              ,LTRIM(RTRIM([SYSTEM_NAME]))																				AS [SYSTEM_NAME] 																	   
                              FROM (
                              SELECT DISTINCT [EMPLOYEE_ID] AS [EMPLOYEE_ID]
                              FROM [Interface].[EMPLOYEE_MASTER] AS [MASTER]
                              GROUP BY [EMPLOYEE_ID]
                              HAVING COUNT([EMPLOYEE_ID]) > 1
                              ) AS MULTIPLE_ENTRIES  
                              LEFT JOIN
                              [Interface].[EMPLOYEE_MASTER] AS [MASTER]
                              ON MULTIPLE_ENTRIES.[EMPLOYEE_ID] = [MASTER].[EMPLOYEE_ID]
                              
                              UNION ALL
                              
                              SELECT LTRIM(RTRIM(MULTIPLE_ENTRIES.[EMPLOYEE_ID]))				AS [EMPLOYEE_ID]
                              ,LTRIM(RTRIM([SURNAME]))										AS [SURNAME]
                              ,LTRIM(RTRIM([FIRST_NAME]))									AS [FIRST_NAME] 
                              ,LTRIM(RTRIM([SECOND_NAME]))									AS [SECOND_NAME]
                              ,LTRIM(RTRIM([THIRD_NAME]))									AS [THIRD_NAME]
                              ,LTRIM(RTRIM([FOURTH_NAME]))									AS [FOURTH_NAME]
                              ,LTRIM(RTRIM([INITIAL]))										AS [INITIAL] 
                              ,LTRIM(RTRIM([COMPANY]))										AS [COMPANY] 
                              ,LTRIM(RTRIM([DEPARTMENT]))									AS [DEPARTMENT] 
                              ,LTRIM(RTRIM([SUB_DEPARTMENT]))								AS [SUB_DEPARTMENT]
                              ,LTRIM(RTRIM([POSITION]))									AS [POSITION]
                              ,LTRIM(RTRIM([LOCATION]))									AS [LOCATION]
                              ,LTRIM(RTRIM([TYPE]))										AS [TYPE]
                              ,CASE WHEN [STATUS] IS NOT NULL  
                              THEN LTRIM(RTRIM([STATUS]))
                              WHEN [STATUS] IS NULL AND [START_DATE] IS NOT NULL AND [TERM_DATE] IS NOT NULL AND
                              CONVERT(DATE,[TERM_DATE],103)<@V_END
                              THEN 'INACTIVE'
                              WHEN [STATUS] IS NULL AND [START_DATE] IS NOT NULL AND [TERM_DATE] IS NOT NULL AND
                              CONVERT(DATE,[TERM_DATE],103)>@V_END AND CONVERT(DATE,[TERM_DATE],103)>@V_END
                              THEN 'INACTIVE'
                              WHEN [STATUS] IS NULL AND [START_DATE] IS NOT NULL AND [TERM_DATE] IS NULL AND
                              CONVERT(DATE,[START_DATE],103)>@V_END
                              THEN 'INACTIVE' 
                              WHEN [STATUS] IS NULL AND [START_DATE] IS NULL AND [TERM_DATE] IS NULL
                              THEN  'PWC_UNKNOWN'
                              ELSE 'ACTIVE'	END															AS [STATUS]
                              ,CONVERT(DATE, [START_DATE], 103)																				AS [START_DATE] 
                              ,CONVERT(DATE, [TERM_DATE], 103)																					AS [TERM_DATE]
                              ,LTRIM(RTRIM([TERM_REASON]))																				AS [TERM_REASON] 					
                              ,CONVERT(DATE, [DOB], 103)																						AS [DOB]
                              ,LTRIM(RTRIM([GENDER]))																					AS [GENDER] 
                              ,LTRIM(RTRIM([SYSTEM_NAME]))																				AS [SYSTEM_NAME] 				 	
                              FROM (
                              SELECT DISTINCT [EMPLOYEE_ID] AS [EMPLOYEE_ID]
                              FROM [Interface].[EMPLOYEE_MASTER]
                              GROUP BY [EMPLOYEE_ID]
                              HAVING COUNT([EMPLOYEE_ID]) = 1
                              ) AS MULTIPLE_ENTRIES  
                              LEFT JOIN
                              [Interface].[EMPLOYEE_MASTER] AS [MASTER]
                              ON MULTIPLE_ENTRIES.[EMPLOYEE_ID] = [MASTER].[EMPLOYEE_ID]
                              
                              /******************************************************************************************************
                              06. CREATE INDEX ON TABLE
                              ******************************************************************************************************/
                              
                              CREATE INDEX [ID_EMPLOYEE_ID]
                              ON [PREP_EMP_MASTER] (
                              EMPLOYEE_ID
                              )
                              
                              CREATE INDEX [ID_SYSTEM_NAME]
                              ON [PREP_EMP_MASTER] (
                              SYSTEM_NAME
                              )
                              
                              CREATE INDEX [ID_PWC_EMPLOYEE_NAME]
                              ON [PREP_EMP_MASTER] (
                              PWC_EMPLOYEE_NAME
                              )USE [z'9bbaf92f-d960-4e33-a9cd-228c72cc97ef]
GO
/****** Object:  StoredProcedure [dbo].[11.PREP_PAYSLIPS_DETAILS]    Script Date: 4/10/2018 9:37:26 AM ******/
  SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROC [dbo].[11.PREP_PAYSLIPS_DETAILS]
AS


/*************************************************************************************************************
  *                           DATA ASSURANCE                                                                   *
  **************************************************************************************************************
  UPDATES            - Version 0.1 {06/02/2015} {Simon Tsai} - {Creates the empty tables for PAYSLIP 
    DETAILS information}
- Version 0.2 {09/02/2015} {Avideep Agarwal} - {Reviewed}
- Version 0.3 {12/02/2015} {Avideep Agarwal} - {Added Truncate table statement}
- Version 0.4 {17/02/2015} {Simon Tsai} - {Added START_DATE and END_DATE}
- Version 0.5 {04/03/2015} {Simon Tsai} - {Added Commentary}
- Version 0.6 {03/08/2015} {Fei Li} - {Added Timecode and Paycode Mapping}

SCRIPT DESCRIPTION - {Creates the empty tables for PAYSLIP DETAILS informati}

TABLE INFORMATION
INPUT TABLE(S)
- N/A

OUTPUT TABLE(S)
- [DBO].[PREP_PAYSLIPS_DETAILS]

SUMMARY OF SCRIPT  - 01. TRUNCATE TABLE
- 02. INSERT DATA
- 03. CREATE INDEX ON TABLE

**************************************************************************************************************
  01. TRUNCATE TABLE
*************************************************************************************************************/
  
  TRUNCATE TABLE PREP_PAYSLIPS_DETAILS

/*************************************************************************************************************
  02. INSERT DATA
*************************************************************************************************************/
  
  INSERT INTO [DBO].[PREP_PAYSLIPS_DETAILS]
(
  [EMPLOYEE_ID]
  ,[JOB_ID]
  ,[PAY_RUN_ID]
  ,[PAY_PERIOD]
  ,[PAY_YEAR]
  ,[LINE_ID]
  ,[PAYCODE_ID]
  ,[PAYCODE_DESC]
  ,[PAYSLIP_ID]
  ,[PAY_TYPE]
  ,[PAY_TYPE_DESC]
  ,[SUB_TYPE]
  ,[HOURS]
  ,[AMOUNT]
  ,[COMPANY_AMOUNT]
  ,[DESCRIPTION]
  ,[SYSTEM_NAME]
  ,[PAYRATE]
  ,[START_DATE]
  ,[END_DATE]
)

SELECT   LTRIM(RTRIM([EMPLOYEE_ID]))																				AS [EMPLOYEE_ID]
,LTRIM(RTRIM([JOB_ID]))																						AS [JOB_ID]
,LTRIM(RTRIM([PAY_RUN_ID]))																					AS [PAY_RUN_ID]
,LTRIM(RTRIM([PAY_PERIOD]))																					AS [PAY_PERIOD]
,LTRIM(RTRIM([PAY_YEAR]))																					AS [PAY_YEAR]
,LTRIM(RTRIM([LINE_ID]))																					AS [LINE_ID]
,LTRIM(RTRIM([PAYCODE_ID]))																					AS [PAYCODE_ID]
,LTRIM(RTRIM([PAYCODE_DESC]))																				AS [PAYCODE_DESC]	
,LTRIM(RTRIM([PAYSLIP_ID]))																					AS [PAYSLIP_ID] 
,LTRIM(RTRIM([PAY_TYPE]))																					AS [PAY_TYPE] 
,LTRIM(RTRIM([PAY_TYPE_DESC]))																				AS [PAY_TYPE_DESC]
,LTRIM(RTRIM([SUB_TYPE]))																					AS [SUB_TYPE]
,LTRIM(RTRIM([HOURS]))																						AS [HOURS]
,LTRIM(RTRIM([AMOUNT]))																						AS [AMOUNT]
,LTRIM(RTRIM([COMPANY_AMOUNT]))																				AS [COMPANY_AMOUNT]
,LTRIM(RTRIM(PM.[DESCRIPTION]))																				AS [DESCRIPTION]
,LTRIM(RTRIM([SYSTEM_NAME]))																				AS [SYSTEM_NAME]
,LTRIM(RTRIM([PAYRATE]))																					AS [PAYRATE]
,CONVERT(DATE,[START_DATE],103)																				AS [START_DATE]
,CONVERT(DATE,[END_DATE],103)																				AS [END_DATE]
FROM [Interface].[PAYSLIP_DETAIL] PD
LEFT JOIN (
  SELECT [Pay_Code],[Code_Type],[Description]
  FROM [DBO].[REF_PAYCODE] 
) AS PM
ON PD.[PAYCODE_ID]=PM.[Pay_Code]
WHERE PD.[PAYCODE_ID] IS NOT NULL


/*************************************************************************************************************
  03. CREATE INDEX ON TABLE
*************************************************************************************************************/
  
  CREATE INDEX [ID_EMPLOYEE_ID]
ON [PREP_PAYSLIPS_DETAILS] (
  EMPLOYEE_ID
)

CREATE INDEX [ID_SYSTEM_NAME]
ON [PREP_PAYSLIPS_DETAILS] (
  SYSTEM_NAME
)

CREATE INDEX [ID_JOB_ID]
ON [PREP_PAYSLIPS_DETAILS] (
  JOB_ID
)

CREATE INDEX [ID_PAY_RUN_ID]
ON [PREP_PAYSLIPS_DETAILS] (
  PAY_RUN_ID
)

CREATE INDEX [ID_PAY_PERIOD]
ON [PREP_PAYSLIPS_DETAILS] (
  PAY_PERIOD
)

CREATE INDEX [ID_PAY_YEAR]
ON [PREP_PAYSLIPS_DETAILS] (
  PAY_YEAR
)

CREATE INDEX [ID_PAYSLIP_ID]
ON [PREP_PAYSLIPS_DETAILS] (
  PAYSLIP_ID
)

CREATE INDEX [ID_PAY_TYPE]
ON [PREP_PAYSLIPS_DETAILS] (
  PAY_TYPE
)USE [z'9bbaf92f-d960-4e33-a9cd-228c72cc97ef]
GO
      /****** Object:  StoredProcedure [dbo].[12.PREP_PAYSLIPS_HEADER]    Script Date: 4/10/2018 9:38:10 AM ******/
      SET ANSI_NULLS ON
      GO
      SET QUOTED_IDENTIFIER ON
      GO
      ALTER PROC [dbo].[12.PREP_PAYSLIPS_HEADER]
      AS
      
      /***********************************************************************************************************
      *                           DATA ASSURANCE                                                                 *
      ************************************************************************************************************
      UPDATES            - Version 0.1 {06/02/2015} {Simon Tsai} - {Creates the empty tables for PAYSLIP 
      HEADERS information}
      - Version 0.2 {06/02/2015} {Avideep Agarwal} - {Reviewed}
      - Version 0.3 {12/02/2015} {Avideep Agarwal} - {Added Truncate table statement}
      - Version 0.4 {13/02/2015} {Simon Tsai} - {Added PWC_GROSS_AMOUNT field}
      - Version 0.5 {17/02/2015) {Simon Tsai} - {Added PAYRATE_BASE and PAYRATE_OVERTIME
      ADDED PAYRATE_BASE_MOVEMENT AND PAYRATE_OVERTIME_MOVEMENT}
      - Version 0.6 {04/03/2015} {Simon Tsai} - {Added Commentary)
      - Version 0.7 {03/08/2015} {Fei Li} - {Added Ref_paycode table and replace function for amount conversion}
      - Version 0.8 {01/02/2018} {Justin Moy} - {Changed gross pay definition}
      
      
      
      SCRIPT DESCRIPTION - {Creates the empty tables for MASTER Employee information}
      
      TABLE INFORMATION
      INPUT TABLE(S)
      - N/A
      
      OUTPUT TABLE(S)
      - [DBO].[PREP_EMP_PAYSLIPS_HEADER]
      
      SUMMARY OF SCRIPT  - 01. TRUNCATE TABLE
      - 02. INSERT DATA
      - 03. POPULATE SALARY BASE PAY DETAILS 
      - 04. POPULATE SALARY OVERTIME PAY DETAILS
      - 05. POPULATE SALARY ADDITION BEFORE TAX PAY DETAILS USING ALLOWANCE DETAILS
      - 06. POPULATE SALARY TAX PAY DETAILS
      - 07. POPULATE SALARY ADDITION AFTER TAX PAY DETAILS USING BENEFIT INFORMATION
      - 08. POPULATE SALARY DEDUCTION BEFORE TAX PAY DETAILS USING BENEFIT INFORMATION
      - 09. CREATE INDEX ON TABLE
      
      
      ************************************************************************************************************
      01. TRUNCATE TABLE
      ***********************************************************************************************************/
      
      TRUNCATE TABLE [PREP_PAYSLIPS_HEADER]
      
      /***********************************************************************************************************
      02. INSERT DATA
      ***********************************************************************************************************/
      INSERT INTO [DBO].[PREP_PAYSLIPS_HEADER]
      (
      [EMPLOYEE_ID] 
      ,[PAY_RUN_ID]
      ,[PAYSLIP_ID]
      ,[PAY_PERIOD]
      ,[PAY_YEAR]
      ,[COMPANY] 
      ,[DEPARTMENT] 
      ,[PAYMENT_DATE] 
      ,[PAY_PERIOD_FROM] 
      ,[PAY_PERIOD_TO] 
      ,[REGULAR_HOURS]   
      ,[OVERTIME_HOURS]    
      ,[BASE_VALUE]
      ,[OVERTIME_VALUE]
      ,[GROSS]
      ,[ADDITIONS_BEFORE_TAX]
      ,[DEDUCTIONS_BEFORE_TAX]
      ,[TAXABLE_INCOME]
      ,[TAX]
      ,[ADDITIONS_AFTER_TAX]
      ,[DEDUCTIONS_AFTER_TAX]
      ,[NET]
      ,[SUPER]
      --,[ACCRUED_LEAVE]
      --,[AUTHORISED_BY]
      --,[AUTHORISED_DATE]
      --,[COMMENT]
      ,[SYSTEM_NAME] 
      ,[PAYRATE_BASE]
      --,[PAYRATE_OVERTIME]
      )
      SELECT 	 
      [EMPLOYEE_ID] 
      ,[PAY_RUN_ID]
      ,[PAYSLIP_ID]
      ,[PAY_PERIOD]
      ,[PAY_YEAR]
      ,[COMPANY] 
      ,[DEPARTMENT] 
      ,[PAYMENT_DATE] 
      ,[PAY_PERIOD_FROM] 
      ,[PAY_PERIOD_TO] 
      ,[REGULAR_HOURS]   
      ,[OVERTIME_HOURS]  
      ,SUM([BASE_VALUE])															AS [BASE_VALUE]
      ,SUM([OVERTIME_VALUE])														AS [OVERTIME_VALUE]
      ,SUM([GROSS])																AS [GROSS]
      ,SUM([ADDITIONS_BEFORE_TAX])												AS [ADDITIONS_BEFORE_TAX]
      ,SUM([DEDUCTIONS_BEFORE_TAX])												AS [DEDUCTIONS_BEFORE_TAX]
      ,SUM([TAXABLE_INCOME])														AS [TAXABLE_INCOME]
      ,SUM([TAX])																	AS [TAX]
      ,SUM([ADDITIONS_AFTER_TAX])													AS [ADDITIONS_AFTER_TAX]
      ,SUM([DEDUCTIONS_AFTER_TAX])												AS [DEDUCTIONS_AFTER_TAX]
      ,SUM([NET])																	AS [NET]
      ,SUM([SUPER]) AS [SUPER]
      --,[ACCRUED_LEAVE]
      --,[AUTHORISED_BY]
      --,[AUTHORISED_DATE]
      --,[COMMENT]
      ,[SYSTEM_NAME] 
      ,[PAYRATE_BASE]
      --,[PAYRATE_OVERTIME]
      FROM (
      SELECT 
      LTRIM(RTRIM([EMPLOYEE_ID]))																			AS [EMPLOYEE_ID] 
      ,LTRIM(RTRIM([PAY_RUN_ID]))						 													    AS [PAY_RUN_ID] 
      ,LTRIM(RTRIM(PH.[EMPLOYEE_ID]))+'_'+ 
      CASE WHEN PH.[PAY_RUN_ID] IS NULL THEN 'PWC_UNKNOWN' ELSE PH.[PAY_RUN_ID] END							AS [PAYSLIP_ID]  
      --,CASE WHEN CAST(LTRIM(RTRIM([PAY_PERIOD_TO])) AS INT)<0 
      --	  THEN CAST(CAST(CAST('0' AS INT) AS DATETIME) AS DATE)	
      --      ELSE CAST(CAST(CAST(LTRIM(RTRIM([PAY_PERIOD_TO])) AS INT) AS DATETIME) AS DATE)  END				AS [PAY_PERIOD]
      ,CONVERT(DATE,[PAY_PERIOD_TO],103)																		AS [PAY_PERIOD]
      ,LTRIM(RTRIM([PAY_YEAR]))																				AS [PAY_YEAR]
      ,LTRIM(RTRIM([COMPANY]))																				AS [COMPANY] 
      ,LTRIM(RTRIM([DEPARTMENT]))																				AS [DEPARTMENT] 
      ,CONVERT(DATE,PH.[PAYMENT_DATE],103)																	AS [PAYMENT_DATE] 
      --,CAST(CAST(CAST(LTRIM(RTRIM(PH.[PAYMENT_DATE])) AS INT) AS DATETIME) AS DATE)							AS [PAYMENT_DATE] 
      ,CONVERT(DATE,[PAY_PERIOD_FROM],103)																	AS [PAY_PERIOD_FROM] 
      ,CONVERT(DATE,[PAY_PERIOD_TO],103)																		AS [PAY_PERIOD_TO]
      ,LTRIM(RTRIM([REGULAR_HOURS]))																		    AS [REGULAR_HOURS] 
      ,CAST([OVERTIME_HOURS] AS DECIMAL(18,4))															    AS [OVERTIME_HOURS] 
      ,CAST([BASE_VALUE] AS DECIMAL(18,4))																	AS [BASE_VALUE]
      ,CAST([OVERTIME_VALUE] AS DECIMAL(18,4))																AS [OVERTIME_VALUE]
      ,CAST([GROSS] AS DECIMAL(18,4))																			AS [GROSS]
      ,CAST([ADDITIONS_BEFORE_TAX] AS DECIMAL(18,4))															AS [ADDITIONS_BEFORE_TAX]
      ,CAST([DEDUCTIONS_BEFORE_TAX] AS DECIMAL(18,4))															AS [DEDUCTIONS_BEFORE_TAX]
      ,CAST([TAXABLE_INCOME] AS DECIMAL(18,4))																AS [TAXABLE_INCOME]
      ,CAST([TAX] AS DECIMAL(18,4))																			AS [TAX]
      ,CAST([ADDITIONS_AFTER_TAX] AS DECIMAL(18,4))															AS [ADDITIONS_AFTER_TAX]
      ,CAST([DEDUCTIONS_AFTER_TAX] AS DECIMAL(18,4))															AS [DEDUCTIONS_AFTER_TAX]
      ,CAST([NET] AS DECIMAL(18,4))																			AS [NET]
      ,CAST([SUPER] AS DECIMAL (18,4))																		AS [SUPER]
      ,CAST([ACCRUED_LEAVE] AS DECIMAL(18,4))																	AS [ACCRUED_LEAVE]
      --,LTRIM(RTRIM([AUTHORISED_BY]))																		AS [AUTHORISED_BY]
      --,CONVERT(DATE,REPLACE(LTRIM(RTRIM([AUTHORISED_DATE])),'"',''),103)									AS [AUTHORISED_DATE]
      --,LTRIM(RTRIM([COMMENT]))																				AS [COMMENT]
      ,LTRIM(RTRIM([SYSTEM_NAME]))																			AS [SYSTEM_NAME]
      ,CAST([PAYRATE_BASE] AS DECIMAL(18,4))																	AS [PAYRATE_BASE]
      --,LTRIM(RTRIM([PAYRATE_OVERTIME]))																		AS [PAYRATE_OVERTIME]
      --,MAPPING.[Code_Type] AS PAYTYPE
      FROM [Interface].[PAYSLIP_HEADER] AS PH
      WHERE [PAY_RUN_ID] IS NOT NULL   
      ) AS NT
      
      GROUP BY 	 
      [EMPLOYEE_ID] 
      ,[PAY_RUN_ID]
      ,[PAYSLIP_ID]
      ,[PAY_PERIOD]
      ,[PAY_YEAR]
      ,[COMPANY] 
      ,[DEPARTMENT] 
      ,[PAYMENT_DATE] 
      ,[PAY_PERIOD_FROM] 
      ,[PAY_PERIOD_TO] 
      ,[REGULAR_HOURS]   
      ,[OVERTIME_HOURS]
      --,[ACCRUED_LEAVE]
      --,[AUTHORISED_BY]
      --,[AUTHORISED_DATE]
      --,[COMMENT]
      ,[SYSTEM_NAME] 
      ,[PAYRATE_BASE]
      --,[PAYRATE_OVERTIME]
      
      
      /***********************************************************************************************************
      09. UPDATE PWC_GROSS AND PWC_NET
      ***********************************************************************************************************/
      
      UPDATE [DBO].[PREP_PAYSLIPS_HEADER]
      SET [PWC_NET_AMOUNT] = 
      ISNULL(BASE_VALUE,0) + ISNULL(OVERTIME_VALUE,0) + ISNULL(ADDITIONS_BEFORE_TAX,0) - 
      ISNULL(DEDUCTIONS_BEFORE_TAX,0) - ISNULL(TAX,0) + ISNULL(ADDITIONS_AFTER_TAX,0) - 
      ISNULL(DEDUCTIONS_AFTER_TAX,0)
      --,PWC_GROSS_AMOUNT = ISNULL(BASE_VALUE,0) + ISNULL(OVERTIME_VALUE,0)
      --@@JM added additions before and deductions before 01/02/2018 
      ,PWC_GROSS_AMOUNT = ISNULL(BASE_VALUE,0) + ISNULL(OVERTIME_VALUE,0) + ISNULL(ADDITIONS_BEFORE_TAX,0) - ISNULL(DEDUCTIONS_BEFORE_TAX,0)
      
      /***********************************************************************************************************
      09. CREATE INDEX ON TABLE
      ***********************************************************************************************************/
      
      CREATE INDEX [ID_EMPLOYEE_ID]
      ON [PREP_PAYSLIPS_HEADER] (
      EMPLOYEE_ID
      )
      
      CREATE INDEX [ID_PAY_RUN_ID]
      ON [PREP_PAYSLIPS_HEADER] (
      PAY_RUN_ID
      )
      
      CREATE INDEX [ID_PAYSLIP_ID]
      ON [PREP_PAYSLIPS_HEADER] (
      PAYSLIP_ID
      )
      
      CREATE INDEX [ID_PAY_PERIOD]
      ON [PREP_PAYSLIPS_HEADER] (
      [PAY_PERIOD]
      )
      
      CREATE INDEX [ID_PAY_YEAR]
      ON [PREP_PAYSLIPS_HEADER] (
      PAY_YEAR
      )
      
      CREATE INDEX [ID_PAYMENT_DATE]
      ON [PREP_PAYSLIPS_HEADER] (
      PAYMENT_DATE
      )USE [z'9bbaf92f-d960-4e33-a9cd-228c72cc97ef]
GO
      /****** Object:  StoredProcedure [dbo].[13.PREP_BANK_EFT]    Script Date: 4/10/2018 9:38:33 AM ******/
      SET ANSI_NULLS ON
      GO
      SET QUOTED_IDENTIFIER ON
      GO
      ALTER PROC [dbo].[13.PREP_BANK_EFT]
      AS
      
      /****************************************************************************************************
      *                           DATA ASSURANCE                                                          *
      *****************************************************************************************************
      UPDATES        - Version 0.1 {06/02/2015} {Simon Tsai} - {Creates the empty tables for BANK EFT information}
      - Version 0.2 {10/02/2015} {Avideep Agarwal} - {Reviewed}
      - Version 0.3 {12/02/2015} {Avideep Agarwal} - {Added Truncate table statement}
      - Version 0.4 {04/03/2015} {Simon Tsai} - {Added Commentary}
      - Version 0.5 {03/08/2015} {Fei Li} - {Add replace in the amount and netpay columns}
      - Version 0.6 {18/02/2016} {Fei Li} - {Added cleanse data to populate PWC_ fields part}
      
      SCRIPT DESCRIPTION - {Creates the empty tables for BANK EFT information}
      
      TABLE INFORMATION
      INPUT TABLE(S)
      - N/A
      
      OUTPUT TABLE(S)
      - [DBO].[PREP_BANK_EFT]
      
      SUMMARY OF SCRIPT  - 01. TRUNCATE TABLE
      - 02. INSERT DATA
      - 03. CLEANSE DATA TO POPULATE PWC_ FIELDS
      - 04. CREATE INDEX ON TABLE
      
      *****************************************************************************************************
      01. TRUNCATE TABLE
      ****************************************************************************************************/
      
      TRUNCATE TABLE [PREP_BANK_EFT]
      
      /****************************************************************************************************
      02. INSERT DATA
      ****************************************************************************************************/
      
      INSERT INTO [DBO].[PREP_BANK_EFT]
      (
      [EMPLOYEE_ID] 
      ,[PAYGRP]
      ,[PAYGRP_DESC]
      ,[PAYPERNO]
      ,[PAYPERYR]
      ,[PERIOD_END_DATE]
      ,[PAYMETHOD]
      ,[PAYMETHOD_DESC]
      ,[AMOUNT]
      ,[NETPAY]
      ,[CHEQUE_DATE]
      ,[CHEQUE_NUMBER]
      ,[ACCOUNT_NAME] 
      ,[ACCOUNT_NUMBER] 
      ,[BSB_NUMBER] 
      ,[BSB_NUMBER_DESC] 
      ,[DISBURSE_ID]
      ,[DISBURSE_DATE] 
      ,[REFERENCE]
      ,[SYSTEM_NAME]
      )
      SELECT 
      LTRIM(RTRIM([EMPLOYEE_ID]))																	AS [EMPLOYEE_ID]
      ,LTRIM(RTRIM([PAYGRP]))																		AS [PAYGRP] 
      ,LTRIM(RTRIM([PAYGRP_DESC]))																	AS [PAYGRP_DESC] 
      ,LTRIM(RTRIM([PAYPERNO]))																	AS [PAYPERNO] 
      ,LTRIM(RTRIM([PAYPERYR]))																	AS [PAYPERYR] 
      ,CONVERT(DATE,[PERIOD_END_DATE],103)															AS [PERIOD_END_DATE]
      ,LTRIM(RTRIM([PAYMETHOD]))																	AS [PAYMETHOD]
      ,LTRIM(RTRIM([PAYMETHOD_DESC]))																AS [PAYMETHOD_DESC]
      ,CAST([AMOUNT] AS DECIMAL(18,4))																AS [AMOUNT]
      ,CAST([NETPAY] AS DECIMAL(18,4))																AS [NETPAY]
      ,CONVERT(DATE,[CHEQUE_DATE],103)																AS [CHEQUE_DATE]
      ,LTRIM(RTRIM([CHEQUE_NUMBER]))																AS [CHEQUE_NUMBER]
      ,LTRIM(RTRIM([ACCOUNT_NAME]))																AS [ACCOUNT_NAME] 
      ,LTRIM(RTRIM([ACCOUNT_NUMBER]))																AS [ACCOUNT_NUMBER]
      ,LTRIM(RTRIM([BSB_NUMBER]))									 								AS [BSB_NUMBER]
      ,LTRIM(RTRIM([BSB_NUMBER_DESC]))																AS [BSB_NUMBER_DESC]
      ,LTRIM(RTRIM([DISBURSE_ID]))																	AS [DISBURSE_ID]
      ,CONVERT(DATE,[DISBURSE_DATE],103)															AS [DISBURSE_DATE]
      ,LTRIM(RTRIM([REFERENCE]))																	AS [REFERENCE]
      ,LTRIM(RTRIM([SYSTEM_NAME]))																	AS [SYSTEM_NAME]
      FROM [Interface].[BANK_EFT_DETAIL]
      
      
      /************************************************************************************************************
      03. CLEANSE DATA TO POPULATE PWC_ FIELDS
      USERS ARE NOT REQUIRED TO CHANGE ANY OF THE DATA BELOW
      ************************************************************************************************************/
      
      UPDATE [DBO].[PREP_BANK_EFT]
      SET PWC_BSB_NUMBER = RIGHT('000000000000000'+dbo.fn_StripCharacters(BSB_NUMBER, '^0-9'),15)
      ,PWC_ACCOUNT_NUMBER = RIGHT('00000000000000000000'+dbo.fn_StripCharacters(ACCOUNT_NUMBER, '^0-9'),20)
      ,PWC_ACCOUNT_NAME = dbo.fn_StripCharacters(ACCOUNT_NAME, '^a-z0-9 ')
      
      /****************************************************************************************************
      04. CREATE INDEX ON TABLE
      ****************************************************************************************************/
      
      CREATE INDEX [ID_EMPLOYEE_ID]
      ON [PREP_BANK_EFT] (
      EMPLOYEE_ID
      )
      
      CREATE INDEX [ID_PAYPERNO]
      ON [PREP_BANK_EFT] (
      PAYPERNO
      )
      
      CREATE INDEX [ID_PAYPERYR]
      ON [PREP_BANK_EFT] (
      PAYPERYR
      )USE [z'9bbaf92f-d960-4e33-a9cd-228c72cc97ef]
GO
      /****** Object:  StoredProcedure [dbo].[13A.PREP_EMP_LEAVE_TAKEN]    Script Date: 4/10/2018 9:38:59 AM ******/
      SET ANSI_NULLS ON
      GO
      SET QUOTED_IDENTIFIER ON
      GO
      ALTER PROC [dbo].[13A.PREP_EMP_LEAVE_TAKEN]
      AS
      
      /*************************************************************************************************************
      *                           DATA ASSURANCE                                                                   *
      **************************************************************************************************************
      UPDATES            - Version 0.1 {13/02/2015} {Simon Tsai} - {CREATED SCRIPT}
      - Version 0.2 {04/03/2015} {Simon Tsai} - {Added Commentary}
      - Version 0.3 {28/08/2015} {Fei Li} - {Modify employee leave balance to leave taken}
      - Version 0.4 {31/08/2015} {Fei Li} - {Added days column}
      
      SCRIPT DESCRIPTION - {INSERT DATA FOR LEAVE TABLE}
      
      TABLE INFORMATION
      INPUT TABLE(S)
      - N/A
      
      OUTPUT TABLE(S)
      - [DBO].[PREP_EMP_LEAVE_TAKEN]
      
      SUMMARY OF SCRIPT  - 00. DECLARE WORKING HOURS VARIABLES
      - 01. TRUNCATE TABLE
      - 02. INSERT DATA
      - 03. UNPIVOT DATA TO CREATE ('LEAVE_TYPE' + '_' + 'DESCRIPTION_OF_LEAVE_BALANCE')
      - 04. PIVOT DATA TO MAKE ('LEAVE_TYPE' + '_' + 'DESCRIPTION_OF_LEAVE_BALANCE') INTO COLUMNS
      - 05. CREATE INDEX ON TABLE
      
      ************************************************************************************************************************
      00. DECLARE WORKING HOURS 
      ***********************************************************************************************************************/
      DECLARE @WORKING_HOURS NUMERIC(18,4)
      
      
      SET @WORKING_HOURS = CONVERT(NUMERIC(18,4),
      (SELECT 
      [Value]
      FROM 
      [Store].[Setting]
      WHERE 
      [KEY]='8.0 Working hours per day'))
      /************************************************************************************************************
      01. TRUNCATE TABLE
      ***********************************************************************************************************/
      
      TRUNCATE TABLE [PREP_EMP_LEAVE_TAKEN]
      
      /*************************************************************************************************************
      02. INSERT DATA
      *************************************************************************************************************/
      
      INSERT INTO [DBO].[PREP_EMP_LEAVE_TAKEN]
      (
      EMPLOYEE_ID
      ,JOB_ID
      ,PAY_RUN_ID
      ,PAY_PERIOD
      ,PAY_YEAR
      ,LINE_ID
      ,PAYCODE_ID
      ,PAYCODE_DESC
      ,PAYSLIP_ID
      ,LEAVE_TYPE
      ,LEAVE_TYPE_DESC
      ,LEAVE_SUB_TYPE
      ,HOURS
      ,AMOUNT
      ,DESCRIPTION
      ,SYSTEM_NAME
      ,PAYRATE
      ,START_DATE
      ,END_DATE
      ,DAYS
      )
      SELECT
      LTRIM(RTRIM(PD.[EMPLOYEE_ID]))																		    AS [EMPLOYEE_ID]
      ,LTRIM(RTRIM(PD.[JOB_ID]))																					AS [JOB_ID]
      ,LTRIM(RTRIM(PD.[PAY_RUN_ID]))													                            AS [PAY_RUN_ID]
      ,LTRIM(RTRIM([PAY_PERIOD]))													                            AS [PAY_PERIOD]
      ,LTRIM(RTRIM([PAY_YEAR]))																				AS [PAY_YEAR]
      ,LTRIM(RTRIM([LINE_ID]))																				AS [LINE_ID]
      ,LTRIM(RTRIM([PAYCODE_ID]))																				AS [PAYCODE_ID]
      ,LTRIM(RTRIM([PAYCODE_DESC]))																			AS [PAYCODE_DESC]
      ,LTRIM(RTRIM(PD.[PAYSLIP_ID]))																				AS [PAYSLIP_ID] 
      ,LTRIM(RTRIM(PM.[LEAVE_TYPE]))																				AS [LEAVE_TYPE]
      ,LTRIM(RTRIM(LEAVE.[LEAVE_TYPE_DETAILS]))																		AS [LEAVE_TYPE_DESC]
      ,LTRIM(RTRIM(LEAVE.[LEAVE_SUB_TYPE]))																			AS [LEAVE_SUB_TYPE]
      ,CAST([HOURS] AS DECIMAL(18,4))																			AS [HOURS]
      ,CAST([AMOUNT] AS DECIMAL(18,4))																		AS [AMOUNT]
      ,LTRIM(RTRIM(PM.[DESCRIPTION]))																			AS [DESCRIPTION]
      ,LTRIM(RTRIM(PD.[SYSTEM_NAME]))																		    AS [SYSTEM_NAME]
      ,CAST([PAYRATE] AS DECIMAL(18,4))																		AS [PAYRATE]
      ,CONVERT(DATE,[START_DATE],103)											                                AS [START_DATE]
      ,CONVERT(DATE,[END_DATE],103)																			AS [END_DATE]
      ,CAST(REPLACE(LTRIM(RTRIM(PD.[HOURS])),',','') AS NUMERIC(18,4))/@WORKING_HOURS							AS [DAYS]
      FROM [Interface].[PAYSLIP_DETAIL] AS PD
      LEFT JOIN (
      SELECT [Pay_Code],[Leave_Type],[Description]
      FROM [DBO].[REF_PAYCODE] 
      ) AS PM
      ON PD.[PAYCODE_ID]=PM.[Pay_Code]
      LEFT JOIN
      [Interface].[LEAVE_BALANCE] AS LEAVE
      ON LEAVE.[PAYSLIP_ID] = PD.[PAYSLIP_ID]
      AND
      LEAVE.[EMPLOYEE_ID] = PD.[EMPLOYEE_ID]
      WHERE  PM.[LEAVE_TYPE] IS NOT NULL
      
      /*************************************************************************************************************
      03. CREATE INDEX ON TABLE
      *************************************************************************************************************/
      
      CREATE INDEX [ID_EMPLOYEE_ID]
      ON [PREP_EMP_LEAVE_TAKEN] (
      EMPLOYEE_ID
      )
      
      CREATE INDEX [ID_SYSTEM_NAME]
      ON [PREP_EMP_LEAVE_TAKEN] (
      SYSTEM_NAME
      )
      
      CREATE INDEX [ID_JOB_ID]
      ON [PREP_EMP_LEAVE_TAKEN] (
      JOB_ID
      )
      
      CREATE INDEX [ID_PAY_RUN_ID]
      ON [PREP_EMP_LEAVE_TAKEN] (
      PAY_RUN_ID
      )
      
      CREATE INDEX [ID_PAY_PERIOD]
      ON [PREP_EMP_LEAVE_TAKEN] (
      PAY_PERIOD
      )
      
      CREATE INDEX [ID_PAY_YEAR]
      ON [PREP_EMP_LEAVE_TAKEN] (
      PAY_YEAR
      )
      
      CREATE INDEX [ID_PAYSLIP_ID]
      ON [PREP_EMP_LEAVE_TAKEN] (
      PAYSLIP_ID
      )
      
      CREATE INDEX [ID_LEAVE_TYPE]
      ON [PREP_EMP_LEAVE_TAKEN] (
      LEAVE_TYPE
      )USE [z'9bbaf92f-d960-4e33-a9cd-228c72cc97ef]
GO
      /****** Object:  StoredProcedure [dbo].[14.BLD_RES_EMPLOYEE]    Script Date: 4/10/2018 9:39:36 AM ******/
      SET ANSI_NULLS ON
      GO
      SET QUOTED_IDENTIFIER ON
      GO
      ALTER  PROC [dbo].[14.BLD_RES_EMPLOYEE]
      AS
      
      /********************************************************************************************************
      *                           DATA ASSURANCE                                                              *
      *********************************************************************************************************
      UPDATES            - Version 0.1 {10/02/2015} {Simon Tsai} - {Creates the TEST RESULTS TABLE FOR PAYROLL}
      - Version 0.2 {10/02/2015} {Avideep Agarwal} - {Reviewed}
      - Version 0.3 {04/03/2015} {Simon Tsai} - {Added Commentary}
      - Version 0.4 {11/03/2015} {Simon Tsai} - {Updated with Employee Tests}
      
      SCRIPT DESCRIPTION - {Creates the empty results tables for PAYROLL TESTS}
      
      TABLE INFORMATION
      INPUT TABLE(S)
      - N/A
      
      OUTPUT TABLE(S)
      - [DBO].[RES_EMPLOYEE]
      
      SUMMARY OF SCRIPT  - 01. DROP TABLE STATEMENT
      - 02. CREATE EMPTY TABLES
      - 03. INSERT FIRST ROW INTO RES_EMPLOYEE DATA TABLE TO FLAG TEST EXECUTION
      - 04. INSERT DATA INTO RES_EMPLOYEE DATA TABLE (NOTE: USER DEFINED VARIABLES)
      - 05. CREATE INDEX ON TABLE
      
      *********************************************************************************************************
      01. DROP TABLE STATEMENT
      ********************************************************************************************************/
      
      IF OBJECT_ID('RES_EMPLOYEE') IS NOT NULL
      DROP TABLE RES_EMPLOYEE
      
      /********************************************************************************************************
      02. CREATE EMPTY TABLES
      -- PAY_28 AS NEW STARTER FLAG
      -- PAY_29 AS TERMINATED EMPLOYEE FLAG
      ********************************************************************************************************/
      
      CREATE TABLE [DBO].[RES_EMPLOYEE]
      (
      Employee_ID NVARCHAR(1000) NOT NULL
      ,SYSTEM_NAME NVARCHAR(1000) NULL
      ,EMPLOYEE_SYSTEM_ID NVARCHAR(1000) NOT NULL
      ,PAY_01 INT NULL
      ,PAY_02 INT NULL
      ,PAY_03 INT NULL
      ,PAY_03_REASON NVARCHAR(1000)
      ,PAY_03_BANK NVARCHAR(1000)
      ,PAY_03_ADDRESS NVARCHAR(1000)
      ,PAY_03_NUMBER NVARCHAR(1000)
      ,PAY_04 INT NULL
      ,PAY_05 INT NULL
      ,PAY_06 INT NULL
      ,PAY_07 INT NULL
      ,PAY_08 INT NULL
      ,PAY_08_REASON NVARCHAR(1000)
      ,PAY_09 INT NULL
      ,PAY_10 INT NULL
      ,PAY_11 INT NULL
      ,PAY_25 INT NULL -- EMPLOYEE MOVEMENT
      ,PAY_26 INT NULL
      ,PAY_28 INT NULL -- NEW STARTER FLAG
      ,PAY_29 INT NULL -- TERMINATED EMPLOYEE FLAG
      ,PAY_ALL INT NULL -- EMPLOYEE SUMMARY
      )
      
      /********************************************************************************************************
      03. INSERT FIRST ROW INTO RES_EMPLOYEE DATA TABLE TO FLAG TEST EXECUTION
      THIS INFORMATION IS REQUIRED BY QLIKVIEW
      ********************************************************************************************************/
      
      INSERT INTO [DBO].[RES_EMPLOYEE]
      (
      Employee_ID
      ,SYSTEM_NAME
      ,EMPLOYEE_SYSTEM_ID
      )
      VALUES
      (
      'PWC_TEST_EXECUTED'
      ,NULL
      ,'PWC_TEST_EXECUTED_'
      )
      
      /********************************************************************************************************
      04. INSERT DATA INTO RES_EMPLOYEE DATA TABLE
      NOTE: PLEASE NOTE THAT THERE ARE SOME DEFINED INFORMATION BEING USED FROM STORE.SETTING
      - 'AUDIT_PERIOD_START'
      - 'AUDIT_PERIOD_END'
      ********************************************************************************************************/
      
      INSERT INTO [DBO].[RES_EMPLOYEE]
      (
      Employee_ID
      ,SYSTEM_NAME
      ,EMPLOYEE_SYSTEM_ID
      ,PAY_28  -- NEW STARTERS FLAG
      ,PAY_29  -- TERMINATED EMPLOYEE FLAG
      )
      SELECT DISTINCT
      [EMPLOYEE_ID]
      ,ISNULL([SYSTEM_NAME],'')
      ,[EMPLOYEE_ID] + '_' + ISNULL([SYSTEM_NAME],'')
      ,CASE WHEN ([START_DATE] 
      BETWEEN (SELECT VALUE FROM [Store].[Setting] WHERE [KEY] = 'AUDIT_PERIOD_START') 
      AND (SELECT VALUE FROM [Store].[Setting] WHERE [KEY] = 'AUDIT_PERIOD_END')
      ) 
      THEN 1 ELSE 0 END
      ,CASE WHEN PWC_TERMINATED_FLAG = 'Yes' THEN 1 ELSE 0 END
      FROM [dbo].[PREP_EMP_MASTER]
      
      /********************************************************************************************************
      05. CREATE INDEX ON TABLE
      ********************************************************************************************************/
      
      CREATE INDEX [ID_EMPLOYEE_ID]
      ON RES_EMPLOYEE (
      EMPLOYEE_ID
      )
      
      CREATE INDEX [ID_EMPLOYEE_SYSTEM_ID]
      ON RES_EMPLOYEE (
      EMPLOYEE_SYSTEM_ID
      )USE [z'9bbaf92f-d960-4e33-a9cd-228c72cc97ef]
GO
      /****** Object:  StoredProcedure [dbo].[14A.BLD_RES_LEAVE]    Script Date: 4/10/2018 9:40:37 AM ******/
      SET ANSI_NULLS ON
      GO
      SET QUOTED_IDENTIFIER ON
      GO
      
      ALTER  PROC [dbo].[14A.BLD_RES_LEAVE]
      AS
      
      /********************************************************************************************************
      *                           DATA ASSURANCE                                                              *
      *********************************************************************************************************
      UPDATES            - Version 0.1 {31/08/2015} {Fei Li} - {Creates the TEST RESULTS TABLE FOR PAYROLL}
      - Version 0.2 {22/08/2017} {Justin Moy} - {Get employee ID from payslip detail instead of master
      (previously it was not including emps not in master}
      
      
      SCRIPT DESCRIPTION - {Creates the empty results tables for PAYROLL TESTS}
      
      TABLE INFORMATION
      INPUT TABLE(S)
      - N/A
      
      OUTPUT TABLE(S)
      - [DBO].[RES_LEAVE]
      
      SUMMARY OF SCRIPT  - 01. DROP TABLE STATEMENT
      - 02. CREATE EMPTY TABLES
      - 03. INSERT FIRST ROW INTO RES_EMPLOYEE DATA TABLE TO FLAG TEST EXECUTION
      - 04. INSERT DATA INTO RES_EMPLOYEE DATA TABLE (NOTE: USER DEFINED VARIABLES)
      - 05. CREATE INDEX ON TABLE
      
      *********************************************************************************************************
      01. DROP TABLE STATEMENT
      ********************************************************************************************************/
      
      IF OBJECT_ID('RES_LEAVE') IS NOT NULL
      DROP TABLE RES_LEAVE
      
      /********************************************************************************************************
      02. CREATE EMPTY TABLES
      ********************************************************************************************************/
      
      CREATE TABLE [DBO].[RES_LEAVE]
      (
      EMPLOYEE_ID NVARCHAR(1000) NOT NULL
      ,SYSTEM_NAME NVARCHAR(1000) NULL
      ,EMPLOYEE_SYSTEM_ID NVARCHAR(1000) NOT NULL
      ,PAY_31 INT NULL
      ,PAY_32 INT NULL
      ,PAY_33 INT NULL
      ,PAY_34 INT NULL
      ,PAY_35 INT NULL
      ,PAY_36 INT NULL
      ,PAY_37 INT NULL
      ,PAY_38 INT NULL
      ,PAY_39 INT NULL
      ,PAY_40 INT NULL
      )
      
      /********************************************************************************************************
      03. INSERT FIRST ROW INTO RES_EMPLOYEE DATA TABLE TO FLAG TEST EXECUTION
      THIS INFORMATION IS REQUIRED BY QLIKVIEW
      ********************************************************************************************************/
      
      INSERT INTO [DBO].[RES_EMPLOYEE]
      (
      Employee_ID
      ,SYSTEM_NAME
      ,EMPLOYEE_SYSTEM_ID
      )
      VALUES
      (
      'PWC_TEST_EXECUTED'
      ,NULL
      ,'PWC_TEST_EXECUTED_'
      )
      
      /********************************************************************************************************
      04. INSERT DATA INTO RES_EMPLOYEE DATA TABLE
      NOTE: PLEASE NOTE THAT THERE ARE SOME DEFINED INFORMATION BEING USED FROM STORE.SETTING
      - 'AUDIT_PERIOD_START'
      - 'AUDIT_PERIOD_END'
      ********************************************************************************************************/
      
      INSERT INTO [DBO].[RES_LEAVE]
      (
      EMPLOYEE_ID
      ,SYSTEM_NAME
      ,EMPLOYEE_SYSTEM_ID
      )
      SELECT DISTINCT
      EMPLOYEE_ID
      ,ISNULL(SYSTEM_NAME,'')
      ,[EMPLOYEE_ID] + '_' + ISNULL([SYSTEM_NAME],'')
      FROM [DBO].[PREP_PAYSLIPS_DETAILS]
      
      
      /********************************************************************************************************
      05. CREATE INDEX ON TABLE
      ********************************************************************************************************/
      
      CREATE INDEX [ID_EMPLOYEE_ID]
      ON RES_LEAVE (
      EMPLOYEE_ID
      )
      
      CREATE INDEX [ID_EMPLOYEE_SYSTEM_ID]
      ON RES_LEAVE (
      EMPLOYEE_SYSTEM_ID
      )USE [z'9bbaf92f-d960-4e33-a9cd-228c72cc97ef]
GO
      /****** Object:  StoredProcedure [dbo].[15.BLD_RES_PAYSLIP]    Script Date: 4/10/2018 9:41:11 AM ******/
      SET ANSI_NULLS ON
      GO
      SET QUOTED_IDENTIFIER ON
      GO
      ALTER PROC [dbo].[15.BLD_RES_PAYSLIP]
      AS
      
      /*******************************************************************************************************
      *                           DATA ASSURANCE                                                             *
      ********************************************************************************************************
      UPDATES            - Version 0.1 {10/02/2015} {Simon Tsai} - {Creates the TEST RESULTS TABLE FOR PAYSLIP}
      - Version 0.2 {10/02/2015} {Avideep Agarwal} - {Reviewed}
      - Version 0.3 {24/02/2015} {Simon Tsai} - {Added PAY30}
      - Version 0.4 {04/03/2015} {Simon Tsai} - {Added Commentary}
      - Version 0.5 {11/03/2015} {Simon Tsai} - {Added payslip tests}
      
      SCRIPT DESCRIPTION - {Creates the empty results tables for PAYSLIP TESTS}
      
      TABLE INFORMATION
      INPUT TABLE(S)
      - N/A
      
      OUTPUT TABLE(S)
      - [DBO].[RES_PAYSLIP]
      
      SUMMARY OF SCRIPT  - 01. DROP TABLE STATEMENT
      - 02. CREATE EMPTY TABLES
      - 03. INSERT FIRST ROW INTO RES_PAYROLL DATA TABLE TO FLAG TEST EXECUTION
      - 04. INSERT DATA INTO RES_PAYROLL DATA TABLE
      - 05. CREATE INDEX ON TABLE
      
      ********************************************************************************************************
      01. DROP TABLE STATEMENT
      *******************************************************************************************************/
      
      IF OBJECT_ID('RES_PAYSLIP') IS NOT NULL
      DROP TABLE RES_PAYSLIP
      
      /*******************************************************************************************************
      02. CREATE EMPTY TABLES
      *******************************************************************************************************/
      
      CREATE TABLE [DBO].[RES_PAYSLIP]
      (
      PAYSLIP_ID NVARCHAR(1000) NOT NULL
      ,SYSTEM_NAME NVARCHAR(1000) NULL
      ,PAY_12 INT NULL
      ,PAY_13 INT NULL
      ,PAY_14 INT NULL
      ,PAY_15 INT NULL
      ,PAY_15_REASON NVARCHAR(1000)
      ,PAY_16 INT NULL
      ,PAY_17 INT NULL
      ,PAY_17_REASON NVARCHAR(1000)
      ,PAY_18 INT NULL
      ,PAY_19 INT NULL
      ,PAY_20 INT NULL
      ,PAY_21 INT NULL
      ,PAY_22 INT NULL
      ,PAY_23 INT NULL
      ,PAY_24 INT NULL
      ,PAY_30 INT NULL
      ,PAY_TB INT NULL
      ,PAY_EFT INT NULL
      )
      
      /*******************************************************************************************************
      03. INSERT FIRST ROW INTO RES_PAYROLL DATA TABLE TO FLAG TEST EXECUTION
      THIS INFORMATION IS REQUIRED BY QLIKVIEW
      *******************************************************************************************************/
      
      INSERT INTO [DBO].[RES_PAYSLIP]
      (
      PAYSLIP_ID
      ,SYSTEM_NAME
      )
      VALUES
      (
      'PWC_TEST_EXECUTED_'
      ,NULL
      )
      
      /*******************************************************************************************************
      04. INSERT DATA INTO RES_PAYROLL DATA TABLE
      *******************************************************************************************************/
      
      INSERT INTO [DBO].[RES_PAYSLIP]
      (
      PAYSLIP_ID
      ,SYSTEM_NAME
      )
      SELECT DISTINCT
      PAYSLIP_ID
      ,ISNULL(SYSTEM_NAME,'')
      FROM [DBO].[PREP_PAYSLIPS_HEADER]
      
      
      /*******************************************************************************************************
      05. CREATE INDEX ON TABLE
      *******************************************************************************************************/
      
      CREATE INDEX [ID_PAYSLIP_ID]
      ON [RES_PAYSLIP] (
      PAYSLIP_ID
      )USE [z'9bbaf92f-d960-4e33-a9cd-228c72cc97ef]
GO
      /****** Object:  StoredProcedure [dbo].[16.UPDATE_EMP_MASTER]    Script Date: 4/10/2018 9:41:31 AM ******/
      SET ANSI_NULLS ON
      GO
      SET QUOTED_IDENTIFIER ON
      GO
      
      ALTER PROC [dbo].[16.UPDATE_EMP_MASTER]
      AS
      
      /*********************************************************************************************************
      *                           DATA ASSURANCE                                                               *
      **********************************************************************************************************
      UPDATES            - Version 0.1 {11/02/2015} {Simon Tsai} - {Update emp master with PWC columns}
      - Version 0.2 {11/02/2015} {Avideep Agarwal} - {Reviewed}
      - Version 0.3 {04/03/2015} {Simon Tsai} - {Added Commentary}
      - Version 0.4 {18/04/2016} {Calum Stewart} - {Logic for calculating age updated}
      - Version 0.5 {22/08/2017} {Justin Moy} - {Changed logic to use period end date instead of
      data extraction date}
      
      SCRIPT DESCRIPTION - {Update emp master with PWC columns}
      
      
      TABLE INFORMATION
      INPUT TABLE(S)
      - N/A
      
      OUTPUT TABLE(S)
      - [DBO].[PREP_EMP_MASTER]
      
      SUMMARY OF SCRIPT  - 01. UPDATE PWC COLUMNS
      - 02. UPDATE PWC_EMPLOYEE_NAME
      - 03. UPDATE PWC_TERMINATION_DATE (NOTE: USER DEFINED VARIABLE)
      - 04. UPDATE PWC_AGE (NOTE: USER DEFINED VARIABLE)
      - 05. UPDATE PWC_TENURE (NOTE: USER DEFINED VARIABLE)
      - 06. UPDATE PWC_TOTAL_GROSS
      - 07. UPDATE PWC_TOTAL_NET
      - 08. UPDATE PWC_TOTAL_TAX
      - 09. UPDATE PWC_TOTAL_SUPER
      - 10. UPDATE PWC_PAYSLIP_COUNT
      - 11. UPDATE PWC_AGE_GROUP (NOTE: USER DEFINED VARIABLE)
      - 12. UPDATE PWC_TENURE_GROUP (NOTE: USER DEFINED VARIABLE)
      - 13. UPDATE PWC_TERMINATED_FLAG (NOTE: USER DEFINED VARIABLE)
      
      **********************************************************************************************************
      01. UPDATE PWC COLUMNS
      *********************************************************************************************************/
      
      UPDATE
      [dbo].[PREP_EMP_MASTER]
      SET
      
      /*********************************************************************************************************
      02. UPDATE PWC_EMPLOYEE_NAME
      TO CONTAIN ONLY ALPHABETS
      *********************************************************************************************************/
      
      PWC_EMPLOYEE_NAME = ISNULL(DBO.fn_StripCharacters(FIRST_NAME, '^A-Z'),'') + ' ' 
      + ISNULL(dbo.fn_StripCharacters(SURNAME, '^A-Z'),'')
      
      /*********************************************************************************************************
      03. UPDATE PWC_TERMINATION_DATE
      TO SET ANY SYSTEM DEFAULT DATES AS NULL
      *********************************************************************************************************/
      
      ,PWC_TERMINATION_DATE = CASE
      WHEN TERM_DATE = (SELECT STORE.Setting.Value 
      FROM [Store].[Setting] 
      WHERE STORE.Setting.[Key] = '1. Default system date') 
      THEN NULL
      ELSE TERM_DATE
      END
      
      /*********************************************************************************************************
      04. UPDATE PWC_AGE
      TO CALCULATE EMPLOYEE AGE AS AT THE DATE OF DATA EXTRACTION
      *********************************************************************************************************/
      --Original script
      --,PWC_AGE = DATEDIFF(YY,DOB,(SELECT STORE.Setting.Value 
      --						FROM [Store].[Setting] 
      --					WHERE STORE.Setting.[Key] = '2. Data extraction date'))
      
      
      ----New script updated by Calum Stewart on 18/04/2016								
      --    ,PWC_AGE = FLOOR(DATEDIFF(DAY,DOB,(SELECT STORE.Setting.Value 
      --								FROM [Store].[Setting] 
      --								WHERE STORE.Setting.[Key] = '2. Data extraction date'))/365)
      
      --now uses period end date, instead of data extraction date, JM 22/08/2017						
      ,PWC_AGE = FLOOR(DATEDIFF(DAY,DOB,(SELECT STORE.Setting.Value 
      FROM [Store].[Setting] 
      WHERE STORE.Setting.[Key] = 'AUDIT_PERIOD_END'))/365)
      
      
      
      
      
      
      /*********************************************************************************************************
      05. UPDATE PWC_TENURE
      TO CALCULATE EMPLOYEE TENURE AS AT THE DATE OF DATA EXTRACTION UNLESS EMPLOYEE IS ALREADY TERMINATED
      *********************************************************************************************************/
      
      ,PWC_TENURE = CASE
      WHEN ISNULL(TERM_DATE,'') = '' THEN 
      --DATEDIFF(DD,[START_DATE],(SELECT STORE.Setting.Value 
      --		FROM [Store].[Setting] 
      --		WHERE STORE.Setting.[Key] = '2. Data extraction date'))
      
      --now uses period end date, instead of data extraction date, JM 22/08/2017	
      DATEDIFF(DD,[START_DATE],(SELECT STORE.Setting.Value 
      FROM [Store].[Setting] 
      WHERE STORE.Setting.[Key] = 'AUDIT_PERIOD_END'))
      
      ELSE 
      DATEDIFF(DD,[START_DATE],TERM_DATE)
      END
      
      /*********************************************************************************************************
      06. UPDATE PWC_TOTAL_GROSS
      TO SUM ALL GROSS AMOUNT FOR THAT PARTICULAR EMPLOYEE FROM [PREP_PAYSLIPS_HEADER] TABLE
      *********************************************************************************************************/
      
      ,PWC_TOTAL_GROSS =
      (SELECT SUM(PWC_GROSS_AMOUNT)
      FROM [dbo].[PREP_PAYSLIPS_HEADER]
      WHERE [dbo].[PREP_EMP_MASTER].EMPLOYEE_ID = [dbo].[PREP_PAYSLIPS_HEADER].EMPLOYEE_ID)
      
      /*********************************************************************************************************
      07. UPDATE PWC_TOTAL_NET
      TO SUM ALL NET AMOUNT FOR THAT PARTICULAR EMPLOYEE FROM [PREP_PAYSLIPS_HEADER] TABLE
      *********************************************************************************************************/
      
      ,PWC_TOTAL_NET =
      (SELECT SUM([PWC_NET_AMOUNT])
      FROM [dbo].[PREP_PAYSLIPS_HEADER]
      WHERE [dbo].[PREP_EMP_MASTER].EMPLOYEE_ID = [dbo].[PREP_PAYSLIPS_HEADER].EMPLOYEE_ID)
      
      /*********************************************************************************************************
      08. UPDATE PWC_TOTAL_TAX
      TO SUM ALL TAX AMOUNT FOR THAT PARTICULAR EMPLOYEE FROM [PREP_PAYSLIPS_HEADER] TABLE
      *********************************************************************************************************/
      
      ,PWC_TOTAL_TAX =
      (SELECT SUM(TAX)	   
      FROM [dbo].[PREP_PAYSLIPS_HEADER]
      WHERE [dbo].[PREP_EMP_MASTER].EMPLOYEE_ID = [dbo].[PREP_PAYSLIPS_HEADER].EMPLOYEE_ID)
      
      /*********************************************************************************************************
      09. UPDATE PWC_TOTAL_SUPER
      TO SUM ALL SUPER AMOUNT FOR THAT PARTICULAR EMPLOYEE FROM [PREP_PAYSLIPS_HEADER] TABLE
      *********************************************************************************************************/
      
      ,PWC_TOTAL_SUPER =
      (SELECT SUM(SUPER)
      FROM [dbo].[PREP_PAYSLIPS_HEADER]
      WHERE [dbo].[PREP_EMP_MASTER].EMPLOYEE_ID = [dbo].[PREP_PAYSLIPS_HEADER].EMPLOYEE_ID)
      
      /*********************************************************************************************************
      10. UPDATE PWC_PAYSLIP_COUNT
      TO COUNT TOTAL PAYSLIPS FOR THAT PARTICULAR EMPLOYEE FROM [PREP_PAYSLIPS_HEADER] TABLE
      *********************************************************************************************************/
      
      ,PWC_PAYSLIP_COUNT =
      (SELECT COUNT(NT.PAYSLIP_ID)
      FROM (
      SELECT DISTINCT PAYSLIP_ID
      ,EMPLOYEE_ID
      FROM [dbo].[PREP_PAYSLIPS_HEADER]) AS NT
      WHERE [dbo].[PREP_EMP_MASTER].EMPLOYEE_ID = NT.EMPLOYEE_ID)
      
      UPDATE
      [dbo].[PREP_EMP_MASTER]
      SET
      
      /*********************************************************************************************************
      11. UPDATE PWC_AGE_GROUP
      TO CREATE BUCKETS FOR THE DIFFERENT PWC_AGE_GROUP
      NOTE: THE DEFINITION OF EACH BUCKET BELOW IS TO BE MANAGED BY THE USER
      *********************************************************************************************************/
      
      PWC_AGE_GROUP = CASE
      WHEN PWC_AGE < 0 THEN 'AGE IS BELOW 0'
      WHEN PWC_AGE < 14 THEN 'Under 14'
      WHEN PWC_AGE <= 18 THEN '14 - 18'
      WHEN PWC_AGE <= 24 THEN '19 - 24'
      WHEN PWC_AGE <= 44 THEN '25 - 44'
      WHEN PWC_AGE <= 64 THEN '45 - 64'
      WHEN PWC_AGE >= 65 THEN '65+'
      WHEN ISNULL(DOB,'') = '' THEN 'Missing date of birth'
      ELSE 'ERROR'
      END
      
      /*********************************************************************************************************
      12. UPDATE PWC_TENURE_GROUP
      TO CREATE BUCKETS FOR THE DIFFERENT PWC_TENURE_GROUP
      NOTE: THE DEFINITION OF EACH BUCKET BELOW IS TO BE MANAGED BY THE USER
      *********************************************************************************************************/
      
      ,PWC_TENURE_GROUP = CASE
      WHEN PWC_TENURE / 365 < 0 THEN 'NEGATIVE TENURE'
      WHEN PWC_TENURE / 365 < 1 THEN '< 1 year'
      WHEN PWC_TENURE / 365 < 2 THEN '1 - 2 years'
      WHEN PWC_TENURE / 365 < 5 THEN '2 - 5 years'
      WHEN PWC_TENURE / 365 < 10 THEN '5 - 10 years'
      WHEN PWC_TENURE / 365 < 20 THEN '10 - 20 years'
      WHEN PWC_TENURE / 365 >= 20 THEN '20+ years'
      WHEN ISNULL([START_DATE],'') = '' THEN 'Missing start date'
      ELSE 'ERROR'
      END
      
      /*********************************************************************************************************
      13. UPDATE PWC_TERMINATED_FLAG
      *********************************************************************************************************/
      
      ,PWC_TERMINATED_FLAG = CASE 
      WHEN ISNULL(PWC_TERMINATION_DATE,'') <> '' THEN 'Yes'
      ELSE 'No'
      ENDUSE [z'9bbaf92f-d960-4e33-a9cd-228c72cc97ef]
      GO
      /****** Object:  StoredProcedure [dbo].[17.TST_TERM_BEFORE_START]    Script Date: 4/10/2018 9:42:06 AM ******/
      SET ANSI_NULLS ON
      GO
      SET QUOTED_IDENTIFIER ON
      GO
      ALTER PROC [dbo].[17.TST_TERM_BEFORE_START]
      AS
      
      /*************************************************************************************************************
      *                           DATA ASSURANCE                                                                   *
      **************************************************************************************************************
      UPDATES            - Version 0.1 {05/02/2015} {Simon Tsai} - {Added test}
      - Version 0.2 {11/02/2015} {Avideep Agarwal} - {Reviewed}
      - Version 0.3 {04/03/2015} {Simon Tsai} - {Added Commentary}
      
      SCRIPT DESCRIPTION - {Creates the test to examine whether an employee's start date is 
      before their termination date}
      
      TABLE INFORMATION
      INPUT TABLE(S)
      - N/A
      
      OUTPUT TABLE(S)
      - [DBO].[RES_EMPLOYEE]
      
      SUMMARY OF SCRIPT  - 01. UPDATE TESTING TABLE
      - 02. UPDATE TESTING TABLE WITH INFORMATION REQUIRED BY QLIKVIEW
      
      **************************************************************************************************************
      01. UPDATE TESTING TABLE
      IF THE DIFFERENCE BETWEEN TERMINATION DATE AND START DATE IS NEGATIVE THEN THIS TEST WILL FLAG RESULT
      *************************************************************************************************************/
      
      UPDATE
      [dbo].[RES_EMPLOYEE]
      SET
      PAY_05 = CASE 
      WHEN EMPLOYEE_SYSTEM_ID IN 
      (SELECT DISTINCT
      [EMPLOYEE_ID] + '_' + ISNULL([SYSTEM_NAME],'') 
      FROM
      [dbo].[PREP_EMP_MASTER]
      WHERE
      DATEDIFF(DD, [START_DATE], PWC_TERMINATION_DATE) < 0 )
      THEN 1
      ELSE 0
      END
      
      /*************************************************************************************************************
      02. UPDATE TESTING TABLE WITH INFORMATION REQUIRED BY QLIKVIEW
      *************************************************************************************************************/
      
      UPDATE 
      [dbo].[RES_EMPLOYEE]
      SET
      PAY_05 = 1
      WHERE EMPLOYEE_SYSTEM_ID = 'PWC_TEST_EXECUTED_'
      USE [z'9bbaf92f-d960-4e33-a9cd-228c72cc97ef]
      GO
      /****** Object:  StoredProcedure [dbo].[18.TST_PAYSLIP_AFTER_TERMINATION]    Script Date: 4/10/2018 9:42:30 AM ******/
      SET ANSI_NULLS ON
      GO
      SET QUOTED_IDENTIFIER ON
      GO
      ALTER PROC [dbo].[18.TST_PAYSLIP_AFTER_TERMINATION]
      AS
      
      /*********************************************************************************************************************
      *                           DATA ASSURANCE                                                                           *
      **********************************************************************************************************************
      UPDATES            - Version 0.1 {11/02/2015} {Avideep Agarwal} - {Added test}
      - Version 0.2 {04/03/2015} {Simon Tsai} - {Added Commentary}
      
      SCRIPT DESCRIPTION - {Creates the test to examine whether an employee's start date is 
      before their termination date}
      
      TABLE INFORMATION
      INPUT TABLE(S)
      - N/A
      
      OUTPUT TABLE(S)
      - [DBO].[RES_EMPLOYEE]
      
      SUMMARY OF SCRIPT  - 01. UPDATE TESTING TABLE
      - 02. TESTING WHETHER PAYSLIP PAYMENT DATE IS AFTER EMPLOYEE TERMINATION DATE
      - 03. UPDATE TESTING TABLE WITH INFORMATION REQUIRED BY QLIKVIEW
      
      **********************************************************************************************************************
      01. UPDATE TESTING TABLE
      *********************************************************************************************************************/
      
      UPDATE
      [dbo].RES_PAYSLIP
      SET
      PAY_12 = CASE 
      WHEN PAYSLIP_ID IN (
      SELECT DISTINCT 
      P.PAYSLIP_ID
      FROM
      [DBO].[PREP_PAYSLIPS_HEADER] AS P
      LEFT JOIN
      (
      /*********************************************************************************************************************
      01A. FIND EMPLOYEES IN THE EMPLOYEE MASTER WHERE THERE ARE MORE THAN ONE ENTRY FOR THAT EMPLOYEE
      MOST LIKELY MEANS THE EMPLOYEE WAS TERMINATED AND THEN RE-HIRED LATER
      *********************************************************************************************************************/
      SELECT [MASTER].EMPLOYEE_ID AS EMPLOYEE_ID 
      ,PWC_TERMINATION_DATE AS PWC_TERMINATION_DATE
      ,SYSTEM_NAME AS SYSTEM_NAME
      FROM (
      SELECT DISTINCT EMPLOYEE_ID AS EMPLOYEE_ID
      FROM [dbo].[PREP_EMP_MASTER]
      GROUP BY EMPLOYEE_ID
      HAVING COUNT([STATUS]) > 1
      ) AS MULTIPLE_ENTRIES
      LEFT JOIN
      [dbo].[PREP_EMP_MASTER] AS [MASTER]
      ON MULTIPLE_ENTRIES.EMPLOYEE_ID = [MASTER].EMPLOYEE_ID
      WHERE STATUS = 'A'
      
      UNION ALL
      /*********************************************************************************************************************
      01B. FIND EMPLOYEES IN THE EMPLOYEE MASTER WHERE THERE ARE ONE ENTRY FOR THAT EMPLOYEE
      THESE ARE THE EMPLOYEE THAT ARE MOST LIKELY NOT TERMINATED AND RE-HIRED
      *********************************************************************************************************************/
      SELECT [MASTER].EMPLOYEE_ID AS EMPLOYEE_ID 
      ,PWC_TERMINATION_DATE AS PWC_TERMINATION_DATE
      ,SYSTEM_NAME AS SYSTEM_NAME
      FROM (
      SELECT DISTINCT EMPLOYEE_ID AS EMPLOYEE_ID
      FROM [dbo].[PREP_EMP_MASTER]
      GROUP BY EMPLOYEE_ID
      HAVING COUNT([STATUS]) = 1
      ) AS MULTIPLE_ENTRIES
      LEFT JOIN
      [dbo].[PREP_EMP_MASTER] AS [MASTER]
      ON MULTIPLE_ENTRIES.EMPLOYEE_ID = [MASTER].EMPLOYEE_ID
      ) AS E
      ON E.EMPLOYEE_ID = P.EMPLOYEE_ID
      AND ISNULL(E.SYSTEM_NAME,'') = ISNULL(P.SYSTEM_NAME,'')
      WHERE
      
      /*********************************************************************************************************************
      02. TESTING WHETHER PAYSLIP PAYMENT DATE IS AFTER EMPLOYEE TERMINATION DATE
      *********************************************************************************************************************/
      
      P.PAYMENT_DATE > E.PWC_TERMINATION_DATE)
      THEN 1
      ELSE 0
      END
      
      /*********************************************************************************************************************
      03. UPDATE TESTING TABLE WITH INFORMATION REQUIRED BY QLIKVIEW
      *********************************************************************************************************************/
      
      UPDATE 
      [dbo].RES_PAYSLIP
      SET
      PAY_12 = 1
      WHERE PAYSLIP_ID = 'PWC_TEST_EXECUTED_'
      
      USE [z'9bbaf92f-d960-4e33-a9cd-228c72cc97ef]
      GO
      /****** Object:  StoredProcedure [dbo].[19.TST_EMPLOYEE_WITH_ONE_PAYSLIP]    Script Date: 4/10/2018 9:44:52 AM ******/
      SET ANSI_NULLS ON
      GO
      SET QUOTED_IDENTIFIER ON
      GO
      ALTER PROC [dbo].[19.TST_EMPLOYEE_WITH_ONE_PAYSLIP]
      AS
      
      /*********************************************************************************************************************
      *                           DATA ASSURANCE                                                                           *
      **********************************************************************************************************************
      UPDATES            - Version 0.1 {11/02/2015} {Avideep Agarwal} - {Added test}
      - Version 0.2 {04/03/2015} {Simon Tsai} - {Added Commentary}
      
      SCRIPT DESCRIPTION - {Creates the test to examine whether an employee's start date is 
      before their termination date}
      
      TABLE INFORMATION
      INPUT TABLE(S)
      - N/A
      
      OUTPUT TABLE(S)
      - [DBO].[RES_EMPLOYEE]
      
      SUMMARY OF SCRIPT  - 01. UPDATE TESTING TABLE
      - 02. FOR EACH OF EMPLOYEE IDENTIFY THE EMPLOYEE WHICH ONLY HAS ONE UNIQUE PAYSLIP ID
      - 03. UPDATE TESTING TABLE WITH INFORMATION REQUIRED BY QLIKVIEW
      
      **********************************************************************************************************************
      01. UPDATE TESTING TABLE
      *********************************************************************************************************************/
      
      UPDATE
      [dbo].RES_PAYSLIP
      SET
      PAY_14 = CASE WHEN PAYSLIP_ID IN (
      SELECT 
      DISTINCT P.PAYSLIP_ID 
      FROM 
      [DBO].[PREP_PAYSLIPS_HEADER] AS P
      INNER JOIN
      (
      
      /*********************************************************************************************************************
      02. FOR EACH OF EMPLOYEE IDENTIFY THE EMPLOYEE WHICH ONLY HAS ONE UNIQUE PAYSLIP ID
      *********************************************************************************************************************/
      
      SELECT DISTINCT	P.EMPLOYEE_ID
      ,P.SYSTEM_NAME
      FROM
      [DBO].[PREP_PAYSLIPS_HEADER] AS P
      GROUP BY P.EMPLOYEE_ID
      ,P.SYSTEM_NAME
      HAVING
      COUNT(DISTINCT P.PAYSLIP_ID) = 1
      ) BASE
      ON BASE.EMPLOYEE_ID = P.EMPLOYEE_ID
      AND ISNULL(BASE.SYSTEM_NAME,'') = ISNULL(P.SYSTEM_NAME,'')
      )
      THEN 1
      ELSE 0
      END
      
      /*********************************************************************************************************************
      03. UPDATE TESTING TABLE WITH INFORMATION REQUIRED BY QLIKVIEW
      *********************************************************************************************************************/
      
      UPDATE 
      [dbo].RES_PAYSLIP
      SET
      PAY_14 = 1
      WHERE PAYSLIP_ID = 'PWC_TEST_EXECUTED_'
      
      USE [z'9bbaf92f-d960-4e33-a9cd-228c72cc97ef]
      GO
      /****** Object:  StoredProcedure [dbo].[20.TST_EMPLOYEE_MISSING_DATA]    Script Date: 4/10/2018 9:45:51 AM ******/
      SET ANSI_NULLS ON
      GO
      SET QUOTED_IDENTIFIER ON
      GO
      ALTER PROC [dbo].[20.TST_EMPLOYEE_MISSING_DATA]
      AS
      
      /*****************************************************************************************************************
      *                           DATA ASSURANCE                                                                       *
      ******************************************************************************************************************
      UPDATES            - Version 0.1 {11/02/2015} {Simon Tsai} - {Created test}
      - Version 0.2 {12/02/2015} {Simon Tsai} - {Added Scores}
      - Version 0.3 {04/03/2015} {Simon Tsai} - {Added Commentary}
      - Version 0.4 {21/06/2017} {Justin Moy} - {Added '(No missing data)' to PAY_03_REASON}
      
      SCRIPT DESCRIPTION - {Test for employees with missing master data}
      
      TABLE INFORMATION
      INPUT TABLE(S)
      - N/A
      
      OUTPUT TABLE(S)
      - [DBO].[RES_EMPLOYEE]
      
      SUMMARY OF SCRIPT  - 01. CREATE CTE FOR MISSING EMPLOYEE ADDRESS DETAILS
      - 02. CREATE CTE FOR MISSING EMPLOYEE BANK DETAILS
      - 03. CREATE CTE FOR MISSING EMPLOYEE CONTACT NUMBERS
      - 04. UPDATE RES_EMPLOYEE TABLE
      - 05. CREATE THE REASON STRING OF WHAT WAS MISSING FROM THE MASTER DATA
      - 06. JOIN ALL THREE CTE TABLES USING EMPLOYEE_ID AND SYSTEM_NAME
      - 07. UPDATE TESTING TABLE WITH INFORMATION REQUIRED BY QLIKVIEW
      
      ******************************************************************************************************************
      01. CREATE CTE FOR MISSING EMPLOYEE ADDRESS DETAILS
      INCLUDE REASON FOR WHICH ATTRIBUTE THE EMPLOYEE WAS MISSING
      *****************************************************************************************************************/
      
      ;WITH CTE_ADD
      AS
      (
      SELECT DISTINCT EMP_MAS.[EMPLOYEE_ID]
      ,CASE WHEN ISNULL(EMP_ADD.[EMPLOYEE_ID], '') = '' 
      THEN 1
      ELSE 0
      END AS [SCORE]
      ,CASE WHEN ISNULL(EMP_ADD.[EMPLOYEE_ID], '') = '' 
      THEN '@address@'
      ELSE ''
      END AS [ADDRESS_DESCRIPTION]
      ,EMP_MAS.[SYSTEM_NAME]
      ,CASE WHEN ISNULL(EMP_ADD.[EMPLOYEE_ID], '') = '' 
      THEN 'Address'
      ELSE ''
      END AS [MISSING]
      FROM [dbo].[PREP_EMP_MASTER] AS EMP_MAS
      LEFT JOIN
      [dbo].[PREP_EMP_ADDRESS] AS EMP_ADD
      ON EMP_MAS.[EMPLOYEE_ID] = EMP_ADD.[EMPLOYEE_ID]
      AND
      ISNULL(EMP_MAS.[SYSTEM_NAME], '') = ISNULL(EMP_ADD.[SYSTEM_NAME], '')
      )
      
      /*****************************************************************************************************************
      02. CREATE CTE FOR MISSING EMPLOYEE BANK DETAILS
      INCLUDE REASON FOR WHICH ATTRIBUTE THE EMPLOYEE WAS MISSING
      *****************************************************************************************************************/
      
      ,CTE_BANK
      AS
      (
      SELECT DISTINCT EMP_MAS.[EMPLOYEE_ID]
      ,CASE WHEN ISNULL(EMP_BANK.[EMPLOYEE_ID], '') = '' 
      THEN 1
      ELSE 0
      END AS [SCORE]
      ,CASE WHEN ISNULL(EMP_BANK.[EMPLOYEE_ID], '') = '' 
      THEN '@bank detail@'
      ELSE ''
      END AS [BANK_DESCRIPTION]
      ,CASE WHEN ISNULL(EMP_BANK.[EMPLOYEE_ID], '') = '' 
      THEN 'Bank'
      ELSE ''
      END AS [MISSING]
      ,EMP_MAS.[SYSTEM_NAME]
      FROM [dbo].[PREP_EMP_MASTER] AS EMP_MAS
      LEFT JOIN
      [dbo].[PREP_EMP_BANK_ACCOUNT] AS EMP_BANK
      ON EMP_MAS.[EMPLOYEE_ID] = EMP_BANK.[EMPLOYEE_ID]
      AND
      ISNULL(EMP_MAS.[SYSTEM_NAME], '') = ISNULL(EMP_BANK.[SYSTEM_NAME], '')
      )
      
      /*****************************************************************************************************************
      03. CREATE CTE FOR MISSING EMPLOYEE CONTACT NUMBERS
      INCLUDE REASON FOR WHICH ATTRIBUTE THE EMPLOYEE WAS MISSING
      *****************************************************************************************************************/
      
      ,CTE_NUMBER
      AS
      (
      SELECT DISTINCT EMP_MAS.[EMPLOYEE_ID]
      ,CASE WHEN ISNULL(EMP_NUM.[EMPLOYEE_ID], '') = '' 
      THEN 1
      ELSE 0
      END AS [SCORE]
      ,CASE WHEN ISNULL(EMP_NUM.[EMPLOYEE_ID], '') = '' 
      THEN '@number@'
      ELSE ''
      END AS [NUMBER_DESCRIPTION]
      ,CASE WHEN ISNULL(EMP_NUM.[EMPLOYEE_ID], '') = '' 
      THEN 'Contact number'
      ELSE ''
      END AS [MISSING]
      ,EMP_MAS.[SYSTEM_NAME]
      FROM [dbo].[PREP_EMP_MASTER] AS EMP_MAS
      LEFT JOIN
      [dbo].[PREP_EMP_NUMBER] AS EMP_NUM
      ON EMP_MAS.[EMPLOYEE_ID] = EMP_NUM.[EMPLOYEE_ID]
      AND
      ISNULL(EMP_MAS.[SYSTEM_NAME], '') = ISNULL(EMP_NUM.[SYSTEM_NAME], '')
      )
      
      /*****************************************************************************************************************
      04. UPDATE RES_EMPLOYEE TABLE
      *****************************************************************************************************************/
      
      UPDATE [DBO].[RES_EMPLOYEE]
      SET PAY_03 = CASE WHEN NT.REASON = '' 
      THEN 0
      ELSE NT.SCORE
      END
      ,PAY_03_REASON = CASE WHEN NT.REASON = '' 
      THEN '(No missing data)' --@@JM 21/06/2017
      ELSE NT.REASON
      END
      ,PAY_03_ADDRESS = NT.ADD_MISSING
      ,PAY_03_BANK = NT.BANK_MISSING
      ,PAY_03_NUMBER = NT.NUMBER_MISSING
      FROM [DBO].[RES_EMPLOYEE] AS RESULTS
      INNER JOIN (
      SELECT CTE_ADD.EMPLOYEE_ID
      
      /*****************************************************************************************************************
      05. CREATE THE REASON STRING OF WHAT WAS MISSING FROM THE MASTER DATA
      *****************************************************************************************************************/
      
      ,CASE WHEN [CTE_ADD].[ADDRESS_DESCRIPTION] + [CTE_BANK].[BANK_DESCRIPTION] 
      + [CTE_NUMBER].[NUMBER_DESCRIPTION] = '' 
      THEN ''
      ELSE 
      REPLACE(REPLACE('Missing' + [CTE_ADD].[ADDRESS_DESCRIPTION] + [CTE_BANK].[BANK_DESCRIPTION] 
      + [CTE_NUMBER].[NUMBER_DESCRIPTION] + 'from master data', '@@', ', '), '@', ' ')
      END AS [REASON]
      ,CTE_ADD.SCORE + CTE_BANK.SCORE + CTE_NUMBER.SCORE AS SCORE
      ,CTE_ADD.MISSING AS ADD_MISSING
      ,CTE_BANK.MISSING AS BANK_MISSING
      ,CTE_NUMBER.MISSING AS NUMBER_MISSING
      FROM CTE_ADD
      
      /*****************************************************************************************************************
      06. JOIN ALL THREE CTE TABLES USING EMPLOYEE_ID AND SYSTEM_NAME
      *****************************************************************************************************************/
      
      FULL OUTER JOIN
      CTE_BANK
      ON CTE_ADD.EMPLOYEE_ID = CTE_BANK.EMPLOYEE_ID
      AND 
      ISNULL(CTE_ADD.[SYSTEM_NAME], '') = ISNULL(CTE_BANK.[SYSTEM_NAME], '')
      FULL OUTER JOIN
      CTE_NUMBER
      ON CTE_ADD.EMPLOYEE_ID = CTE_NUMBER.EMPLOYEE_ID
      AND 
      ISNULL(CTE_ADD.[SYSTEM_NAME], '') = ISNULL(CTE_NUMBER.[SYSTEM_NAME], '')
      ) AS NT
      ON RESULTS.Employee_ID = NT.EMPLOYEE_ID
      
      /*****************************************************************************************************************
      07. UPDATE TESTING TABLE WITH INFORMATION REQUIRED BY QLIKVIEW
      *****************************************************************************************************************/
      
      UPDATE 
      [dbo].RES_EMPLOYEE
      SET
      PAY_03 = 1
      WHERE EMPLOYEE_SYSTEM_ID = 'PWC_TEST_EXECUTED_'USE [z'9bbaf92f-d960-4e33-a9cd-228c72cc97ef]
      GO
      /****** Object:  StoredProcedure [dbo].[21.TST_EMPLOYEE_WITH_ZERO_PAYSLIP]    Script Date: 4/10/2018 9:46:15 AM ******/
      SET ANSI_NULLS ON
      GO
      SET QUOTED_IDENTIFIER ON
      GO
      ALTER PROC [dbo].[21.TST_EMPLOYEE_WITH_ZERO_PAYSLIP]
      AS
      
      /**********************************************************************************************************************
      *                           DATA ASSURANCE                                                                            *
      ***********************************************************************************************************************
      UPDATES            - Version 0.1 {11/02/2015} {Simon Tsai} - {Added test}
      - Version 0.2 {04/03/2015} {Simon Tsai} - {Added Commentary}
      
      SCRIPT DESCRIPTION - {Creates the test to identify employee with no payslip}
      
      TABLE INFORMATION
      INPUT TABLE(S)
      - N/A
      
      OUTPUT TABLE(S)
      - [DBO].[RES_EMPLOYEE]
      
      SUMMARY OF SCRIPT  - 01. UPDATE [RES_EMPLOYEE] TESTING TABLE
      - 02. IGNORE ALL TERMINATED EMPLOYEES AS THEY ARE NOT EXPECTED TO HAVE PAYSLIPS
      - 03. UPDATE TESTING TABLE WITH INFORMATION REQUIRED BY QLIKVIEW
      
      ***********************************************************************************************************************
      01. UPDATE [RES_EMPLOYEE] TESTING TABLE
      **********************************************************************************************************************/
      
      UPDATE
      [dbo].[RES_EMPLOYEE]
      SET
      PAY_06 = CASE WHEN [dbo].[RES_EMPLOYEE].EMPLOYEE_SYSTEM_ID IN 
      (
      SELECT DISTINCT PREP_EMP_MASTER.EMPLOYEE_ID + '_' + ISNULL(PREP_EMP_MASTER.SYSTEM_NAME,'')
      FROM [dbo].[PREP_PAYSLIPS_HEADER]
      RIGHT JOIN
      [DBO].[PREP_EMP_MASTER]
      ON PREP_EMP_MASTER.EMPLOYEE_ID = PREP_PAYSLIPS_HEADER.EMPLOYEE_ID
      AND ISNULL(PREP_EMP_MASTER.SYSTEM_NAME,'') = ISNULL(PREP_PAYSLIPS_HEADER.SYSTEM_NAME,'')
      
      /**********************************************************************************************************************
      02. IGNORE ALL TERMINATED EMPLOYEES AS THEY ARE NOT EXPECTED TO HAVE PAYSLIPS
      **********************************************************************************************************************/
      
      WHERE PWC_TERMINATED_FLAG = 'No'
      AND PREP_PAYSLIPS_HEADER.EMPLOYEE_ID IS NULL
      ) 
      THEN 1
      ELSE 0
      END
      
      /*****************************************************************************************************************
      03. UPDATE TESTING TABLE WITH INFORMATION REQUIRED BY QLIKVIEW
      *****************************************************************************************************************/
      
      UPDATE 
      [dbo].RES_EMPLOYEE
      SET
      PAY_06 = 1
      WHERE EMPLOYEE_SYSTEM_ID = 'PWC_TEST_EXECUTED_'
      
      USE [z'9bbaf92f-d960-4e33-a9cd-228c72cc97ef]
      GO
      /****** Object:  StoredProcedure [dbo].[22.TST_EMPLOYEE_NOT_IN_MASTER]    Script Date: 4/10/2018 9:46:35 AM ******/
      SET ANSI_NULLS ON
      GO
      SET QUOTED_IDENTIFIER ON
      GO
      ALTER PROC [dbo].[22.TST_EMPLOYEE_NOT_IN_MASTER]
      AS
      
      /******************************************************************************************************************
      *                           DATA ASSURANCE                                                                        *
      *******************************************************************************************************************
      UPDATES            - Version 0.1 {11/02/2015} {Simon Tsai} - {Notes}
      - Version 0.2 {04/03/2015} {Simon Tsai} - {Added Commentary}
      
      SCRIPT DESCRIPTION - {Employees not in master}
      
      TABLE INFORMATION
      INPUT TABLE(S)
      - N/A
      
      OUTPUT TABLE(S)
      - [dbo].[RES_PAYSLIP]
      
      SUMMARY OF SCRIPT  - 01. INSERT DATA
      - 02. COMPARE PAYSLIP WITH EMPLOYEES IN THE EMPLOYEE MASTER TABLE
      - 03. UPDATE TESTING TABLE WITH INFORMATION REQUIRED BY QLIKVIEW
      
      *******************************************************************************************************************
      01. INSERT DATA
      ******************************************************************************************************************/
      
      UPDATE
      [dbo].[RES_PAYSLIP]
      SET
      PAY_16 = CASE WHEN [dbo].[RES_PAYSLIP].[PAYSLIP_ID] IN 
      (
      SELECT RPT.[PAYSLIP_ID]
      
      /******************************************************************************************************************
      02. COMPARE PAYSLIP WITH EMPLOYEES IN THE EMPLOYEE MASTER TABLE TO SEE IF THERE ARE ANY MISSING EMPLOYEES
      ******************************************************************************************************************/
      
      FROM [dbo].[PREP_PAYSLIPS_HEADER] AS RPT
      LEFT JOIN 
      [dbo].[PREP_EMP_MASTER] AS PEM
      ON RPT.EMPLOYEE_ID = PEM.EMPLOYEE_ID
      WHERE PEM.EMPLOYEE_ID IS NULL 
      ) 
      THEN 1
      ELSE 0
      END
      
      /*****************************************************************************************************************
      03. UPDATE TESTING TABLE WITH INFORMATION REQUIRED BY QLIKVIEW
      *****************************************************************************************************************/
      
      UPDATE 
      [dbo].RES_PAYSLIP
      SET
      PAY_16 = 1
      WHERE PAYSLIP_ID = 'PWC_TEST_EXECUTED_'
      
      USE [z'9bbaf92f-d960-4e33-a9cd-228c72cc97ef]
      GO
      /****** Object:  StoredProcedure [dbo].[23.TST_PAYROLL_POSITION_OVERLAP]    Script Date: 4/10/2018 9:47:47 AM ******/
      SET ANSI_NULLS ON
      GO
      SET QUOTED_IDENTIFIER ON
      GO
      ALTER PROC [dbo].[23.TST_PAYROLL_POSITION_OVERLAP]
      AS
      
      /********************************************************************************************************************
      *                           DATA ASSURANCE                                                                          *
      *********************************************************************************************************************
      UPDATES            - Version 0.1 {11/02/2015} {Simon Tsai} - {Created tests}
      - Version 0.2 {04/03/2015} {Simon Tsai} - {Added Commentary}
      
      SCRIPT DESCRIPTION - {Creates the test for payroll position overlap}
      
      TABLE INFORMATION
      INPUT TABLE(S)
      - N/A
      
      OUTPUT TABLE(S)
      - [DBO].[PREP_EMP_POSITION_HISTORY]
      
      SUMMARY OF SCRIPT  - 01. CREATE CTE OF ALL EMPLOYEES THAT HAS CHANGED / HAVE MULTIPLE JOB_ID
      - 02. UPDATE [RES_EMPLOYEE] TEST RESULTS TABLE
      - 03. COMPARE JOB_ID + 1 WITH JOB_ID TO SEE IF THE STARTING DATE OF JOB_ID + 1 IS BEFORE END 
      DATE OF JOB_ID
      - 04. UPDATE TESTING TABLE WITH INFORMATION REQUIRED BY QLIKVIEW
      
      *********************************************************************************************************************
      01. CREATE CTE OF ALL EMPLOYEES THAT HAS CHANGED / HAVE MULTIPLE JOB_ID
      RETURN ALL LINES FOR EACH EMPLOYEES THAT HAS CHANGED / HAVE MULTIPLE JOB_ID
      ********************************************************************************************************************/
      
      ;WITH CTE_EMPLOYEE_CHANGED_JOB
      AS
      (
      SELECT DISTINCT EMPLOYEE_ID
      ,JOB_ID
      ,SYSTEM_NAME
      ,PWC_EARLIEST_POSITION_START_DATE
      ,PWC_LATEST_POSITION_END_DATE
      FROM [dbo].[PREP_EMP_POSITION_HISTORY] AS ORIGINAL
      WHERE ORIGINAL.EMPLOYEE_ID IN
      (
      SELECT DISTINCT PEPH.EMPLOYEE_ID 
      FROM dbo.PREP_EMP_POSITION_HISTORY AS PEPH
      GROUP BY PEPH.EMPLOYEE_ID
      HAVING COUNT(DISTINCT PEPH.JOB_ID) > 1
      )
      )
      
      /********************************************************************************************************************
      02. UPDATE [RES_EMPLOYEE] TEST RESULTS TABLE
      ********************************************************************************************************************/
      
      UPDATE [DBO].[RES_EMPLOYEE]
      SET PAY_11 = CASE WHEN [DBO].[RES_EMPLOYEE].EMPLOYEE_SYSTEM_ID IN (
      SELECT DISTINCT ISNULL(JOB_A.EMPLOYEE_ID,'PWC_UNKNOWN') + '_' + ISNULL(JOB_A.SYSTEM_NAME, '')
      FROM CTE_EMPLOYEE_CHANGED_JOB AS JOB_A
      INNER JOIN
      CTE_EMPLOYEE_CHANGED_JOB AS JOB_B
      
      /********************************************************************************************************************
      03. COMPARE JOB_ID + 1 WITH JOB_ID TO SEE IF THE STARTING DATE OF JOB_ID + 1 IS BEFORE END DATE OF JOB_ID
      ********************************************************************************************************************/
      
      ON JOB_A.EMPLOYEE_ID = JOB_B.EMPLOYEE_ID 
      AND JOB_A.JOB_ID > JOB_B.JOB_ID 
      AND ISNULL(JOB_A.SYSTEM_NAME,'') = ISNULL(JOB_B.SYSTEM_NAME, '')
      WHERE DATEDIFF(DD,JOB_A.PWC_EARLIEST_POSITION_START_DATE,JOB_B.PWC_LATEST_POSITION_END_DATE) > 0)
      THEN 1
      ELSE 0
      END
      
      /*****************************************************************************************************************
      04. UPDATE TESTING TABLE WITH INFORMATION REQUIRED BY QLIKVIEW
      *****************************************************************************************************************/
      
      UPDATE 
      [dbo].RES_EMPLOYEE
      SET
      PAY_11 = 1
      WHERE EMPLOYEE_SYSTEM_ID = 'PWC_TEST_EXECUTED_'
      USE [z'9bbaf92f-d960-4e33-a9cd-228c72cc97ef]
      GO
      /****** Object:  StoredProcedure [dbo].[24.TST_ROUND_DOLLAR_PAYSLIP]    Script Date: 4/10/2018 9:48:06 AM ******/
      SET ANSI_NULLS ON
      GO
      SET QUOTED_IDENTIFIER ON
      GO
      ALTER PROC [dbo].[24.TST_ROUND_DOLLAR_PAYSLIP]
      AS
      
      /***************************************************************************************************************
      *                           DATA ASSURANCE                                                                     *
      ****************************************************************************************************************
      UPDATES            - Version 0.1 {11/02/2015} {Simon Tsai} - {Created Test}
      - Version 0.2 {04/03/2015} {Simon Tsai) - {Added Commentary)
      
      SCRIPT DESCRIPTION - {Payroll slip with round number testing}
      
      TABLE INFORMATION
      INPUT TABLE(S)
      - N/A
      
      OUTPUT TABLE(S)
      - [dbo].[RES_PAYSLIP]
      
      SUMMARY OF SCRIPT  - 01. DECLARE WHAT IS ROUND NUMBER AND MINIMUM FLOOR VALUE
      - 02. CREATE CTE TO IDENTIFY PAYSLIP WITH ROUND BASE VALUE OR ROUND OVERTIME VALUE
      - 03. UPDATE [RES_PAYSLIP] TEST RESULTS TABLE
      - 04. CREATE THE REASON STRING TO SPECIFY WHICH VALUE WAS ROUND
      - 05. UPDATE TESTING TABLE WITH INFORMATION REQUIRED BY QLIKVIEW
      
      ****************************************************************************************************************
      01. DECLARE WHAT IS ROUND NUMBER AND MINIMUM FLOOR VALUE
      ***************************************************************************************************************/
      
      DECLARE @Payslip_Rnd_Amt_Div INT
      DECLARE @Payslip_Rnd_Amt_Min INT
      
      SET @Payslip_Rnd_Amt_Div = CONVERT(MONEY,(SELECT VALUE
      FROM dbo.REF_PARAMETERS
      WHERE PARAMETER_ID = 'Payslip_Rnd_Amt_Div'))
      
      SET @Payslip_Rnd_Amt_Min = CONVERT(MONEY,(SELECT VALUE
      FROM dbo.REF_PARAMETERS
      WHERE PARAMETER_ID = 'Payslip_Rnd_Amt_Min'))
      
      /***************************************************************************************************************
      02. CREATE CTE TO IDENTIFY PAYSLIP WITH ROUND BASE VALUE OR ROUND OVERTIME VALUE
      ***************************************************************************************************************/
      
      ;WITH CTE_ROUNDING
      AS
      (
      SELECT DISTINCT PAYSLIP_ID
      ,CASE WHEN ((BASE_VALUE / @Payslip_Rnd_Amt_Div ) = FLOOR(BASE_VALUE / @Payslip_Rnd_Amt_Div) 
      AND BASE_VALUE > @Payslip_Rnd_Amt_Min)
      THEN '@Base value@'
      ELSE ''
      END AS BASE_REASON
      ,CASE WHEN ((OVERTIME_VALUE / @Payslip_Rnd_Amt_Div ) = FLOOR(OVERTIME_VALUE /@Payslip_Rnd_Amt_Div) 
      AND OVERTIME_VALUE > @Payslip_Rnd_Amt_Min)
      THEN '@Overtime value@'
      ELSE ''
      END AS OVERTIME_REASON
      FROM [dbo].[PREP_PAYSLIPS_HEADER]
      )
      
      /***************************************************************************************************************
      03. UPDATE [RES_PAYSLIP] TEST RESULTS TABLE
      ***************************************************************************************************************/
      
      UPDATE 
      [dbo].[RES_PAYSLIP]
      SET
      PAY_15 = CASE WHEN NT.REASON = '' 
      THEN 0
      ELSE 1
      END
      ,PAY_15_REASON = NT.REASON
      FROM [dbo].[RES_PAYSLIP] AS RESULTS
      INNER JOIN
      (
      
      /***************************************************************************************************************
      04. CREATE THE REASON STRING TO SPECIFY WHICH VALUE WAS ROUND
      ***************************************************************************************************************/
      
      SELECT DISTINCT PAYSLIP_ID
      ,REPLACE(REPLACE(BASE_REASON + OVERTIME_REASON,'@@',' and '),'@','') AS REASON
      FROM CTE_ROUNDING
      ) AS NT
      ON NT.PAYSLIP_ID = RESULTS.PAYSLIP_ID
      
      /*****************************************************************************************************************
      05. UPDATE TESTING TABLE WITH INFORMATION REQUIRED BY QLIKVIEW
      *****************************************************************************************************************/
      
      UPDATE 
      [dbo].RES_PAYSLIP
      SET
      PAY_15 = 1
      WHERE PAYSLIP_ID = 'PWC_TEST_EXECUTED_'
      
      USE [z'9bbaf92f-d960-4e33-a9cd-228c72cc97ef]
      GO
      /****** Object:  StoredProcedure [dbo].[25.TST_PAYSLIPS_TO_EFT]    Script Date: 4/10/2018 9:48:31 AM ******/
      SET ANSI_NULLS ON
      GO
      SET QUOTED_IDENTIFIER ON
      GO
      ALTER PROC [dbo].[25.TST_PAYSLIPS_TO_EFT]
      AS
      
      /**********************************************************************************************************
      *                           DATA ASSURANCE                                                                *
      ***********************************************************************************************************
      UPDATES            - Version 0.1 {11/02/2015} {Simon Tsai} - {Added Test}
      - Version 0.2 {11/02/2015} {Avideep Agarwal} - {Reviewed}
      - Version 0.3 {04/03/2015} {Simon Tsai} - {Added Commentary}
      - Version 0.4 {20/08/2015} {Fei Li}- {Include missing EFT/payslip and reconciliation flag}
      - Version 0.5 {17/02/2015} {Calum Stewart, Fei Li} - {Comment out the unnecessary fields in the EFT}
      - Version 0.6 {18/02/2015} {Fei Li} - {Edited System_Name}
      - Version 0.7 {21/06/2017} {Justin Moy} - {Added company to final join)
      
      SCRIPT DESCRIPTION - {test payslips to eft}
      
      TABLE INFORMATION
      INPUT TABLE(S)
      - N/A
      
      OUTPUT TABLE(S)
      - [DBO].[RES_PAYSLIP_EFT]
      
      SUMMARY OF SCRIPT  - 01. DROP TABLE STATEMENT
      - 02. INSERT DATA
      - 03. CREATE CTE FROM THE BANK EFT TO SUMMARIZE THE PAY DETAIL
      - 04. COMBINE THE PAYSLIP CTE WITH THE BANK EFT CTE TO PERFORM RECONCILIATION TEST
      
      ***********************************************************************************************************
      01. DROP TABLE STATEMENT
      **********************************************************************************************************/
      
      IF OBJECT_ID('RES_PAYSLIP_EFT') IS NOT NULL
      DROP TABLE RES_PAYSLIP_EFT
      
      /**********************************************************************************************************
      02. CREATE CTE FROM THE PAYSLIP HEADER TABLE TO SUMMARIZE ALL PAY DETAIL
      FOR THAT PARTICULAR EMPLOYEE AND PAY PERIOD
      **********************************************************************************************************/
      
      ;WITH CTE_PAYROLL
      AS
      (
      SELECT
      PP.EMPLOYEE_ID
      ,PP.[PAYMENT_DATE]
      ,PP.[SYSTEM_NAME]
      ,PP.[PAYSLIP_ID]
      ,PP.COMPANY --@@JM 21/06/2017
      ,SUM(PP.[ADDITIONS_BEFORE_TAX]) AS ALLOWANCE
      ,SUM(PP.[DEDUCTIONS_BEFORE_TAX]) AS BENEFIT
      ,SUM(PP.DEDUCTIONS_AFTER_TAX) AS DEDUCTION
      ,SUM(PP.[BASE_VALUE]) AS SALARY
      ,SUM(PP.OVERTIME_VALUE) AS OVERTIME_VALUE
      ,SUM(PP.[TAX]) AS TAX
      ,SUM(PP.PWC_NET_AMOUNT) AS NET_PAY
      FROM
      [dbo].[PREP_PAYSLIPS_HEADER] AS PP
      GROUP BY
      PP.[PAYSLIP_ID]
      ,PP.EMPLOYEE_ID
      ,PP.[PAYMENT_DATE]
      ,PP.SYSTEM_NAME
      ,PP.COMPANY --@@JM 21/06/2017
      )
      
      
      
      /**********************************************************************************************************
      03. CREATE CTE FROM THE BANK EFT TO SUMMARIZE THE PAY DETAIL
      PER EMPLOYEE AND PAY PERIOD
      **********************************************************************************************************/
      
      ,CTE_BANK_EFT
      AS 
      (
      SELECT
      PD.EMPLOYEE_ID
      --,PD.PAYGRP_DESC
      ,PD.PAYPERNO
      ,PD.PAYPERYR
      --,PD.PERIOD_END_DATE
      --,PD.DISBURSE_DATE
      ,SUM(PD.AMOUNT) AS NETPAY
      --,PAYPERNO AS PAY_RUN_ID
      ,SYSTEM_NAME
      --,PD.CHEQUE_DATE
      FROM [dbo].[PREP_BANK_EFT] AS PD
      GROUP BY
      PD.EMPLOYEE_ID
      --,PD.PAYGRP_DESC
      ,PD.PAYPERNO
      ,PD.PAYPERYR
      --,PD.PERIOD_END_DATE
      --,DISBURSE_DATE
      --,PD.EMPLOYEE_ID + '_' + PAYPERNO
      ,SYSTEM_NAME
      --,CHEQUE_DATE
      )
      
      /**********************************************************************************************************
      04. COMBINE THE PAYSLIP CTE WITH THE BANK EFT CTE TO PERFORM RECONCILIATION TEST 
      **********************************************************************************************************/
      
      SELECT 
      ISNULL(PD.EMPLOYEE_ID,PP.EMPLOYEE_ID) AS EMPLOYEE_ID 
      ,ISNULL(PD.SYSTEM_NAME,ISNULL(PP.SYSTEM_NAME, '')) AS SYSTEM_NAME
      ,ISNULL(PD.EMPLOYEE_ID,PP.EMPLOYEE_ID) + '_' + ISNULL(PD.SYSTEM_NAME,ISNULL(PP.SYSTEM_NAME, ''))	AS EMPLOYEE_SYSTEM_ID
      ,ISNULL(PD.PAYPERNO,PP.PAYSLIP_ID)  AS [Period_No]
      ,PD.PAYPERYR AS [Year]
      ,PD.NETPAY AS [Net_Pay_EFT]
      ,PP.[PAYMENT_DATE] AS PAYMENT_DATE
      ,PP.NET_PAY AS [PwC_Net_Pay_Payslips]
      ,ISNULL(PD.NETPAY,0) - ISNULL(PP.NET_PAY,0) AS [Difference]
      ,CASE WHEN PD.NETPAY IS NULL
      THEN 'MissingEFT'
      WHEN PP.NET_PAY IS NULL 
      THEN 'MissingPayslip'
      WHEN PD.NETPAY IS NOT NULL AND PP.NET_PAY IS NOT NULL AND (ISNULL(PD.NETPAY,0) - ISNULL(PP.NET_PAY,0))<0
      THEN 'Underpaid'
      WHEN PD.NETPAY IS NOT NULL AND PP.NET_PAY IS NOT NULL AND (ISNULL(PD.NETPAY,0) - ISNULL(PP.NET_PAY,0))>0
      THEN 'Overpaid'
      ELSE 'Reconciliation'
      END AS [RECONCILIATION_FLAG]
      INTO
      [DBO].[RES_PAYSLIP_EFT]
      FROM 
      CTE_BANK_EFT AS PD
      FULL JOIN
      CTE_PAYROLL AS PP
      --ON PP.EMPLOYEE_ID=PD.EMPLOYEE_ID AND PD.[CHEQUE_DATE]=PP.[PAYMENT_DATE]
      ON PP.[PAYSLIP_ID]= PD.PAYPERNO 
      --AND ISNULL(PP.SYSTEM_NAME,'') = ISNULL(PD.SYSTEM_NAME,'')   
      LEFT JOIN
      dbo.PREP_EMP_MASTER AS PEM
      ON PEM.EMPLOYEE_ID = PD.EMPLOYEE_ID AND PEM.COMPANY = PP.COMPANY --@@JM 21/06/2017
      AND ISNULL(PEM.SYSTEM_NAME,'') = ISNULL(PD.SYSTEM_NAME,'')
      USE [z'9bbaf92f-d960-4e33-a9cd-228c72cc97ef]
      GO
      /****** Object:  StoredProcedure [dbo].[26.TST_MULTIPLE_PAYSLIP]    Script Date: 4/10/2018 9:52:02 AM ******/
      SET ANSI_NULLS ON
      GO
      SET QUOTED_IDENTIFIER ON
      GO
      ALTER PROC [dbo].[26.TST_MULTIPLE_PAYSLIP]
      AS
      
      /***********************************************************************************************************
      *                           DATA ASSURANCE                                                                 *
      ************************************************************************************************************
      UPDATES            - Version 0.1 {11/02/2015} {Simon Tsai} - {Created tests}
      - Version 0.2 {04/03/2015} {Simon Tsai} - {Added Commentary}
      - Version 0.3 {28/08/2015} {Fei Li}	- {Modify multiple payslip test considering same amount}
      
      SCRIPT DESCRIPTION - {Creates the test for payroll MULTIPLE PAYSLIP}
      
      TABLE INFORMATION
      INPUT TABLE(S)
      - N/A
      
      OUTPUT TABLE(S)
      - [dbo].[RES_PAYSLIP]
      
      SUMMARY OF SCRIPT  - 01. CREATE CTE TO GROUP DISTINCT EMPLOYEE_ID 
      - 02. CREATE CTE TO CONCATENATE LIST OF REASONS TOGETHER FOR EACH PAYSLIP ID
      - 03. UPDATE [RES_PAYSLIP] TEST RESULTS TABLE WITH TEST RESULTS
      - 04. UPDATE TESTING TABLE WITH INFORMATION REQUIRED BY QLIKVIEW
      
      ************************************************************************************************************
      01. CREATE CTE TO GROUP DISTINCT EMPLOYEE_ID 
      PER PERIOD, PAYSLIP AND DESCRIPTION
      ***********************************************************************************************************/
      
      ;WITH CTE_PD
      AS
      (
      SELECT DISTINCT			   
      EMPLOYEE_ID
      ,PAY_PERIOD
      ,PAYSLIP_ID
      ,[PAYCODE_DESC]
      ,[PAYCODE_ID]
      FROM 
      [dbo].[PREP_PAYSLIPS_DETAILS]
      GROUP BY 
      EMPLOYEE_ID
      ,PAY_PERIOD
      ,PAYSLIP_ID
      ,[PAYCODE_DESC]
      ,[PAYCODE_ID]
      HAVING COUNT(DISTINCT AMOUNT)>1
      )
      
      /***********************************************************************************************************
      02. CREATE CTE TO CONCATENATE LIST OF REASONS TOGETHER FOR EACH PAYSLIP ID
      IF THERE ARE MORE THAN ONE PAY_RUN_ID PER EMPLOYEE IN THE SAME PAY_PERIOD
      ***********************************************************************************************************/
      
      ,CTE_REASON
      AS
      (
      SELECT DISTINCT PAYSLIP_ID 
      ,STUFF((SELECT ',' + [PAYCODE_DESC]
      FROM CTE_PD PD_1
      WHERE PD_1.PAYSLIP_ID = PD_2.PAYSLIP_ID
      FOR XML PATH('')),1,1,'') AS REASON
      FROM CTE_PD PD_2
      )
      
      /***********************************************************************************************************
      03. UPDATE [RES_PAYSLIP] TEST RESULTS TABLE WITH TEST RESULTS
      ***********************************************************************************************************/
      
      UPDATE [dbo].[RES_PAYSLIP]
      SET PAY_17 = CASE
      WHEN [dbo].[RES_PAYSLIP].PAYSLIP_ID IN (SELECT DISTINCT CTE_REASON.PAYSLIP_ID FROM CTE_REASON) THEN 1
      ELSE 0
      END
      ,PAY_17_REASON = CASE 
      WHEN [dbo].[RES_PAYSLIP].PAYSLIP_ID IN (SELECT DISTINCT CTE_REASON.PAYSLIP_ID FROM CTE_REASON) THEN
      (SELECT DISTINCT CTE_REASON.REASON 
      FROM CTE_REASON 
      WHERE CTE_REASON.PAYSLIP_ID =  [dbo].[RES_PAYSLIP].PAYSLIP_ID)
      ELSE NULL
      END
      
      /***********************************************************************************************************
      04. UPDATE TESTING TABLE WITH INFORMATION REQUIRED BY QLIKVIEW
      ***********************************************************************************************************/
      
      UPDATE 
      [dbo].RES_PAYSLIP
      SET
      PAY_17 = 1
      WHERE PAYSLIP_ID = 'PWC_TEST_EXECUTED_'USE [z'9bbaf92f-d960-4e33-a9cd-228c72cc97ef]
      GO
      /****** Object:  StoredProcedure [dbo].[27.TST_PAYSLIP_PROCESSED_ON_WEEKEND]    Script Date: 4/10/2018 9:52:29 AM ******/
      SET ANSI_NULLS ON
      GO
      SET QUOTED_IDENTIFIER ON
      GO
      ALTER PROC [dbo].[27.TST_PAYSLIP_PROCESSED_ON_WEEKEND]
      AS
      
      /***********************************************************************************************************************
      *                           DATA ASSURANCE                                                                             *
      ************************************************************************************************************************
      UPDATES            - Version 0.1 {12/02/2015} {Simon Tsai} - {Created tests}
      - Version 0.2 {04/03/2015} {Simon Tsai} - {Added Commentary}
      
      SCRIPT DESCRIPTION - {Creates the test for payroll processed on weekend}
      
      TABLE INFORMATION
      INPUT TABLE(S)
      - [dbo].[PREP_PAYSLIPS_HEADER]
      
      OUTPUT TABLE(S)
      - [dbo].[RES_PAYSLIP]
      
      SUMMARY OF SCRIPT  - 01. UPDATE [RES_PAYSLIP] TEST RESULTS TABLE 
      - 02. TEST WHETHER PAYMENT DATE IS ON SATURDAY OR SUNDAY
      - 03. UPDATE TESTING TABLE WITH INFORMATION REQUIRED BY QLIKVIEW
      
      ************************************************************************************************************************
      01. UPDATE [RES_PAYSLIP] TEST RESULTS TABLE 
      ***********************************************************************************************************************/
      
      UPDATE [dbo].[RES_PAYSLIP]
      SET PAY_20 = CASE 
      WHEN [dbo].[RES_PAYSLIP].[PAYSLIP_ID] IN
      (
      SELECT DISTINCT PAYSLIP_ID
      FROM [dbo].[PREP_PAYSLIPS_HEADER]
      
      /***********************************************************************************************************************
      02. TEST WHETHER PAYMENT DATE IS ON SATURDAY OR SUNDAY
      ***********************************************************************************************************************/
      
      WHERE ((DATEPART(DW, PAYMENT_DATE) + @@DATEFIRST) % 7) IN (0,1)
      ) THEN 1
      ELSE 0
      END
      
      /**********************************************************************************************************************
      03. UPDATE TESTING TABLE WITH INFORMATION REQUIRED BY QLIKVIEW
      **********************************************************************************************************************/
      
      UPDATE 
      [dbo].RES_PAYSLIP
      SET
      PAY_20 = 1
      WHERE PAYSLIP_ID = 'PWC_TEST_EXECUTED_'
      
      USE [z'9bbaf92f-d960-4e33-a9cd-228c72cc97ef]
      GO
      /****** Object:  StoredProcedure [dbo].[28.TST_EFT_PROCESSED_ON_WEEKEND]    Script Date: 4/10/2018 9:52:55 AM ******/
      SET ANSI_NULLS ON
      GO
      SET QUOTED_IDENTIFIER ON
      GO
      ALTER PROC [dbo].[28.TST_EFT_PROCESSED_ON_WEEKEND]
      AS
      
      /*******************************************************************************************************************
      *                           DATA ASSURANCE                                                                         *
      ********************************************************************************************************************
      UPDATES            - Version 0.1 {12/02/2015} {Simon Tsai} - {Created tests}
      - Version 0.2 {04/03/2015} {Simon Tsai} - {Added Commentary}
      - Version 0.3 {20/08/2015} {Fei Li} - {Updated Joined Key}
      
      SCRIPT DESCRIPTION - {Creates the test for EFT processed on weekend}
      
      TABLE INFORMATION
      INPUT TABLE(S)
      - [dbo].[PREP_BANK_EFT]
      
      OUTPUT TABLE(S)
      - [dbo].[RES_PAYSLIP]
      
      SUMMARY OF SCRIPT  - 01. UPDATE [RES_PAYSLIP] TEST RESULTS TABLE
      - 02. TEST TO SEE IF DISBURSEMENT DATE WAS ON A SATURDAY OR SUNDAY
      - 03. UPDATE TESTING TABLE WITH INFORMATION REQUIRED BY QLIKVIEW
      
      ********************************************************************************************************************
      01. UPDATE [RES_PAYSLIP] TEST RESULTS TABLE
      *******************************************************************************************************************/
      
      UPDATE [dbo].[RES_PAYSLIP]
      SET PAY_21 = CASE 
      WHEN [dbo].[RES_PAYSLIP].[PAYSLIP_ID] IN
      (
      SELECT DISTINCT HEADER.PAYSLIP_ID
      FROM [dbo].[PREP_PAYSLIPS_HEADER] AS HEADER
      LEFT JOIN
      [dbo].[PREP_BANK_EFT] AS EFT
      ON  EFT.PAYPERNO = HEADER.PAYSLIP_ID
      WHERE NOT ISNULL(HEADER.PAYMENT_DATE,'') = ''
      
      /*******************************************************************************************************************
      02. TEST TO SEE IF DISBURSEMENT DATE WAS ON A SATURDAY OR SUNDAY
      *******************************************************************************************************************/
      AND ((DATEPART(DW, EFT.DISBURSE_DATE) + @@DATEFIRST) % 7) IN (0,1)
      ) THEN 1
      ELSE 0
      END
      
      /**********************************************************************************************************************
      03. UPDATE TESTING TABLE WITH INFORMATION REQUIRED BY QLIKVIEW
      **********************************************************************************************************************/
      
      UPDATE 
      [dbo].RES_PAYSLIP
      SET
      PAY_21 = 1
      WHERE PAYSLIP_ID = 'PWC_TEST_EXECUTED_'USE [z'9bbaf92f-d960-4e33-a9cd-228c72cc97ef]
      GO
      /****** Object:  StoredProcedure [dbo].[29.TST_Name_Validity]    Script Date: 4/10/2018 9:53:18 AM ******/
      SET ANSI_NULLS ON
      GO
      SET QUOTED_IDENTIFIER ON
      GO
      ALTER PROC [dbo].[29.TST_Name_Validity]
      AS
      
      /********************************************************************************************************
      *                           DATA ASSURANCE                                                              *
      *********************************************************************************************************
      UPDATES            - Version 0.1 {17/02/2015} {Simon Tsai} - {Created test}
      - Version 0.2 {04/03/2015} {Simon Tsai} - {Added Commentary}
      
      SCRIPT DESCRIPTION - {Test name validity}
      
      TABLE INFORMATION
      INPUT TABLE(S)
      - [dbo].[PREP_EMP_MASTER]
      - [REF_PARAMETERS]
      
      OUTPUT TABLE(S)
      - [DBO].[RES_EMPLOYEE]
      
      SUMMARY OF SCRIPT  - 01. UPDATE [RES_EMPLOYEE] TEST TABLE 
      - 02. THE EMPLOYEE NAME IS MATCHED AGAINST A LIST OF NON-EXPECTED USER NAME
      (NOTE: THIS IS COMPARED AGAINST A USER DEFINED LIST)
      - 03. UPDATE TESTING TABLE WITH INFORMATION REQUIRED BY QLIKVIEW
      
      *********************************************************************************************************
      01. UPDATE [RES_EMPLOYEE] TEST TABLE 
      ********************************************************************************************************/
      
      UPDATE [DBO].[RES_EMPLOYEE]
      SET PAY_08 = CASE WHEN NT.VALUE IS NULL 
      THEN 0
      ELSE 1
      END
      ,PAY_08_REASON = NT.VALUE
      FROM [DBO].[RES_EMPLOYEE] AS RESULT
      LEFT JOIN
      (
      SELECT EMPLOYEE_ID + '_' + ISNULL(SYSTEM_NAME,'') AS EMPLOYEE_SYSTEM_ID
      ,[REF_PARAMETERS].VALUE
      FROM [dbo].[PREP_EMP_MASTER], [REF_PARAMETERS]
      
      /********************************************************************************************************
      02. THE EMPLOYEE NAME IS MATCHED AGAINST A LIST OF NON-EXPECTED USER NAME
      IN THE [REF_PARAMETERS] TABLE
      ********************************************************************************************************/
      
      WHERE PWC_EMPLOYEE_NAME LIKE '%' + [REF_PARAMETERS].VALUE + '%' AND
      [REF_PARAMETERS].PARAMETER_ID = 'Employee_Name' 
      ) AS NT
      ON NT.EMPLOYEE_SYSTEM_ID = RESULT.EMPLOYEE_SYSTEM_ID
      
      /*******************************************************************************************************
      03. UPDATE TESTING TABLE WITH INFORMATION REQUIRED BY QLIKVIEW
      *******************************************************************************************************/
      
      UPDATE 
      [DBO].[RES_EMPLOYEE]
      SET
      PAY_08 = 1
      WHERE EMPLOYEE_SYSTEM_ID = 'PWC_TEST_EXECUTED_'USE [z'9bbaf92f-d960-4e33-a9cd-228c72cc97ef]
      GO
      /****** Object:  StoredProcedure [dbo].[30.RES_E2E_MATCH]    Script Date: 4/10/2018 9:53:43 AM ******/
      SET ANSI_NULLS ON
      GO
      SET QUOTED_IDENTIFIER ON
      GO
      ALTER PROC [dbo].[30.RES_E2E_MATCH]
      AS
      
      /****************************************************************************************************
      *                           DATA ASSURANCE                                                          *
      *****************************************************************************************************
      UPDATES            - Version 0.1 {10/02/2015} {Simon Tsai} - {Creates the test}
      - Version 0.2 {04/03/2015} {Simon Tsai} - {Added Commentary}
      - Version 0.3 {15/05/2015} {Simon Tsai} - {Added Steps 24A - 24D}
      - Version 0.4 {21/06/2016} {Fei Li}	-	 {Addeing System Name - line 369}
      
      SCRIPT DESCRIPTION - {Creates the empty results tables for ETE}
      
      TABLE INFORMATION
      INPUT TABLE(S)
      - N/A
      
      OUTPUT TABLE(S)
      - [DBO].[RES_ETE_MATCH]
      
      SUMMARY OF SCRIPT  - 01. DROP TABLE STATEMENT
      - 02. CREATE EMPTY TABLES
      - 03. FIND EMPLOYEES SHARING BANK BSB AND BANK ACCOUNT NUMBER
      - 04. CREATE A DISTINCT LIST OF BANK ACCOUNTS WHERE IT HAS DUPLICATES
      - 05. PICKING UP LIST OF BANK ACCOUNT WHERE IT IS A DUPLICATE
      - 06. FIND EMPLOYEES SHARING CONTACT NUMBER (MOBILE, PHONE)
      - 07. CREATE A DISTINCT LIST OF CONTACT NUMBER WHERE IT HAS DUPLICATES
      - 08. PICKING UP LIST OF CONTACT NUMBER WHERE IT IS A DUPLICATE
      - 09. FIND EMPLOYEES SHARING THE SAME EMPLOYEE NAMES
      - 10. CREATE A DISTINCT LIST OF EMPLOYEE NAMES WHERE IT HAS DUPLICATES
      - 11. PICKING UP LIST OF EMPLOYEE NAMES WHERE IT IS A DUPLICATE
      - 12. FIND EMPLOYEES SHARING SAME ADDRESS
      - 13. CREATE A DISTINCT LIST OF BANK ADDRESSES WHERE IT HAS DUPLICATES
      - 14. PICKING UP LIST OF ADDRESSES WHERE IT IS A DUPLICATE
      - 15. COMBINING ALL THE MATCHES AND INSERTING INTO A TEMPORARY TABLE
      - 16. JOIN THE RESULT TABLE WITH EMPLOYEE BANK CTE
      - 17. JOIN THE RESULT TABLE WITH EMPLOYEE CONTACT NUMBER CTE
      - 18. JOIN THE RESULT TABLE WITH EMPLOYEE NAME CTE
      - 19. JOIN THE RESULT TABLE WITH EMPLOYEE ADDRESS CTE
      - 20. OBTAINING ALL RELEVANT PAYROLL INFORMATION FROM PAYROLL HEADER
      - 21. CREATE RESULTS TABLE USING UNPIVOT AND PIVOT TO CREATE PAIRINGS
      - 22. UNPIVOT THE DATA TO EXPAND DATA DEPTH
      - 23. INSERT THE RESULTS INTO THE [RES_ETE_MATCH] TEST RESULTS TABLE
      - 24. JOIN TABLE ON ITSELF 
      - 24.A. UPDATE [RES_EMPLOYEE] TEST TABLE - WITH [dbo].[PREP_EMP_BANK_ACCOUNT] DETAILS
      - 24.B. UPDATE [RES_EMPLOYEE] TEST TABLE - WITH [dbo].[PREP_EMP_ADDRESS] DETAILS
      - 24.C. UPDATE [RES_EMPLOYEE] TEST TABLE - WITH [dbo].[PREP_EMP_MASTER] DETAILS
      - 24.D. UPDATE [RES_EMPLOYEE] TEST TABLE - WITH [dbo].[PREP_EMP_MASTER] DETAILS
      - 25. UPDATE [RES_EMPLOYEE] TEST TABLE
      - 26. UPDATE TESTING TABLE WITH INFORMATION REQUIRED BY QLIKVIEW
      
      *****************************************************************************************************
      01. DROP TABLE STATEMENT
      ****************************************************************************************************/
      
      IF OBJECT_ID('RES_ETE_MATCH_TEMP') IS NOT NULL
      DROP TABLE [RES_ETE_MATCH_TEMP]
      
      IF OBJECT_ID('RES_ETE_MATCH') IS NOT NULL
      DROP TABLE [RES_ETE_MATCH]
      
      /****************************************************************************************************
      02. CREATE EMPTY TABLES
      ****************************************************************************************************/
      
      CREATE TABLE [DBO].[RES_ETE_MATCH_TEMP]
      (
      EMPLOYEE_SYSTEM_ID NVARCHAR(1000)
      ,PWC_BSB_NUMBER NVARCHAR(1000)
      ,PWC_ACCOUNT_NUMBER NVARCHAR(1000)
      ,PWC_BANK_MATCH_ID INT
      ,PWC_CONTACT_NUMBER NVARCHAR(1000)
      ,PWC_CONTACT_MATCH_ID INT
      ,PWC_EMPLOYEE_NAME NVARCHAR(1000)
      ,PWC_NAME_MATCH_ID INT
      ,PWC_TOTAL_ADDRESS NVARCHAR(1000)
      ,PWC_ADD_MATCH_ID INT
      ,PWC_MATCH_KEY NVARCHAR(1000)
      ,BASE_VALUE DECIMAL(18,4)
      ,OVERTIME_VALUE DECIMAL(18,4)
      ,ADDITIONS_BEFORE_TAX DECIMAL(18,4)
      ,GROSS DECIMAL(18,4)
      ,DEDUCTIONS_BEFORE_TAX DECIMAL(18,4)
      ,TAXABLE_INCOME DECIMAL(18,4)
      ,TAX DECIMAL(18,4)
      ,ADDITIONS_AFTER_TAX DECIMAL(18,4)
      ,DEDUCTION_AFTER_TAX DECIMAL(18,4)
      ,NET DECIMAL(18,4)
      ,SUPER DECIMAL(18,4)
      ,ACCRUED_LEAVE DECIMAL(18,4)
      ,PWC_NET_AMOUNT DECIMAL(18,4)
      ,PWC_GROSS_AMOUNT DECIMAL(18,4)
      )
      
      /****************************************************************************************************
      03. FIND EMPLOYEES SHARING BANK BSB AND BANK ACCOUNT NUMBER
      THIS WILL FIND YOU ALL EMPLOYEES SHARING THE SAME BANK ACCOUNT
      ****************************************************************************************************/
      
      ;WITH CTE_BANK
      AS
      (
      SELECT DISTINCT NT.ROW
      ,BANK_1.[EMPLOYEE_ID]
      ,NT.PWC_BSB_NUMBER
      ,NT.PWC_ACCOUNT_NUMBER
      ,BANK_1.SYSTEM_NAME
      ,BANK_1.[EMPLOYEE_ID] + '_' + ISNULL(BANK_1.SYSTEM_NAME,'') AS EMPLOYEE_SYSTEM_ID
      FROM [dbo].[PREP_EMP_BANK_ACCOUNT] AS BANK_1
      RIGHT JOIN (
      
      /****************************************************************************************************
      04. CREATE A DISTINCT LIST OF BANK ACCOUNTS WHERE IT HAS DUPLICATES
      ****************************************************************************************************/
      
      SELECT ROW_NUMBER() OVER(ORDER BY LTRIM(RTRIM(PWC_BSB_NUMBER)),LTRIM(RTRIM(PWC_ACCOUNT_NUMBER))) AS ROW
      ,LTRIM(RTRIM(PWC_BSB_NUMBER)) AS PWC_BSB_NUMBER
      ,LTRIM(RTRIM(PWC_ACCOUNT_NUMBER)) AS PWC_ACCOUNT_NUMBER
      ,LTRIM(RTRIM(SYSTEM_NAME)) AS SYSTEM_NAME
      FROM [dbo].[PREP_EMP_BANK_ACCOUNT]
      GROUP BY LTRIM(RTRIM(PWC_BSB_NUMBER))
      ,LTRIM(RTRIM(PWC_ACCOUNT_NUMBER))
      ,LTRIM(RTRIM(SYSTEM_NAME))
      
      /****************************************************************************************************
      05. PICKING UP LIST OF BANK ACCOUNT WHERE IT IS A DUPLICATE
      ****************************************************************************************************/
      
      HAVING COUNT(DISTINCT LTRIM(RTRIM(EMPLOYEE_ID))) > 1
      ) AS NT
      ON LTRIM(RTRIM(NT.PWC_ACCOUNT_NUMBER)) = LTRIM(RTRIM(BANK_1.PWC_ACCOUNT_NUMBER)) 
      AND 
      LTRIM(RTRIM(NT.PWC_BSB_NUMBER)) = LTRIM(RTRIM(BANK_1.PWC_BSB_NUMBER))
      AND 
      ISNULL(NT.SYSTEM_NAME,'') = ISNULL(BANK_1.SYSTEM_NAME,'')
      )
      
      /****************************************************************************************************
      06. FIND EMPLOYEES SHARING CONTACT NUMBER (MOBILE, PHONE)
      ****************************************************************************************************/
      
      ,CTE_CONTACT
      AS
      (
      SELECT DISTINCT NT.ROW
      ,NUMBER_1.[EMPLOYEE_ID]
      ,NT.PWC_CONTACT_NUMBER
      ,NUMBER_1.SYSTEM_NAME
      ,NUMBER_1.[EMPLOYEE_ID] + '_' + ISNULL(NUMBER_1.SYSTEM_NAME,'') AS EMPLOYEE_SYSTEM_ID
      FROM [dbo].[PREP_EMP_NUMBER] AS NUMBER_1
      RIGHT JOIN
      (
      
      /****************************************************************************************************
      07. CREATE A DISTINCT LIST OF CONTACT NUMBER WHERE IT HAS DUPLICATES
      ****************************************************************************************************/
      
      SELECT ROW_NUMBER() OVER(ORDER BY LTRIM(RTRIM(PWC_CONTACT_NUMBER))) AS ROW
      ,LTRIM(RTRIM(PWC_CONTACT_NUMBER)) AS PWC_CONTACT_NUMBER
      ,LTRIM(RTRIM(SYSTEM_NAME)) AS SYSTEM_NAME
      FROM [dbo].[PREP_EMP_NUMBER]
      WHERE NOT(REPLACE(PWC_CONTACT_NUMBER,'0','') = '')
      GROUP BY LTRIM(RTRIM(PWC_CONTACT_NUMBER))
      ,LTRIM(RTRIM(SYSTEM_NAME))
      
      /****************************************************************************************************
      08. PICKING UP LIST OF CONTACT NUMBER WHERE IT IS A DUPLICATE
      ****************************************************************************************************/
      
      HAVING COUNT(DISTINCT EMPLOYEE_ID) > 1
      ) AS NT
      ON LTRIM(RTRIM(NT.PWC_CONTACT_NUMBER)) = LTRIM(RTRIM(NUMBER_1.PWC_CONTACT_NUMBER))
      AND 
      ISNULL(NT.SYSTEM_NAME,'') = ISNULL(NUMBER_1.SYSTEM_NAME,'')
      )
      
      /****************************************************************************************************
      09. FIND EMPLOYEES SHARING THE SAME EMPLOYEE NAMES
      ****************************************************************************************************/
      
      ,CTE_NAME
      AS 
      (
      SELECT DISTINCT NT.ROW
      ,EMP_1.EMPLOYEE_ID
      ,NT.PWC_EMPLOYEE_NAME
      ,EMP_1.SYSTEM_NAME
      ,EMP_1.[EMPLOYEE_ID] + '_' + ISNULL(EMP_1.SYSTEM_NAME,'') AS EMPLOYEE_SYSTEM_ID
      FROM [dbo].[PREP_EMP_MASTER] AS EMP_1
      RIGHT JOIN
      (
      
      /****************************************************************************************************
      10. CREATE A DISTINCT LIST OF EMPLOYEE NAMES WHERE IT HAS DUPLICATES
      ****************************************************************************************************/
      
      SELECT ROW_NUMBER() OVER(ORDER BY LTRIM(RTRIM(PWC_EMPLOYEE_NAME))) AS ROW
      ,LTRIM(RTRIM(PWC_EMPLOYEE_NAME)) AS PWC_EMPLOYEE_NAME
      ,LTRIM(RTRIM(SYSTEM_NAME)) AS SYSTEM_NAME
      FROM [dbo].[PREP_EMP_MASTER]
      WHERE NOT(ISNULL(PWC_EMPLOYEE_NAME,'') = '')
      GROUP BY LTRIM(RTRIM(PWC_EMPLOYEE_NAME))
      ,LTRIM(RTRIM(SYSTEM_NAME))
      
      /****************************************************************************************************
      11. PICKING UP LIST OF EMPLOYEE NAMES WHERE IT IS A DUPLICATE
      ****************************************************************************************************/
      
      HAVING COUNT(DISTINCT EMPLOYEE_ID) > 1
      ) AS NT
      ON LTRIM(RTRIM(NT.PWC_EMPLOYEE_NAME)) = LTRIM(RTRIM(EMP_1.PWC_EMPLOYEE_NAME))
      AND 
      ISNULL(NT.SYSTEM_NAME,'') = ISNULL(EMP_1.SYSTEM_NAME, '')
      )
      
      /****************************************************************************************************
      12. FIND EMPLOYEES SHARING SAME ADDRESS
      ****************************************************************************************************/
      
      ,CTE_ADD
      AS
      (
      SELECT DISTINCT NT.ROW
      ,ADD_1.EMPLOYEE_ID
      ,NT.PWC_TOTAL_ADDRESS
      ,ADD_1.SYSTEM_NAME
      ,ADD_1.[EMPLOYEE_ID] + '_' + ISNULL(ADD_1.SYSTEM_NAME,'') AS EMPLOYEE_SYSTEM_ID
      FROM [dbo].[PREP_EMP_ADDRESS] AS ADD_1
      RIGHT JOIN
      (	
      
      /****************************************************************************************************
      13. CREATE A DISTINCT LIST OF ADDRESSES WHERE IT HAS DUPLICATES
      ****************************************************************************************************/
      
      SELECT ROW_NUMBER() OVER(ORDER BY LTRIM(RTRIM(PWC_TOTAL_ADDRESS))) AS ROW
      ,LTRIM(RTRIM(PWC_TOTAL_ADDRESS)) AS PWC_TOTAL_ADDRESS
      ,LTRIM(RTRIM(SYSTEM_NAME)) AS SYSTEM_NAME
      FROM [dbo].[PREP_EMP_ADDRESS]
      GROUP BY LTRIM(RTRIM(PWC_TOTAL_ADDRESS))
      ,LTRIM(RTRIM(SYSTEM_NAME))
      
      /****************************************************************************************************
      14. PICKING UP LIST OF ADDRESSES WHERE IT IS A DUPLICATE
      ****************************************************************************************************/
      
      HAVING COUNT(DISTINCT EMPLOYEE_ID) > 1
      ) AS NT
      ON LTRIM(RTRIM(NT.PWC_TOTAL_ADDRESS)) = LTRIM(RTRIM(ADD_1.PWC_TOTAL_ADDRESS))
      AND ISNULL(NT.SYSTEM_NAME,'') = ISNULL(ADD_1.SYSTEM_NAME,'')
      )
      
      /****************************************************************************************************
      15. COMBINING ALL THE MATCHES AND INSERTING INTO A TEMPORARY TABLE
      ****************************************************************************************************/
      
      INSERT INTO [DBO].[RES_ETE_MATCH_TEMP]
      (
      EMPLOYEE_SYSTEM_ID
      ,PWC_BSB_NUMBER
      ,PWC_ACCOUNT_NUMBER
      ,PWC_BANK_MATCH_ID
      ,PWC_CONTACT_NUMBER
      ,PWC_CONTACT_MATCH_ID 
      ,PWC_EMPLOYEE_NAME
      ,PWC_NAME_MATCH_ID
      ,PWC_TOTAL_ADDRESS 
      ,PWC_ADD_MATCH_ID
      ,PWC_MATCH_KEY
      ,PAY_DETAIL.BASE_VALUE
      ,PAY_DETAIL.OVERTIME_VALUE
      ,PAY_DETAIL.ADDITIONS_BEFORE_TAX
      ,PAY_DETAIL.GROSS
      ,PAY_DETAIL.DEDUCTIONS_BEFORE_TAX
      ,PAY_DETAIL.TAXABLE_INCOME
      ,PAY_DETAIL.TAX
      ,PAY_DETAIL.ADDITIONS_AFTER_TAX
      ,PAY_DETAIL.DEDUCTION_AFTER_TAX
      ,PAY_DETAIL.NET
      ,PAY_DETAIL.SUPER
      ,PAY_DETAIL.ACCRUED_LEAVE
      ,PWC_GROSS_AMOUNT 
      ,PWC_NET_AMOUNT
      )
      SELECT RESULT.EMPLOYEE_SYSTEM_ID
      ,CTE_BANK.PWC_BSB_NUMBER
      ,CTE_BANK.PWC_ACCOUNT_NUMBER 
      ,ISNULL(CTE_BANK.[ROW],0) AS BANK_MATCH_ID 
      ,CTE_CONTACT.PWC_CONTACT_NUMBER 
      ,ISNULL(CTE_CONTACT.[ROW],0) AS CONTACT_MATCH_ID
      ,CTE_NAME.PWC_EMPLOYEE_NAME 
      ,ISNULL(CTE_NAME.[ROW],0) AS NAME_MATCH_ID
      ,CTE_ADD.PWC_TOTAL_ADDRESS
      ,ISNULL(CTE_ADD.[ROW],0) AS ADD_MATCH_ID
      ,(CAST(ISNULL(CTE_BANK.[ROW], 0) AS NVARCHAR(10)) + '_' 
      + CAST(ISNULL(CTE_CONTACT.[ROW], 0) AS NVARCHAR(10)) + '_' 
      + CAST(ISNULL(CTE_NAME.[ROW], 0) AS NVARCHAR(10)) + '_' 
      + CAST(ISNULL(CTE_ADD.[ROW], 0) AS NVARCHAR(10))) AS MATCH_KEY
      ,ISNULL(PAY_DETAIL.BASE_VALUE, 0)
      ,ISNULL(PAY_DETAIL.OVERTIME_VALUE, 0)
      ,ISNULL(PAY_DETAIL.ADDITIONS_BEFORE_TAX, 0)
      ,ISNULL(PAY_DETAIL.GROSS, 0)
      ,ISNULL(PAY_DETAIL.DEDUCTIONS_BEFORE_TAX, 0)
      ,ISNULL(PAY_DETAIL.TAXABLE_INCOME, 0)
      ,ISNULL(PAY_DETAIL.TAX, 0)
      ,ISNULL(PAY_DETAIL.ADDITIONS_AFTER_TAX, 0)
      ,ISNULL(PAY_DETAIL.DEDUCTION_AFTER_TAX, 0)
      ,ISNULL(PAY_DETAIL.NET, 0)
      ,ISNULL(PAY_DETAIL.SUPER, 0)
      ,ISNULL(PAY_DETAIL.ACCRUED_LEAVE, 0)
      ,ISNULL(PAY_DETAIL.PWC_GROSS_AMOUNT, 0)
      ,ISNULL(PAY_DETAIL.PWC_NET_AMOUNT, 0)
      FROM [dbo].[RES_EMPLOYEE] AS RESULT
      LEFT JOIN 
      
      /****************************************************************************************************
      16. JOIN THE RESULT TABLE WITH EMPLOYEE BANK CTE
      ****************************************************************************************************/
      
      CTE_BANK
      ON CTE_BANK.EMPLOYEE_SYSTEM_ID = RESULT.EMPLOYEE_SYSTEM_ID
      LEFT JOIN
      
      /****************************************************************************************************
      17. JOIN THE RESULT TABLE WITH EMPLOYEE CONTACT NUMBER CTE
      ****************************************************************************************************/
      
      CTE_CONTACT
      ON CTE_CONTACT.EMPLOYEE_SYSTEM_ID = RESULT.EMPLOYEE_SYSTEM_ID
      LEFT JOIN 
      
      /****************************************************************************************************
      18. JOIN THE RESULT TABLE WITH EMPLOYEE NAME CTE
      ****************************************************************************************************/
      
      CTE_NAME
      ON CTE_NAME.EMPLOYEE_SYSTEM_ID = RESULT.EMPLOYEE_SYSTEM_ID
      LEFT JOIN
      
      /****************************************************************************************************
      19. JOIN THE RESULT TABLE WITH EMPLOYEE ADDRESS CTE
      ****************************************************************************************************/
      
      CTE_ADD
      ON CTE_ADD.EMPLOYEE_SYSTEM_ID = RESULT.EMPLOYEE_SYSTEM_ID
      LEFT JOIN 
      
      /****************************************************************************************************
      20. OBTAINING ALL RELEVANT PAYROLL INFORMATION FROM PAYROLL HEADER
      ****************************************************************************************************/
      
      (
      SELECT EMPLOYEE_ID + '_'+ SYSTEM_NAME AS EMPLOYEE_SYSTEM_ID
      ,SUM(BASE_VALUE) AS BASE_VALUE
      ,SUM(OVERTIME_VALUE) AS OVERTIME_VALUE
      ,SUM(ADDITIONS_BEFORE_TAX) AS ADDITIONS_BEFORE_TAX
      ,SUM(GROSS) AS GROSS
      ,SUM(DEDUCTIONS_BEFORE_TAX) AS DEDUCTIONS_BEFORE_TAX
      ,SUM(TAXABLE_INCOME) AS TAXABLE_INCOME
      ,SUM(TAX) AS TAX
      ,SUM(ADDITIONS_AFTER_TAX) AS ADDITIONS_AFTER_TAX
      ,SUM(DEDUCTIONS_AFTER_TAX) AS DEDUCTION_AFTER_TAX
      ,SUM(NET) AS NET
      ,SUM(SUPER) AS SUPER
      ,SUM(ACCRUED_LEAVE) AS ACCRUED_LEAVE
      ,SUM(PWC_GROSS_AMOUNT) AS PWC_GROSS_AMOUNT
      ,SUM(PWC_NET_AMOUNT) AS PWC_NET_AMOUNT
      FROM [dbo].[PREP_PAYSLIPS_HEADER]
      GROUP BY EMPLOYEE_ID + '_' +SYSTEM_NAME
      ) AS PAY_DETAIL
      ON PAY_DETAIL.EMPLOYEE_SYSTEM_ID = RESULT.EMPLOYEE_SYSTEM_ID
      
      /****************************************************************************************************
      21. CREATE RESULTS TABLE USING UNPIVOT AND PIVOT TO CREATE PAIRINGS
      ****************************************************************************************************/
      
      CREATE TABLE [DBO].[RES_ETE_MATCH]
      (
      PWC_ID_ADD NVARCHAR(1000) --INT IDENTITY(1,1) NOT NULL
      ,EMP_A NVARCHAR(1000)
      ,EMP_B NVARCHAR(1000)
      ,PWC_BSB_NUMBER_A NVARCHAR(1000)
      ,PWC_BSB_NUMBER_B NVARCHAR(1000)
      ,PWC_ACCOUNT_NUMBER_A NVARCHAR(1000)
      ,PWC_ACCOUNT_NUMBER_B NVARCHAR(1000)
      ,PWC_CONTACT_NUMBER_A NVARCHAR(1000)
      ,PWC_CONTACT_NUMBER_B NVARCHAR(1000)
      ,PWC_EMPLOYEE_NAME_A NVARCHAR(1000)
      ,PWC_EMPLOYEE_NAME_B NVARCHAR(1000)
      ,PWC_TOTAL_ADDRESS_A NVARCHAR(1000)
      ,PWC_TOTAL_ADDRESS_B NVARCHAR(1000)
      ,PWC_ADD_MATCH_ID NVARCHAR(1000)
      ,PWC_BANK_MATCH_ID NVARCHAR(1000)
      ,PWC_CONTACT_MATCH_ID NVARCHAR(1000)
      ,PWC_NAME_MATCH_ID NVARCHAR(1000)
      ,PWC_GROSS_AMOUNT_A DECIMAL(18,4)
      ,PWC_GROSS_AMOUNT_B DECIMAL(18,4)
      ,PWC_NET_AMOUNT_A DECIMAL(18,4)
      ,PWC_NET_AMOUNT_B DECIMAL(18,4)
      )
      
      /****************************************************************************************************
      22. UNPIVOT THE DATA TO EXPAND DATA DEPTH
      REMOVE ALL ENTRIES THAT DOES NOT HAVE A MATCH
      ****************************************************************************************************/
      
      ;WITH CTE_MATCH
      AS
      (
      SELECT DISTINCT EMPLOYEE_SYSTEM_ID
      ,CATEGORIES
      ,MATCH_KEY
      ,PWC_BSB_NUMBER
      ,PWC_ACCOUNT_NUMBER
      ,PWC_CONTACT_NUMBER
      ,PWC_EMPLOYEE_NAME
      ,PWC_TOTAL_ADDRESS
      ,SUM(PWC_GROSS_AMOUNT) AS PWC_GROSS_AMOUNT
      ,SUM(PWC_NET_AMOUNT) AS PWC_NET_AMOUNT
      FROM [dbo].[RES_ETE_MATCH_TEMP]
      UNPIVOT
      (
      MATCH_KEY FOR CATEGORIES IN (PWC_BANK_MATCH_ID, PWC_CONTACT_MATCH_ID, PWC_NAME_MATCH_ID
      , PWC_ADD_MATCH_ID)
      ) AS UNPIV
      WHERE MATCH_KEY <> 0
      GROUP BY EMPLOYEE_SYSTEM_ID
      ,CATEGORIES
      ,MATCH_KEY
      ,PWC_BSB_NUMBER
      ,PWC_ACCOUNT_NUMBER
      ,PWC_CONTACT_NUMBER
      ,PWC_EMPLOYEE_NAME
      ,PWC_TOTAL_ADDRESS
      )
      
      /****************************************************************************************************
      23. INSERT THE RESULTS INTO THE [RES_ETE_MATCH] TEST RESULTS TABLE
      ****************************************************************************************************/
      
      INSERT INTO [DBO].[RES_ETE_MATCH]
      (
      PWC_ID_ADD
      ,EMP_A  
      ,EMP_B  
      ,PWC_BSB_NUMBER_A  
      ,PWC_BSB_NUMBER_B  
      ,PWC_ACCOUNT_NUMBER_A  
      ,PWC_ACCOUNT_NUMBER_B  
      ,PWC_CONTACT_NUMBER_A  
      ,PWC_CONTACT_NUMBER_B  
      ,PWC_EMPLOYEE_NAME_A  
      ,PWC_EMPLOYEE_NAME_B  
      ,PWC_TOTAL_ADDRESS_A  
      ,PWC_TOTAL_ADDRESS_B  
      ,PWC_ADD_MATCH_ID  
      ,PWC_BANK_MATCH_ID  
      ,PWC_CONTACT_MATCH_ID  
      ,PWC_NAME_MATCH_ID  
      ,PWC_GROSS_AMOUNT_A
      ,PWC_GROSS_AMOUNT_B
      ,PWC_NET_AMOUNT_A
      ,PWC_NET_AMOUNT_B
      )
      SELECT DISTINCT 
      ISNULL(EMP_A,'') + '_' + ISNULL(EMP_B,'')
      ,EMP_A
      ,EMP_B
      ,MAX(PWC_BSB_NUMBER_A)
      ,MAX(PWC_BSB_NUMBER_B)
      ,MAX(PWC_ACCOUNT_NUMBER_A)
      ,MAX(PWC_ACCOUNT_NUMBER_B)
      ,MAX(PWC_CONTACT_NUMBER_A)
      ,MAX(PWC_CONTACT_NUMBER_B)
      ,MAX(PWC_EMPLOYEE_NAME_A)
      ,MAX(PWC_EMPLOYEE_NAME_B)
      ,MAX(PWC_TOTAL_ADDRESS_A)
      ,MAX(PWC_TOTAL_ADDRESS_B)
      ,CASE WHEN SUM(PWC_ADD_MATCH_ID) >= 1 THEN 1 ELSE 0 END AS PWC_ADD_MATCH_ID
      ,CASE WHEN SUM(PWC_BANK_MATCH_ID) >= 1 THEN 1 ELSE 0 END AS PWC_BANK_MATCH_ID
      ,CASE WHEN SUM(PWC_CONTACT_MATCH_ID) >= 1 THEN 1 ELSE 0 END AS PWC_CONTACT_MATCH_ID
      ,CASE WHEN SUM(PWC_NAME_MATCH_ID) >= 1 THEN 1 ELSE 0 END AS PWC_NAME_MATCH_ID
      ,PWC_GROSS_AMOUNT_A
      ,PWC_GROSS_AMOUNT_B
      ,PWC_NET_AMOUNT_A
      ,PWC_NET_AMOUNT_B
      FROM (
      
      /****************************************************************************************************
      24. JOIN TABLE ON ITSELF 
      ****************************************************************************************************/
      
      SELECT MATCH_A.EMPLOYEE_SYSTEM_ID AS EMP_A
      ,MATCH_B.EMPLOYEE_SYSTEM_ID AS EMP_B
      ,MATCH_A.CATEGORIES AS CATEGORIES_A
      ,MATCH_B.CATEGORIES AS CATEGORIES_B
      ,MATCH_A.MATCH_KEY AS MATCH_KEY_A
      ,MATCH_B.MATCH_KEY AS MATCH_KEY_B
      ,MATCH_A.PWC_BSB_NUMBER AS PWC_BSB_NUMBER_A
      ,MATCH_B.PWC_BSB_NUMBER AS PWC_BSB_NUMBER_B
      ,MATCH_A.PWC_ACCOUNT_NUMBER AS PWC_ACCOUNT_NUMBER_A
      ,MATCH_B.PWC_ACCOUNT_NUMBER AS PWC_ACCOUNT_NUMBER_B
      ,MATCH_A.PWC_CONTACT_NUMBER AS PWC_CONTACT_NUMBER_A
      ,MATCH_B.PWC_CONTACT_NUMBER AS PWC_CONTACT_NUMBER_B
      ,MATCH_A.PWC_EMPLOYEE_NAME AS PWC_EMPLOYEE_NAME_A
      ,MATCH_B.PWC_EMPLOYEE_NAME AS PWC_EMPLOYEE_NAME_B
      ,MATCH_A.PWC_TOTAL_ADDRESS AS PWC_TOTAL_ADDRESS_A
      ,MATCH_B.PWC_TOTAL_ADDRESS AS PWC_TOTAL_ADDRESS_B
      ,MATCH_A.PWC_GROSS_AMOUNT AS PWC_GROSS_AMOUNT_A
      ,MATCH_B.PWC_GROSS_AMOUNT AS PWC_GROSS_AMOUNT_B
      ,MATCH_A.PWC_NET_AMOUNT AS PWC_NET_AMOUNT_A
      ,MATCH_B.PWC_NET_AMOUNT AS PWC_NET_AMOUNT_B
      FROM CTE_MATCH AS MATCH_A
      LEFT JOIN
      CTE_MATCH AS MATCH_B
      ON MATCH_A.EMPLOYEE_SYSTEM_ID > MATCH_B.EMPLOYEE_SYSTEM_ID
      AND 
      ISNULL(MATCH_A.PWC_CONTACT_NUMBER,0) >= ISNULL(MATCH_B.PWC_CONTACT_NUMBER,0)
      AND
      ISNULL(MATCH_A.PWC_BSB_NUMBER,0) >= ISNULL(MATCH_B.PWC_BSB_NUMBER,0)
      AND
      ISNULL(MATCH_A.PWC_ACCOUNT_NUMBER,0) >= ISNULL(MATCH_B.PWC_ACCOUNT_NUMBER,0)
      AND
      MATCH_A.MATCH_KEY = MATCH_B.MATCH_KEY
      AND
      MATCH_A.CATEGORIES = MATCH_B.CATEGORIES
      WHERE ISNULL(MATCH_B.EMPLOYEE_SYSTEM_ID, '') <> ''
      ) AS NT
      PIVOT(
      SUM(NT.MATCH_KEY_A) FOR NT.CATEGORIES_A IN (PWC_ADD_MATCH_ID,PWC_BANK_MATCH_ID
      ,PWC_CONTACT_MATCH_ID,PWC_NAME_MATCH_ID) 
      ) AS PIV
      GROUP BY EMP_A
      ,EMP_B
      ,PWC_TOTAL_ADDRESS_A
      ,PWC_TOTAL_ADDRESS_B
      ,PWC_GROSS_AMOUNT_A
      ,PWC_GROSS_AMOUNT_B
      ,PWC_NET_AMOUNT_A
      ,PWC_NET_AMOUNT_B
      
      /****************************************************************************************************
      24.A. UPDATE [RES_EMPLOYEE] TEST TABLE - WITH [dbo].[PREP_EMP_BANK_ACCOUNT] DETAILS
      ****************************************************************************************************/
      
      UPDATE [DBO].[RES_ETE_MATCH]
      SET PWC_BSB_NUMBER_A = CASE WHEN ISNULL(PWC_BSB_NUMBER_A,'') = '' THEN BANK.PWC_BSB_NUMBER ELSE PWC_BSB_NUMBER_A END
      FROM [DBO].[RES_ETE_MATCH] AS ETE
      LEFT JOIN
      [dbo].[PREP_EMP_BANK_ACCOUNT] AS BANK
      ON ETE.EMP_A = BANK.EMPLOYEE_ID + '_' + ISNULL(BANK.SYSTEM_NAME,'')
      
      UPDATE [DBO].[RES_ETE_MATCH]
      SET PWC_BSB_NUMBER_B = CASE WHEN ISNULL(PWC_BSB_NUMBER_B,'') = '' THEN BANK.PWC_BSB_NUMBER ELSE PWC_BSB_NUMBER_B END
      FROM [DBO].[RES_ETE_MATCH] AS ETE
      LEFT JOIN
      [dbo].[PREP_EMP_BANK_ACCOUNT] AS BANK
      ON ETE.EMP_B = BANK.EMPLOYEE_ID + '_' + ISNULL(BANK.SYSTEM_NAME,'')
      
      UPDATE [DBO].[RES_ETE_MATCH]
      SET PWC_ACCOUNT_NUMBER_A = CASE WHEN ISNULL(PWC_ACCOUNT_NUMBER_A,'') = '' THEN BANK.PWC_ACCOUNT_NUMBER ELSE PWC_ACCOUNT_NUMBER_A END
      FROM [DBO].[RES_ETE_MATCH] AS ETE
      LEFT JOIN
      [dbo].[PREP_EMP_BANK_ACCOUNT] AS BANK
      ON ETE.EMP_A = BANK.EMPLOYEE_ID + '_' + ISNULL(BANK.SYSTEM_NAME,'')
      
      UPDATE [DBO].[RES_ETE_MATCH]
      SET PWC_ACCOUNT_NUMBER_B = CASE WHEN ISNULL(PWC_ACCOUNT_NUMBER_B,'') = '' THEN BANK.PWC_ACCOUNT_NUMBER ELSE PWC_ACCOUNT_NUMBER_B END
      FROM [DBO].[RES_ETE_MATCH] AS ETE
      LEFT JOIN
      [dbo].[PREP_EMP_BANK_ACCOUNT] AS BANK
      ON ETE.EMP_B = BANK.EMPLOYEE_ID + '_' + ISNULL(BANK.SYSTEM_NAME,'')
      
      /****************************************************************************************************
      24.B. UPDATE [RES_EMPLOYEE] TEST TABLE - WITH [dbo].[PREP_EMP_ADDRESS] DETAILS
      ****************************************************************************************************/
      
      UPDATE [DBO].[RES_ETE_MATCH]
      SET PWC_TOTAL_ADDRESS_A = CASE WHEN ISNULL(PWC_TOTAL_ADDRESS_A,'') = '' THEN ADDY.PWC_TOTAL_ADDRESS ELSE PWC_TOTAL_ADDRESS_A END
      FROM [DBO].[RES_ETE_MATCH] AS ETE
      LEFT JOIN
      [dbo].[PREP_EMP_ADDRESS] AS ADDY
      ON ETE.EMP_A = ADDY.EMPLOYEE_ID + '_' + ISNULL(ADDY.SYSTEM_NAME,'')
      
      UPDATE [DBO].[RES_ETE_MATCH]
      SET PWC_TOTAL_ADDRESS_B = CASE WHEN ISNULL(PWC_TOTAL_ADDRESS_B,'') = '' THEN ADDY.PWC_TOTAL_ADDRESS ELSE PWC_TOTAL_ADDRESS_B END
      FROM [DBO].[RES_ETE_MATCH] AS ETE
      LEFT JOIN
      [dbo].[PREP_EMP_ADDRESS] AS ADDY
      ON ETE.EMP_B = ADDY.EMPLOYEE_ID + '_' + ISNULL(ADDY.SYSTEM_NAME,'')
      
      /****************************************************************************************************
      24.C. UPDATE [RES_EMPLOYEE] TEST TABLE - WITH [dbo].[PREP_EMP_MASTER] DETAILS
      ****************************************************************************************************/
      
      UPDATE [DBO].[RES_ETE_MATCH]
      SET PWC_EMPLOYEE_NAME_A = CASE WHEN ISNULL(PWC_EMPLOYEE_NAME_A,'') = '' THEN EMP.PWC_EMPLOYEE_NAME ELSE PWC_EMPLOYEE_NAME_A END
      FROM [DBO].[RES_ETE_MATCH] AS ETE
      LEFT JOIN
      [dbo].[PREP_EMP_MASTER] AS EMP
      ON ETE.EMP_A = EMP.EMPLOYEE_ID + '_' + ISNULL(EMP.SYSTEM_NAME,'')
      
      UPDATE [DBO].[RES_ETE_MATCH]
      SET PWC_EMPLOYEE_NAME_B = CASE WHEN ISNULL(PWC_EMPLOYEE_NAME_B,'') = '' THEN EMP.PWC_EMPLOYEE_NAME ELSE PWC_EMPLOYEE_NAME_B END
      FROM [DBO].[RES_ETE_MATCH] AS ETE
      LEFT JOIN
      [dbo].[PREP_EMP_MASTER] AS EMP
      ON ETE.EMP_B = EMP.EMPLOYEE_ID + '_' + ISNULL(EMP.SYSTEM_NAME,'')
      
      
      /****************************************************************************************************
      24.D. UPDATE [RES_EMPLOYEE] TEST TABLE - WITH [dbo].[PREP_EMP_MASTER] DETAILS
      ****************************************************************************************************/
      
      UPDATE [DBO].[RES_ETE_MATCH]
      SET PWC_CONTACT_NUMBER_A = CASE WHEN ISNULL(PWC_CONTACT_NUMBER_A,'') = '' THEN NUMBER.PWC_CONTACT_NUMBER ELSE PWC_CONTACT_NUMBER_A END
      FROM [DBO].[RES_ETE_MATCH] AS ETE
      LEFT JOIN
      [dbo].[PREP_EMP_NUMBER] AS NUMBER
      ON ETE.EMP_A = NUMBER.EMPLOYEE_ID + '_' + ISNULL(NUMBER.SYSTEM_NAME,'')
      
      UPDATE [DBO].[RES_ETE_MATCH]
      SET PWC_CONTACT_NUMBER_B = CASE WHEN ISNULL(PWC_CONTACT_NUMBER_B,'') = '' THEN NUMBER.PWC_CONTACT_NUMBER ELSE PWC_CONTACT_NUMBER_B END
      FROM [DBO].[RES_ETE_MATCH] AS ETE
      LEFT JOIN
      [dbo].[PREP_EMP_NUMBER] AS NUMBER
      ON ETE.EMP_B = NUMBER.EMPLOYEE_ID + '_' + ISNULL(NUMBER.SYSTEM_NAME,'')
      
      /****************************************************************************************************
      25. UPDATE [RES_EMPLOYEE] TEST TABLE
      ****************************************************************************************************/
      
      UPDATE [dbo].[RES_EMPLOYEE]
      SET PAY_01 = CASE 
      WHEN ISNULL(NT.EMPLOYEE_SYSTEM_ID, '') = ''
      THEN 0
      ELSE 1
      END
      FROM [dbo].[RES_EMPLOYEE] AS RESULT
      LEFT JOIN
      ((SELECT DISTINCT EMP_A AS EMPLOYEE_SYSTEM_ID FROM [DBO].[RES_ETE_MATCH])
      UNION
      (SELECT DISTINCT EMP_B AS EMPLOYEE_SYSTEM_ID FROM [DBO].[RES_ETE_MATCH])
      ) AS NT
      ON NT.EMPLOYEE_SYSTEM_ID = RESULT.EMPLOYEE_SYSTEM_ID
      
      /****************************************************************************************************
      26. UPDATE TESTING TABLE WITH INFORMATION REQUIRED BY QLIKVIEW
      ****************************************************************************************************/
      
      UPDATE [dbo].[RES_EMPLOYEE]
      SET PAY_01 = 1
      WHERE EMPLOYEE_SYSTEM_ID = 'PWC_TEST_EXECUTED_'USE [z'9bbaf92f-d960-4e33-a9cd-228c72cc97ef]
      GO
      /****** Object:  StoredProcedure [dbo].[31.TST_Bank_Validity]    Script Date: 4/10/2018 9:54:24 AM ******/
      SET ANSI_NULLS ON
      GO
      SET QUOTED_IDENTIFIER ON
      GO
      ALTER PROC [dbo].[31.TST_Bank_Validity]
      AS
      
      /********************************************************************************************************
      *                           DATA ASSURANCE                                                              *
      *********************************************************************************************************
      UPDATES            - Version 0.1 {11/02/2015} {Simon Tsai} - {Created test}
      - Version 0.2 {04/03/2015} {Simon Tsai} - {Added Commentary}
      - Version 0.3 {17/02/2016} {Fei Li}	   - {Create RES_BANK_VALIDITY table at bank detail level using eft data instead of employee bank detail data}
      - Version 0.4 {08/06/2017} {Justin Moy} - {Change to make 2 tests, one for invalid BSB and one for bsb not in master}
      
      SCRIPT DESCRIPTION - {Test BANK BSB validity}
      
      TABLE INFORMATION
      INPUT TABLE(S)
      - [dbo].[PREP_BANK_EFT]
      - [DA_Master_DataSet].[dbo].[RAW_BSB_LISTING]
      
      OUTPUT TABLE(S)
      - [DBO].[RES_EMPLOYEE]
      - [DBO].[RES_BANK_VALIDITY]
      
      SUMMARY OF SCRIPT  - 00. DROP TABLE STATEMENT
      - 01. COMPARE THE BSB BANK ACCOUNT NUMBER IN EFT DATA WITH A LIST OF VALID BSB BANK ACCOUNT NUMBER
      - 02. UPDATE [RES_EMPLOYEE] TESTING RESULTS TABLE
      - 03. CREATE [RES_BANK_VALIDITY] RESULT TABLE  
      - 04. UPDATE [RES_BANK_VALIDITY] TESTING RESULTS TABLE
      - 05. UPDATE TESTING TABLE WITH INFORMATION REQUIRED BY QLIKVIEW
      
      
      *********************************************************************************************************
      00. DROP TABLE STATEMENT
      ********************************************************************************************************/
      IF OBJECT_ID('RES_BANK_VALIDITY') IS NOT NULL
      DROP TABLE RES_BANK_VALIDITY
      
      IF OBJECT_ID('tempdb..#CTE_BANK') IS NOT NULL
      DROP TABLE #CTE_BANK
      
      IF OBJECT_ID('dbo.TMP_BSB_LIST') IS NOT NULL
      DROP TABLE dbo.TMP_BSB_LIST
      
      
      /*********************************************************************************************************
      000. Make a table of joined EFT bank accounts and 03. emp master bank accounts (Added 08/06/2017 -Justin Moy)
      ********************************************************************************************************/
      
      SELECT
      EMPLOYEE_ID,
      PWC_BSB_NUMBER,
      SYSTEM_NAME,
      AMOUNT,
      CASE source -- where the BSB is from 
      WHEN 3 THEN 'EFT'
      WHEN 6 THEN 'MASTER'
      WHEN 9 THEN 'EFT & MASTER'
      END AS source 
      INTO [dbo].[TMP_BSB_LIST]
      FROM 
      (
      SELECT EMPLOYEE_ID,
      PWC_BSB_NUMBER,
      SYSTEM_NAME,
      SUM(AMOUNT) as AMOUNT,
      sum(len(source)) as source
      
      FROM	(
      SELECT
      EMPLOYEE_ID,
      PWC_BSB_NUMBER,
      SYSTEM_NAME,
      SUM(AMOUNT) as AMOUNT,
      'EFT' as SOURCE
      FROM
      [dbo].[PREP_BANK_EFT]
      WHERE 
      PWC_BSB_NUMBER IS NOT NULL
      GROUP BY
      EMPLOYEE_ID,
      PWC_BSB_NUMBER,
      SYSTEM_NAME
      UNION ALL
      SELECT
      EMPLOYEE_ID,
      PWC_BSB_NUMBER,
      SYSTEM_NAME,
      0 as AMOUNT,
      'MASTER' as SOURCE
      FROM
      [dbo].[PREP_EMP_BANK_ACCOUNT]
      WHERE 
      PWC_BSB_NUMBER IS NOT NULL
      ) tmp
      GROUP BY
      EMPLOYEE_ID,
      PWC_BSB_NUMBER,
      SYSTEM_NAME
      ) tmp2
      
      
      /*********************************************************************************************************
      01. COMPARE THE BSB BANK ACCOUNT NUMBER WITH A LIST OF VALID BSB BANK ACCOUNT NUMBER
      ********************************************************************************************************/
      
      UPDATE [DBO].[RES_EMPLOYEE]
      SET PAY_09 = 0
      
      SELECT EMPLOYEE_ID + '_' + ISNULL(SYSTEM_NAME,'') AS EMPLOYEE_SYSTEM_ID
      ,RIGHT('000000000000000'+dbo.fn_StripCharacters(BSB.BSB, '^0-9'),15) AS BSB
      ,BSB.LOCATION
      ,BSB.[Street address]
      ,PWC_BSB_NUMBER AS EFT_PWC_BSB_NUMBER
      ,EFT.AMOUNT as AMOUNT -- Added 08/06/2017 -Justin Moy
      ,EFT.Source as BSB_SOURCE -- Added 08/06/2017 -Justin Moy
      ,case when BSB.BANK IS NULL
      THEN 'PWC_UNKNOWN'
      ELSE BSB.BANK 
      END AS BANK -- Added 08/06/2017 -Justin Moy
      INTO #CTE_BANK
      FROM --[dbo].[PREP_BANK_EFT] AS EFT -- Removed 08/06/2017 -Justin Moy
      dbo.TMP_BSB_LIST as EFT -- Added 08/06/2017 -Justin Moy
      LEFT JOIN
      [DA_Master_DataSet].[dbo].[RAW_BSB_LISTING] AS BSB
      ON EFT.PWC_BSB_NUMBER = RIGHT('000000000000000'+dbo.fn_StripCharacters(BSB.BSB, '^0-9'),15)
      
      /*******************************************************************************************************
      02. UPDATE [RES_EMPLOYEE] TESTING RESULTS TABLE
      ********************************************************************************************************/
      
      UPDATE [DBO].[RES_EMPLOYEE]
      SET PAY_09 = 1
      WHERE Employee_ID + '_' + ISNULL(SYSTEM_NAME,'') IN 
      (
      SELECT CTE_BANK.EMPLOYEE_SYSTEM_ID
      FROM #CTE_BANK CTE_BANK
      WHERE CTE_BANK.BSB IS NULL
      )
      
      /*******************************************************************************************************
      03. CREATE [RES_BANK_VALIDITY] RESULT TABLE 
      *******************************************************************************************************/
      SELECT DISTINCT	 
      EMPLOYEE_SYSTEM_ID,
      EFT_PWC_BSB_NUMBER,
      BANK, -- Added 08/06/2017 -Justin Moy
      BSB_SOURCE,
      AMOUNT, -- Added 08/06/2017 -Justin Moy
      0 AS BSB_RESULT 
      INTO DBO.RES_BANK_VALIDITY
      FROM #CTE_BANK AS EFT
      
      /*******************************************************************************************************
      04. UPDATE [RES_BANK_VALIDITY] TESTING RESULTS TABLE
      ********************************************************************************************************/
      
      UPDATE [DBO].[RES_BANK_VALIDITY]
      SET BSB_RESULT = 1
      WHERE  EFT_PWC_BSB_NUMBER IN 
      (
      SELECT DISTINCT	 EFT_PWC_BSB_NUMBER
      FROM #CTE_BANK AS EFT
      WHERE BSB IS NULL
      )
      
      /*******************************************************************************************************
      05. UPDATE TESTING TABLE WITH INFORMATION REQUIRED BY QLIKVIEW
      *******************************************************************************************************/
      
      UPDATE 
      [DBO].[RES_EMPLOYEE]
      SET
      PAY_09 = 1
      WHERE EMPLOYEE_SYSTEM_ID = 'PWC_TEST_EXECUTED_'
      
      
      
      --Comment out by Fei on 17/02/2016 : Change invalid BSB test at payslip level using eft data instead of employee bank detail data
      /*********************************************************************************************************
      01. COMPARE THE BSB BANK ACCOUNT NUMBER WITH A LIST OF VALID BSB BANK ACCOUNT NUMBER
      ********************************************************************************************************
      
      UPDATE [DBO].[RES_EMPLOYEE]
      SET PAY_09 = 0
      
      ;WITH CTE_BANK
      AS 
      (
      SELECT EMPLOYEE_ID + '_' + ISNULL(SYSTEM_NAME,'') AS EMPLOYEE_SYSTEM_ID
      ,RIGHT('000000000000000'+dbo.fn_StripCharacters(BSB.BSB, '^0-9'),15) AS BSB
      ,BSB.LOCATION
      ,BSB.[Street address]
      FROM [dbo].[PREP_EMP_BANK_ACCOUNT] AS BA
      LEFT JOIN
      [DA_Master_DataSet].[dbo].[RAW_BSB_LISTING] AS BSB
      ON BA.PWC_BSB_NUMBER = RIGHT('000000000000000'+dbo.fn_StripCharacters(BSB.BSB, '^0-9'),15)
      )
      
      /*******************************************************************************************************
      02. UPDATE [RES_EMPLOYEE] TESTING RESULTS TABLE
      ********************************************************************************************************/
      
      UPDATE [DBO].[RES_EMPLOYEE]
      SET PAY_09 = 1
      WHERE Employee_ID + '_' + ISNULL(SYSTEM_NAME,'') IN 
      (SELECT CTE_BANK.EMPLOYEE_SYSTEM_ID
      FROM CTE_BANK
      WHERE CTE_BANK.BSB IS NULL)
      
      /*******************************************************************************************************
      03. UPDATE TESTING TABLE WITH INFORMATION REQUIRED BY QLIKVIEW
      *******************************************************************************************************/
      
      UPDATE 
      [DBO].[RES_EMPLOYEE]
      SET
      PAY_09 = 1
      WHERE EMPLOYEE_SYSTEM_ID = 'PWC_TEST_EXECUTED_'
      
      *******************************************************************************************************/USE [z'9bbaf92f-d960-4e33-a9cd-228c72cc97ef]
      GO
      /****** Object:  StoredProcedure [dbo].[32.TST_DUPLICATE_PAYSLIP]    Script Date: 4/10/2018 10:25:16 AM ******/
      SET ANSI_NULLS ON
      GO
      SET QUOTED_IDENTIFIER ON
      GO
      ALTER PROC [dbo].[32.TST_DUPLICATE_PAYSLIP]
      AS
      
      /************************************************************************************************************
      *                           DATA ASSURANCE                                                                  *
      *************************************************************************************************************
      UPDATES            - Version 0.1 {11/02/2015} {Simon Tsai} - {Created test}
      - Version 0.2 {04/03/2015} {Simon Tsai} - {Added Commentary}
      - Version 0.3 {17/08/2015} {Fei Li} - {Added PWC_DUPLICATE_ID}
      
      SCRIPT DESCRIPTION - {Test for duplicate payslips}
      
      TABLE INFORMATION
      INPUT TABLE(S)
      - [DBO].[PREP_PAYSLIPS_DETAILS]
      
      OUTPUT TABLE(S)
      - [DBO].[RES_PAYSLIP]
      - [DBO].[PREP_PAYSLIPS_DETAILS]
      
      SUMMARY OF SCRIPT  - 01. CREATE CTE TO CAPTURE MULTIPLE PAYSLIP ID FOR A PERIOD WITH THE SAME INFORMATION
      - 02. UPDATE [RES_PAYSLIP] TEST RESULTS TABLE
      - 03. UPDATE TESTING TABLE WITH INFORMATION REQUIRED BY QLIKVIEW
      - 04. CREATE CTE TO CAPTURE MULTIPLE PAYSLIP ID FOR A PERIOD WITH THE SAME INFORMATION
      - 05. UPDATE [PREP_PAYSLIPS_DETAILS] TABLE WITH PWC_DUPLICATE_FLAG FOR DUPLICATE JOURNALS
      IDENTIFIED
      
      *************************************************************************************************************
      01. CREATE CTE TO CAPTURE MULTIPLE PAYSLIP ID FOR A PERIOD WITH THE SAME INFORMATION
      ************************************************************************************************************/
      
      UPDATE [DBO].[RES_PAYSLIP]
      SET PAY_22 = 0
      
      ;WITH CTE_PAYSLIP
      AS
      (
      SELECT DISTINCT EMPLOYEE_ID
      ,JOB_ID
      ,PAYSLIP_ID
      ,PAYCODE_ID
      ,PAYCODE_DESC
      ,[START_DATE]
      ,[END_DATE]
      ,[HOURS]
      ,PAYRATE
      ,AMOUNT
      ,[DESCRIPTION]
      ,ROW_NUMBER() OVER (ORDER BY EMPLOYEE_ID,JOB_ID,PAYSLIP_ID,SUM(AMOUNT)) AS 'PWC_DUPLICATE_ID'
      FROM [dbo].[PREP_PAYSLIPS_DETAILS]
      GROUP BY EMPLOYEE_ID
      ,JOB_ID
      ,PAYSLIP_ID
      ,PAYCODE_ID
      ,PAYCODE_DESC
      ,[START_DATE]
      ,[END_DATE]
      ,[HOURS]
      ,PAYRATE
      ,AMOUNT
      ,[DESCRIPTION]
      HAVING COUNT(1) > 1 AND AMOUNT <> 0
      )
      
      /************************************************************************************************************
      02. UPDATE [RES_PAYSLIP] TEST RESULTS TABLE
      ************************************************************************************************************/
      
      UPDATE [DBO].[RES_PAYSLIP]
      SET PAY_22 = 1
      WHERE PAYSLIP_ID IN (
      SELECT DISTINCT PAYSLIP_ID
      FROM CTE_PAYSLIP)
      
      
      /***********************************************************************************************************
      03. UPDATE TESTING TABLE WITH INFORMATION REQUIRED BY QLIKVIEW
      ***********************************************************************************************************/
      
      UPDATE 
      [DBO].[RES_PAYSLIP]
      SET
      PAY_22 = 1
      WHERE PAYSLIP_ID = 'PWC_TEST_EXECUTED_'
      
      /***********************************************************************************************************
      04. CREATE CTE TO CAPTURE MULTIPLE PAYSLIP ID FOR A PERIOD WITH THE SAME INFORMATION
      ***********************************************************************************************************/
      
      ;WITH CTE_PAYSLIP
      AS
      (
      SELECT DISTINCT EMPLOYEE_ID
      ,JOB_ID
      ,PAYSLIP_ID
      ,PAYCODE_ID
      ,PAYCODE_DESC
      ,[START_DATE]
      ,[END_DATE]
      ,[HOURS]
      ,PAYRATE
      ,AMOUNT
      ,[DESCRIPTION]
      ,ROW_NUMBER() OVER (ORDER BY EMPLOYEE_ID,JOB_ID,PAYSLIP_ID,SUM(AMOUNT)) AS 'PWC_DUPLICATE_ID'
      FROM [dbo].[PREP_PAYSLIPS_DETAILS]
      GROUP BY EMPLOYEE_ID
      ,JOB_ID
      ,PAYSLIP_ID
      ,PAYCODE_ID
      ,PAYCODE_DESC
      ,[START_DATE]
      ,[END_DATE]
      ,[HOURS]
      ,PAYRATE
      ,AMOUNT
      ,[DESCRIPTION]
      HAVING COUNT(1) > 1 AND AMOUNT <> 0
      )
      
      /***********************************************************************************************************
      05. UPDATE [PREP_PAYSLIPS_DETAILS] TABLE WITH PWC_DUPLICATE_FLAG FOR DUPLICATE JOURNALS IDENTIFIED
      ***********************************************************************************************************/
      
      UPDATE [dbo].[PREP_PAYSLIPS_DETAILS]
      SET PWC_DUPLICATE_FLAG = CASE 
      WHEN ISNULL(CTE_PAYSLIP.EMPLOYEE_ID,'') = '' 
      THEN 0
      ELSE 1
      END,
      PWC_DUPLICATE_ID=CTE_PAYSLIP.PWC_DUPLICATE_ID
      FROM [dbo].[PREP_PAYSLIPS_DETAILS] AS PAYSLIP
      LEFT JOIN
      CTE_PAYSLIP 
      ON ISNULL(CTE_PAYSLIP.EMPLOYEE_ID,'') = ISNULL(PAYSLIP.EMPLOYEE_ID,'')
      AND
      ISNULL(CTE_PAYSLIP.JOB_ID,'') = ISNULL(PAYSLIP.JOB_ID,'')
      AND
      ISNULL(CTE_PAYSLIP.PAYSLIP_ID,'') = ISNULL(PAYSLIP.PAYSLIP_ID,'')
      AND 
      ISNULL(CTE_PAYSLIP.PAYCODE_ID,'') = ISNULL(PAYSLIP.PAYCODE_ID,'')
      AND
      ISNULL(CTE_PAYSLIP.PAYCODE_DESC,'') = ISNULL(PAYSLIP.PAYCODE_DESC,'')
      AND
      ISNULL(CTE_PAYSLIP.[START_DATE],'') = ISNULL(PAYSLIP.[START_DATE],'')
      AND  
      ISNULL(CTE_PAYSLIP.[END_DATE],'') = ISNULL(PAYSLIP.[END_DATE],'')
      AND 
      ISNULL(CTE_PAYSLIP.[HOURS],0) = ISNULL(PAYSLIP.[HOURS],0)
      AND
      ISNULL(CTE_PAYSLIP.PAYRATE,0) = ISNULL(PAYSLIP.PAYRATE,0)
      AND
      ISNULL(CTE_PAYSLIP.AMOUNT,0) = ISNULL(PAYSLIP.AMOUNT,0)USE [z'9bbaf92f-d960-4e33-a9cd-228c72cc97ef]
      GO
      /****** Object:  StoredProcedure [dbo].[33.TST_STARTER_LEAVER_RECONCILIATION]    Script Date: 4/10/2018 10:26:05 AM ******/
      SET ANSI_NULLS ON
      GO
      SET QUOTED_IDENTIFIER ON
      GO
      ALTER PROC [dbo].[33.TST_STARTER_LEAVER_RECONCILIATION]
      AS
      
      /************************************************************************************************************************
      *                           DATA ASSURANCE                                                                              *
      *************************************************************************************************************************
      UPDATES            - Version 0.1 {18/02/2015} {Simon Tsai} - {Created test}
      - Version 0.2 {04/03/2015} {Simon Tsai} - {Added Commentary}
      - Version 0.3 {08/12/2015} {Fei Li} - {Remove filter on the new hire calculation for Termination Date after Audit Period End}
      {Remove filter on the termination calculation on Start Date before Audit Period End}
      
      SCRIPT DESCRIPTION - {Reconciliation test for
      Starting employee number 
      + new hire
      - terminated
      = Closing employee number}
      
      TABLE INFORMATION
      INPUT TABLE(S)
      - [DBO].[PREP_EMP_MASTER] 
      - [DBO].[PREP_PAYSLIPS_HEADER]
      
      OUTPUT TABLE(S)
      - [DBO].[PREP_EMP_MASTER]
      
      SUMMARY OF SCRIPT  - 01. CALCULATE THE BEGINNING NUMBER OF EMPLOYEES (NOTE: THIS USES USER DEFINED START DATE)
      - 02. CALCULATE THE NUMBER OF NEW HIRES DURING THE YEAR
      (NOTE: THIS USES USER DEFINED START DATE AND END DATE)
      - 03. CALCULATE THE NUMBER OF TERMINATED EMPLOYEE DURING THE YEAR
      (NOTE: THIS USES USER DEFINED START DATE AND END DATE)
      - 04. CALCULATE THE NUMBER OF REMAINING EMPLOYEES ARE THE END OF THE YEAR
      (NOTE: THIS USES USER DEFINED END DATE)
      
      *************************************************************************************************************************
      01. CALCULATE THE BEGINNING NUMBER OF EMPLOYEES
      ************************************************************************************************************************/
      
      UPDATE [dbo].[PREP_EMP_MASTER]
      SET [PWC_BEGINNING_ACTIVE_EMPLOYEE] = CASE WHEN ISNULL(HEADER.EMPLOYEE_ID,'') = '' 
      THEN 0
      ELSE 1
      END
      FROM [dbo].[PREP_EMP_MASTER] AS [MASTER]
      LEFT JOIN
      (SELECT DISTINCT EMPLOYEE_ID FROM [dbo].[PREP_PAYSLIPS_HEADER]) AS HEADER
      ON [MASTER].[START_DATE] < (SELECT VALUE 
      FROM [STORE].[Setting] 
      WHERE [KEY] = 'AUDIT_PERIOD_START')
      AND 
      (
      [MASTER].PWC_TERMINATION_DATE >= (SELECT VALUE 
      FROM [STORE].[Setting] 
      WHERE [KEY] = 'AUDIT_PERIOD_START')
      OR 
      ISNULL([MASTER].PWC_TERMINATION_DATE, '') = ''
      )
      AND
      [MASTER].EMPLOYEE_ID = HEADER.EMPLOYEE_ID
      
      /************************************************************************************************************************
      02. CALCULATE THE NUMBER OF NEW HIRES DURING THE YEAR
      ************************************************************************************************************************/
      
      UPDATE [dbo].[PREP_EMP_MASTER]
      SET PWC_NEW_HIRE = CASE WHEN ISNULL(HEADER.EMPLOYEE_ID,'') = '' 
      THEN 0
      ELSE 1
      END
      FROM [dbo].[PREP_EMP_MASTER] AS [MASTER]
      LEFT JOIN
      (SELECT DISTINCT EMPLOYEE_ID FROM [dbo].[PREP_PAYSLIPS_HEADER]) AS HEADER
      ON [MASTER].[START_DATE] >= (SELECT VALUE 
      FROM [STORE].[Setting] 
      WHERE [KEY] = 'AUDIT_PERIOD_START')  
      AND 
      [MASTER].[START_DATE] <= (SELECT VALUE 
      FROM [STORE].[Setting] 
      WHERE [KEY] = 'AUDIT_PERIOD_END')
      /*AND																			Comment out by Fei on 18/02/2016
      (
      [MASTER].PWC_TERMINATION_DATE >= (SELECT VALUE 
      FROM [STORE].[Setting] 
      WHERE [KEY] = 'AUDIT_PERIOD_START')
      OR
      ISNULL([MASTER].PWC_TERMINATION_DATE, '') = ''
      )*/
      AND
      [MASTER].EMPLOYEE_ID = HEADER.EMPLOYEE_ID
      
      /************************************************************************************************************************
      03. CALCULATE THE NUMBER OF TERMINATED EMPLOYEE DURING THE YEAR
      ************************************************************************************************************************/
      
      UPDATE [dbo].[PREP_EMP_MASTER]
      SET PWC_TERMINATED = CASE WHEN ISNULL(HEADER.EMPLOYEE_ID,'') = ''
      THEN 0
      ELSE 1
      END
      FROM [dbo].[PREP_EMP_MASTER] AS [MASTER]
      LEFT JOIN
      (SELECT DISTINCT EMPLOYEE_ID FROM [dbo].[PREP_PAYSLIPS_HEADER]) AS HEADER
      ON [MASTER].PWC_TERMINATION_DATE >= (SELECT VALUE 
      FROM [STORE].[Setting] 
      WHERE [KEY] = 'AUDIT_PERIOD_START')
      AND 
      [MASTER].PWC_TERMINATION_DATE <= (SELECT VALUE 
      FROM [STORE].[Setting] 
      WHERE [KEY] = 'AUDIT_PERIOD_END') 
      /*AND																			Comment out by Fei on 18/02/2016
      [MASTER].START_DATE <= (SELECT VALUE	
      FROM [STORE].[Setting] 
      WHERE [KEY] = 'AUDIT_PERIOD_END') */
      AND
      [MASTER].EMPLOYEE_ID = HEADER.EMPLOYEE_ID
      
      
      /************************************************************************************************************************
      04. CALCULATE THE NUMBER OF REMAINING EMPLOYEES ARE THE END OF THE YEAR
      ************************************************************************************************************************/
      
      UPDATE [dbo].[PREP_EMP_MASTER]
      SET PWC_ENDING_ACTIVE_EMPLOYEE = CASE 
      WHEN ISNULL(HEADER.EMPLOYEE_ID,'') = '' 
      THEN 0
      ELSE 1
      END
      FROM [dbo].[PREP_EMP_MASTER] AS [MASTER]
      LEFT JOIN
      (SELECT DISTINCT EMPLOYEE_ID FROM [dbo].[PREP_PAYSLIPS_HEADER]) AS HEADER
      ON START_DATE <= (SELECT VALUE 
      FROM [STORE].[Setting] 
      WHERE [KEY] = 'AUDIT_PERIOD_END')
      AND
      (
      ISNULL([MASTER].PWC_TERMINATION_DATE, '') = ''
      OR 
      [MASTER].PWC_TERMINATION_DATE > (SELECT VALUE 
      FROM [STORE].[Setting] 
      WHERE [KEY] = 'AUDIT_PERIOD_END') 
      )
      AND
      [MASTER].EMPLOYEE_ID = HEADER.EMPLOYEE_IDUSE [z'9bbaf92f-d960-4e33-a9cd-228c72cc97ef]
      GO
      /****** Object:  StoredProcedure [dbo].[34.TST_PAYSLIP_BEFORE_START_DATE]    Script Date: 4/10/2018 10:48:56 AM ******/
      SET ANSI_NULLS ON
      GO
      SET QUOTED_IDENTIFIER ON
      GO
      ALTER PROC [dbo].[34.TST_PAYSLIP_BEFORE_START_DATE]
      AS
      
      /********************************************************************************************************************
      *                           DATA ASSURANCE                                                                          *
      *********************************************************************************************************************
      UPDATES            - Version 0.1 {24/02/2014} {Simon Tsai} - {Created test}
      
      SCRIPT DESCRIPTION - {Test for employees who received a payslip before their starting date}
      
      TABLE INFORMATION
      INPUT TABLE(S)
      - [DBO].[PREP_PAYSLIPS_HEADER] 
      - [DBO].[PREP_EMP_MASTER]
      
      OUTPUT TABLE(S)
      - [DBO].[RES_PAYSLIP]
      
      SUMMARY OF SCRIPT  - 01. CREATE CTE OF ALL PAYSLIP WHERE THE EMPLOYEE START DATE IS AFTER THE PAYMENT DATE
      - 02. UPDATE TEST TABLE
      - 03. UPDATE TESTING TABLE WITH INFORMATION REQUIRED BY QLIKVIEW
      
      *********************************************************************************************************************
      01. CREATE CTE OF ALL PAYSLIP WHERE THE EMPLOYEE START DATE IS AFTER THE PAYMENT DATE
      ********************************************************************************************************************/
      
      ;WITH CTE_RESULTS
      AS
      (
      SELECT HEADER.PAYSLIP_ID
      FROM [dbo].[PREP_PAYSLIPS_HEADER] AS HEADER
      LEFT JOIN
      [dbo].[PREP_EMP_MASTER] AS MASTER
      ON HEADER.EMPLOYEE_ID = [MASTER].EMPLOYEE_ID 
      WHERE [MASTER].[START_DATE] > HEADER.PAYMENT_DATE
      )
      
      /********************************************************************************************************************
      02. UPDATE TEST TABLE
      ********************************************************************************************************************/
      
      UPDATE [dbo].[RES_PAYSLIP]
      SET PAY_30 = CASE WHEN ISNULL(CTE_RESULTS.PAYSLIP_ID,'') = '' THEN 0
      ELSE 1
      END
      FROM [dbo].[RES_PAYSLIP]
      LEFT JOIN
      CTE_RESULTS
      ON CTE_RESULTS.PAYSLIP_ID = [dbo].[RES_PAYSLIP].PAYSLIP_ID
      
      /********************************************************************************************************************
      03. UPDATE TESTING TABLE WITH INFORMATION REQUIRED BY QLIKVIEW
      ********************************************************************************************************************/
      
      UPDATE [dbo].[RES_PAYSLIP]
      SET PAY_30 = 1
      WHERE [dbo].[RES_PAYSLIP].PAYSLIP_ID = 'PWC_TEST_EXECUTED_' 
      
      USE [z'9bbaf92f-d960-4e33-a9cd-228c72cc97ef]
      GO
      /****** Object:  StoredProcedure [dbo].[35.TST_OVERTIME_ANALYSIS]    Script Date: 4/10/2018 10:49:21 AM ******/
      SET ANSI_NULLS ON
      GO
      SET QUOTED_IDENTIFIER ON
      GO
      ALTER PROC [dbo].[35.TST_OVERTIME_ANALYSIS]
      AS
      
      /********************************************************************************************************************
      *                           DATA ASSURANCE                                                                          *
      *********************************************************************************************************************
      UPDATES            - Version 0.1 {25/08/2015} {Fei Li} - {Created test}
      
      SCRIPT DESCRIPTION - {Test for employees who have overtime pay}
      
      TABLE INFORMATION
      INPUT TABLE(S)
      - [DBO].[PREP_PAYSLIPS_HEADER] 
      
      OUTPUT TABLE(S)
      - [DBO].[RES_PAYSLIP]
      
      SUMMARY OF SCRIPT  - 01. UPDATE TEST RESULT TABLE
      - 02. UPDATE TESTING TABLE WITH INFORMATION REQUIRED BY QLIKVIEW
      
      *********************************************************************************************************************
      01. UPDATE TEST TABLE
      ********************************************************************************************************************/
      
      UPDATE [dbo].[RES_PAYSLIP]
      SET PAY_13=CASE WHEN RES.PAYSLIP_ID IN 
      (
      SELECT 
      HEADER.PAYSLIP_ID 
      FROM 
      [dbo].[PREP_PAYSLIPS_HEADER] AS HEADER 
      WHERE [OVERTIME_VALUE]<>0
      )
      THEN 1
      ELSE 0
      END
      FROM [dbo].[RES_PAYSLIP] RES
      
      /********************************************************************************************************************
      03. UPDATE TESTING TABLE WITH INFORMATION REQUIRED BY QLIKVIEW
      ********************************************************************************************************************/
      
      UPDATE [dbo].[RES_PAYSLIP]
      SET PAY_13 = 1
      WHERE [dbo].[RES_PAYSLIP].PAYSLIP_ID = 'PWC_TEST_EXECUTED_'
      USE [z'9bbaf92f-d960-4e33-a9cd-228c72cc97ef]
      GO
      /****** Object:  StoredProcedure [dbo].[36A.TST_ANN_LEAVE_EXCEEDS_20DAYS]    Script Date: 4/10/2018 10:50:05 AM ******/
      SET ANSI_NULLS ON
      GO
      SET QUOTED_IDENTIFIER ON
      GO
      ALTER PROC [dbo].[36A.TST_ANN_LEAVE_EXCEEDS_20DAYS]
      AS
      
      /***********************************************************************************************************************
      *                           DATA ASSURANCE                                                                             *
      ************************************************************************************************************************
      UPDATES            - Version 0.1 {31/08/2015} {Fei Li} - {Created tests}
      
      
      SCRIPT DESCRIPTION - {Creates the test for annual leave exceeds 20days}
      
      TABLE INFORMATION
      INPUT TABLE(S)
      - [dbo].[PREP_EMP_LEAVE_TAKEN]
      
      OUTPUT TABLE(S)
      - [dbo].[RES_LEAVE]
      
      SUMMARY OF SCRIPT  - 01. UPDATE [RES_LEAVE] TEST RESULTS TABLE 
      - 02. TEST WHETHER ANNUAL LEAVE EXCEEDS 20 DAYS
      - 03. UPDATE TESTING TABLE WITH INFORMATION REQUIRED BY QLIKVIEW
      
      ************************************************************************************************************************
      01. UPDATE [RES_LEAVE] TEST RESULTS TABLE 
      ***********************************************************************************************************************/
      
      UPDATE [dbo].[RES_LEAVE]
      SET PAY_31 = CASE 
      WHEN [dbo].[RES_LEAVE].[EMPLOYEE_ID] IN
      (	     
      SELECT 
      DISTINCT [EMPLOYEE_ID]
      FROM 
      [dbo].[PREP_EMP_LEAVE_TAKEN]
      
      /***********************************************************************************************************************
      02. TEST WHETHER ANNUAL LEAVE EXCEEDS 20 DAYS
      ***********************************************************************************************************************/
      WHERE LEAVE_TYPE='ANNUAL'
      GROUP BY EMPLOYEE_ID
      HAVING SUM([DAYS])>20
      ) THEN 1
      ELSE 0
      END
      
      /**********************************************************************************************************************
      03. UPDATE TESTING TABLE WITH INFORMATION REQUIRED BY QLIKVIEW
      **********************************************************************************************************************/
      
      UPDATE 
      [dbo].[RES_LEAVE]
      SET
      PAY_31 = 1
      WHERE EMPLOYEE_ID = 'PWC_TEST_EXECUTED_'USE [z'9bbaf92f-d960-4e33-a9cd-228c72cc97ef]
      GO
      /****** Object:  StoredProcedure [dbo].[36B.TST_SICK_LEAVE_EXCEEDS_10DAYS]    Script Date: 4/10/2018 10:50:33 AM ******/
      SET ANSI_NULLS ON
      GO
      SET QUOTED_IDENTIFIER ON
      GO
      ALTER PROC [dbo].[36B.TST_SICK_LEAVE_EXCEEDS_10DAYS]
      AS
      
      /***********************************************************************************************************************
      *                           DATA ASSURANCE                                                                             *
      ************************************************************************************************************************
      UPDATES            - Version 0.1 {31/08/2015} {Fei Li} - {Created tests}
      
      
      SCRIPT DESCRIPTION - {Creates the test for sic leave exceeds 20days}
      
      TABLE INFORMATION
      INPUT TABLE(S)
      - [dbo].[PREP_EMP_LEAVE_TAKEN]
      
      OUTPUT TABLE(S)
      - [dbo].[RES_LEAVE]
      
      SUMMARY OF SCRIPT  - 01. UPDATE [RES_LEAVE] TEST RESULTS TABLE 
      - 02. TEST WHETHER SICK LEAVE EXCEEDS 10 DAYS
      - 03. UPDATE TESTING TABLE WITH INFORMATION REQUIRED BY QLIKVIEW
      
      ************************************************************************************************************************
      01. UPDATE [RES_LEAVE] TEST RESULTS TABLE 
      ***********************************************************************************************************************/
      
      UPDATE [dbo].[RES_LEAVE]
      SET PAY_32 = CASE 
      WHEN [dbo].[RES_LEAVE].[EMPLOYEE_ID] IN
      (	     
      SELECT 
      DISTINCT [EMPLOYEE_ID]
      FROM 
      [dbo].[PREP_EMP_LEAVE_TAKEN]
      
      
      
      /***********************************************************************************************************************
      02. TEST WHETHER SICK LEAVE EXCEEDS 10 DAYS
      ***********************************************************************************************************************/
      WHERE LEAVE_TYPE='SICK'
      GROUP BY EMPLOYEE_ID
      HAVING SUM([DAYS])>10
      ) THEN 1
      ELSE 0
      END
      
      /**********************************************************************************************************************
      03. UPDATE TESTING TABLE WITH INFORMATION REQUIRED BY QLIKVIEW
      **********************************************************************************************************************/
      
      UPDATE 
      [dbo].[RES_LEAVE]
      SET
      PAY_32 = 1
      WHERE EMPLOYEE_ID = 'PWC_TEST_EXECUTED_'USE [z'9bbaf92f-d960-4e33-a9cd-228c72cc97ef]
      GO
      /****** Object:  StoredProcedure [dbo].[36C.TST_SICK_LEAVE_EXCEEDS_ANN_LEAVE]    Script Date: 4/10/2018 10:50:57 AM ******/
      SET ANSI_NULLS ON
      GO
      SET QUOTED_IDENTIFIER ON
      GO
      ALTER PROC [dbo].[36C.TST_SICK_LEAVE_EXCEEDS_ANN_LEAVE]
      AS
      
      /***********************************************************************************************************************
      *                           DATA ASSURANCE                                                                             *
      ************************************************************************************************************************
      UPDATES            - Version 0.1 {31/08/2015} {Fei Li} - {Created tests}
      
      
      SCRIPT DESCRIPTION - {Creates the test for sicK leave exceeds annual leave}
      
      TABLE INFORMATION
      INPUT TABLE(S)
      - [dbo].[PREP_EMP_LEAVE_TAKEN]
      
      OUTPUT TABLE(S)
      - [dbo].[RES_LEAVE]
      
      SUMMARY OF SCRIPT  - 01. CREATE CTE TABLES
      - 02. UPDATE [RES_LEAVE] TEST RESULTS TABLE 
      - 03. TEST WHETHER SICK LEAVE EXCEEDS ANNUAL LEAVE
      - 04. UPDATE TESTING TABLE WITH INFORMATION REQUIRED BY QLIKVIEW
      
      ************************************************************************************************************************
      01. CREATE CTE TABLES 
      ***********************************************************************************************************************/
      
      ;WITH CTE_ANN
      AS
      (SELECT [EMPLOYEE_ID]
      ,SUM([DAYS]) AS 'ANN_DAYS'
      FROM 
      [dbo].[PREP_EMP_LEAVE_TAKEN] SICK
      WHERE 
      LEAVE_TYPE = 'ANNUAL'
      GROUP BY 
      EMPLOYEE_ID
      )
      
      ,CTE_SICK
      AS
      (
      SELECT [EMPLOYEE_ID]
      ,SUM([DAYS]) AS 'SICK_DAYS'
      FROM 
      [dbo].[PREP_EMP_LEAVE_TAKEN] SICK
      WHERE 
      LEAVE_TYPE = 'SICK'
      GROUP BY 
      EMPLOYEE_ID
      )
      
      
      /************************************************************************************************************************
      02. UPDATE [RES_LEAVE] TEST RESULTS TABLE 
      ***********************************************************************************************************************/
      
      UPDATE [dbo].[RES_LEAVE]
      SET PAY_33 = CASE 
      WHEN [dbo].[RES_LEAVE].[EMPLOYEE_ID] IN
      (	     
      SELECT 
      DISTINCT LEAVE.[EMPLOYEE_ID]
      FROM 
      [dbo].[PREP_EMP_LEAVE_TAKEN] LEAVE
      LEFT JOIN 
      CTE_ANN CTE_ANN
      ON 
      LEAVE.EMPLOYEE_ID=CTE_ANN.EMPLOYEE_ID
      LEFT JOIN 
      CTE_SICK CTE_SICK
      ON 
      LEAVE.EMPLOYEE_ID=CTE_SICK.EMPLOYEE_ID
      
      /***********************************************************************************************************************
      03. TEST WHETHER SICK LEAVE EXCEEDS ANNUAL LEAVE
      ***********************************************************************************************************************/
      WHERE 
      (ISNULL(CTE_SICK.SICK_DAYS,0)-ISNULL(CTE_ANN.ANN_DAYS,0))>0
      
      ) THEN 1
      ELSE 0
      END
      
      /**********************************************************************************************************************
      04. UPDATE TESTING TABLE WITH INFORMATION REQUIRED BY QLIKVIEW
      **********************************************************************************************************************/
      
      UPDATE 
      [dbo].[RES_LEAVE]
      SET
      PAY_33 = 1
      WHERE EMPLOYEE_ID = 'PWC_TEST_EXECUTED_'USE [z'9bbaf92f-d960-4e33-a9cd-228c72cc97ef]
      GO
      /****** Object:  StoredProcedure [dbo].[36D.TST_NON_ZERO_UNPAID_LEAVE]    Script Date: 4/10/2018 10:51:23 AM ******/
      SET ANSI_NULLS ON
      GO
      SET QUOTED_IDENTIFIER ON
      GO
      
      
      ALTER PROC [dbo].[36D.TST_NON_ZERO_UNPAID_LEAVE]
      AS
      
      /***********************************************************************************************************************
      *                           DATA ASSURANCE                                                                             *
      ************************************************************************************************************************
      UPDATES            - Version 0.1 {31/08/2015} {Fei Li} - {Created tests}
      - Version 0.2 {21/08/2017} {Justin Moy} - {Changed test to use parameter setting}
      
      
      SCRIPT DESCRIPTION - {Creates the test for unpaid leave with non zero dollars amount}
      
      TABLE INFORMATION
      INPUT TABLE(S)
      - [dbo].[PREP_EMP_LEAVE_TAKEN]
      
      OUTPUT TABLE(S)
      - [dbo].[RES_LEAVE]
      
      SUMMARY OF SCRIPT  - 01. UPDATE [RES_LEAVE] TEST RESULTS TABLE 
      - 02. TEST WHETHER UNPAID LEAVE WITH NON ZERO DOLLAR AMOUNT
      - 03. UPDATE TESTING TABLE WITH INFORMATION REQUIRED BY QLIKVIEW
      
      
      ************************************************************************************************************************
      00. Clean up parameter
      ***********************************************************************************************************************/
      
      --error check
      DECLARE @LWOP_CHECK varchar(max)
      SET @LWOP_CHECK = (SELECT [Value]
      FROM [Store].[Setting]
      WHERE [Key] = 'LEAVE_WITHOUT_PAY')
      
      --print substring(@LWOP_CHECK,1,22)
      
      
      IF (substring(rtrim(ltrim(@LWOP_CHECK)),1,22) <> 'MATCH(CLI_PAYCODE_ID,"' AND ltrim(rtrim(@LWOP_CHECK)) <> '')
      BEGIN
      raiserror('ERROR: LWOP parameter is incorrect, please ensure it is copied directly from ACL in the format: MATCH(CLI_PAYCODE_ID,"XXXX","XXXXX")', 16, 1); 
      END
      ELSE
      BEGIN
      -- now we need to clean it up
      DECLARE @LWOP varchar(max)
      
      -- first check it is not null
      
      
      --declare the parameter and clean up it to remove the filter
      IF len(@LWOP_CHECK)>0
      BEGIN
      SET @LWOP = replace(
      substring(rtrim(ltrim(@LWOP_CHECK))
      ,22,len(rtrim(ltrim(@LWOP_CHECK)))-22)
      ,'"','')
      END
      ELSE
      BEGIN
      SET @LWOP = NULL
      END
      END
      
      ---- testing this this
      --print @LWOP
      --SELECT Text
      --FROM BIA.SimpleSplit(@LWOP,',')
      
      
      
      /***********************************************************************************************************************
      01. UPDATE [RES_LEAVE] TEST RESULTS TABLE 
      ***********************************************************************************************************************/
      
      
      UPDATE [dbo].[RES_LEAVE]
      SET PAY_34 = CASE 
      WHEN [dbo].[RES_LEAVE].[EMPLOYEE_ID] IN
      (	     
      SELECT 
      DISTINCT [EMPLOYEE_ID]
      FROM 
      [dbo].[PREP_EMP_LEAVE_TAKEN]
      
      
      
      /***********************************************************************************************************************
      02. TEST WHETHER Type is LWOP from parameter
      ***********************************************************************************************************************/
      --WHERE LEAVE_SUB_TYPE LIKE '%UNPAID%'AND [AMOUNT]<>0 --old logic, removed, JM 21/08/2017
      
      WHERE PAYCODE_ID IN 
      (
      SELECT Text
      FROM BIA.SimpleSplit(@LWOP,',')
      )
      AND [AMOUNT]<>0
      
      ) THEN 1
      ELSE 0
      END
      
      /**********************************************************************************************************************
      03. UPDATE TESTING TABLE WITH INFORMATION REQUIRED BY QLIKVIEW
      **********************************************************************************************************************/
      
      UPDATE 
      [dbo].[RES_LEAVE]
      SET
      PAY_34 = 1
      WHERE EMPLOYEE_ID = 'PWC_TEST_EXECUTED_'
      
      
      
      
      ----check
      --select *
      --FROM [dbo].[RES_LEAVE]
      --WHERE PAY_34 <> 0USE [z'9bbaf92f-d960-4e33-a9cd-228c72cc97ef]
      GO
      /****** Object:  StoredProcedure [dbo].[36E.TST_SICK_LEAVE_LESS_THAN_ONE_WORKING_DAY]    Script Date: 4/10/2018 10:51:57 AM ******/
      SET ANSI_NULLS ON
      GO
      SET QUOTED_IDENTIFIER ON
      GO
      ALTER PROC [dbo].[36E.TST_SICK_LEAVE_LESS_THAN_ONE_WORKING_DAY]
      AS
      
      /***********************************************************************************************************************
      *                           DATA ASSURANCE                                                                             *
      ************************************************************************************************************************
      UPDATES            - Version 0.1 {31/08/2015} {Fei Li} - {Created tests}
      
      
      SCRIPT DESCRIPTION - {Creates the test for sick leave less than 1 working day}
      
      TABLE INFORMATION
      INPUT TABLE(S)
      - [dbo].[PREP_EMP_LEAVE_TAKEN]
      
      OUTPUT TABLE(S)
      - [dbo].[RES_LEAVE]
      
      SUMMARY OF SCRIPT  - 00. DECLARE WORKING HOURS VARIABLES
      - 01. UPDATE [RES_LEAVE] TEST RESULTS TABLE 
      - 02. TEST WHETHER SICK LEAVE LESS THAN 1 WORKING DAY
      - 03. UPDATE TESTING TABLE WITH INFORMATION REQUIRED BY QLIKVIEW
      
      ************************************************************************************************************************
      00. DECLARE WORKING HOURS 
      ***********************************************************************************************************************/
      DECLARE @WORKING_HOURS NUMERIC(18,4)
      
      SET @WORKING_HOURS = CONVERT(NUMERIC(18,4),
      (SELECT 
      [Value]
      FROM 
      [Store].[Setting]
      WHERE 
      [KEY]='8.0 Working hours per day'))
      
      /************************************************************************************************************************
      01. UPDATE [RES_LEAVE] TEST RESULTS TABLE 
      ***********************************************************************************************************************/
      
      UPDATE [dbo].[RES_LEAVE]
      SET PAY_35 = CASE 
      WHEN [dbo].[RES_LEAVE].[EMPLOYEE_ID] IN
      (	     
      SELECT 
      DISTINCT [EMPLOYEE_ID]
      FROM 
      [dbo].[PREP_EMP_LEAVE_TAKEN]
      
      
      
      /***********************************************************************************************************************
      02. TEST WHETHER SICK LEAVE LESS THAN ONE WORKING DAY
      ***********************************************************************************************************************/
      WHERE LEAVE_TYPE='SICK' AND [HOURS]<@WORKING_HOURS
      ) THEN 1
      ELSE 0
      END
      
      /**********************************************************************************************************************
      03. UPDATE TESTING TABLE WITH INFORMATION REQUIRED BY QLIKVIEW
      **********************************************************************************************************************/
      
      UPDATE 
      [dbo].[RES_LEAVE]
      SET
      PAY_35 = 1
      WHERE EMPLOYEE_ID = 'PWC_TEST_EXECUTED_'USE [z'9bbaf92f-d960-4e33-a9cd-228c72cc97ef]
      GO
      /****** Object:  StoredProcedure [dbo].[36F.TST_ONE_DAY_SICK_LEAVE]    Script Date: 4/10/2018 10:52:21 AM ******/
      SET ANSI_NULLS ON
      GO
      SET QUOTED_IDENTIFIER ON
      GO
      ALTER PROC [dbo].[36F.TST_ONE_DAY_SICK_LEAVE]
      AS
      
      /***********************************************************************************************************************
      *                           DATA ASSURANCE                                                                             *
      ************************************************************************************************************************
      UPDATES            - Version 0.1 {31/08/2015} {Fei Li} - {Created tests}
      
      
      SCRIPT DESCRIPTION - {Creates the test for 1 day sick leave}
      
      TABLE INFORMATION
      INPUT TABLE(S)
      - [dbo].[PREP_EMP_LEAVE_TAKEN]
      
      OUTPUT TABLE(S)
      - [dbo].[RES_LEAVE]
      
      SUMMARY OF SCRIPT  - 00. DECLARE WORKING HOURS VARIABLES
      - 01. UPDATE [RES_LEAVE] TEST RESULTS TABLE 
      - 02. TEST ONE DAY SICK LEAVE
      - 03. UPDATE TESTING TABLE WITH INFORMATION REQUIRED BY QLIKVIEW
      
      ************************************************************************************************************************
      00. DECLARE WORKING HOURS 
      ***********************************************************************************************************************/
      DECLARE @WORKING_HOURS NUMERIC(18,4)
      
      SET @WORKING_HOURS = CONVERT(NUMERIC(18,4),
      (SELECT 
      [Value]
      FROM 
      [Store].[Setting]
      WHERE 
      [KEY]='8.0 Working hours per day'))
      
      /************************************************************************************************************************
      01. UPDATE [RES_LEAVE] TEST RESULTS TABLE 
      ***********************************************************************************************************************/
      
      UPDATE [dbo].[RES_LEAVE]
      SET PAY_36 = CASE 
      WHEN [dbo].[RES_LEAVE].[EMPLOYEE_ID] IN
      (	     
      SELECT 
      DISTINCT [EMPLOYEE_ID]
      FROM 
      [dbo].[PREP_EMP_LEAVE_TAKEN]
      
      
      
      /***********************************************************************************************************************
      02. TEST ONE DAY SICK LEAVE
      ***********************************************************************************************************************/
      WHERE LEAVE_TYPE='SICK' AND [HOURS]=@WORKING_HOURS
      ) THEN 1
      ELSE 0
      END
      
      /**********************************************************************************************************************
      03. UPDATE TESTING TABLE WITH INFORMATION REQUIRED BY QLIKVIEW
      **********************************************************************************************************************/
      
      UPDATE 
      [dbo].[RES_LEAVE]
      SET
      PAY_36 = 1
      WHERE EMPLOYEE_ID = 'PWC_TEST_EXECUTED_'USE [z'9bbaf92f-d960-4e33-a9cd-228c72cc97ef]
      GO
      /****** Object:  StoredProcedure [dbo].[37.BLD_TEST_DESCRIPTION]    Script Date: 4/10/2018 10:53:54 AM ******/
      SET ANSI_NULLS ON
      GO
      SET QUOTED_IDENTIFIER ON
      GO
      ALTER PROC [dbo].[37.BLD_TEST_DESCRIPTION]
      AS
      
      /***********************************************************************************************************
      *                           DATA ASSURANCE                                                                 *
      ************************************************************************************************************
      UPDATES            - Version 0.1 {18/02/2015} {Simon Tsai} - {Created Script}
      - Version 0.2 {05/03/2015} {Simon Tsai} - {Added Commentary}
      - Version 0.3 {10/03/2015} {Simon Tsai} - {Added 26 - 39}
      - Version 0.4 {13/03/2015} {Simon Tsai} - {Added Test_Detailed_Description}
      - Version 0.5 {18/03/2015} {Simon Tsai} - {Added 40}
      - Version 0.6 {31/08/2015} {Fei Li} - {Added 31-36}
      
      SCRIPT DESCRIPTION - {TABLE TO SHOW TEST DESCRIPTION}
      
      TABLE INFORMATION
      INPUT TABLE(S)
      - N/A
      
      OUTPUT TABLE(S)
      - [DBO].[RES_TEST_DESCRIPTION]
      
      SUMMARY OF SCRIPT  - 01. DROP TABLE STATEMENT
      - 02. CREATE TABLE
      - 03. INSERT TEST USR_PAY_01 - EMPLOYEE - EMPLOYEE TO EMPLOYEE MATCH
      - 04. INSERT TEST USR_PAY_02 - EMPLOYEE - EMPLOYEE TO VENDOR MATCH
      - 05. INSERT TEST USR_PAY_03 - EMPLOYEE - EMPLOYEE WITH MISSING MASTER DATA
      - 06. INSERT TEST USR_PAY_05 - EMPLOYEE - EMPLOYEE WITH TERMINATION DATE BEFORE START DATE
      - 07. INSERT TEST USR_PAY_06 - EMPLOYEE - EMPLOYEE WITH NO PAYSLIP
      - 08. INSERT TEST USR_PAY_07 - EMPLOYEE - EMPLOYEE AGE ANALYSIS
      - 09. INSERT TEST USR_PAY_08 - EMPLOYEE - EMPLOYEE NAME VALIDITY
      - 10. INSERT TEST USR_PAY_09 - EMPLOYEE - EMPLOYEE BANK ACCOUNT VALIDITY
      - 11. INSERT TEST USR_PAY_10 - EMPLOYEE - TENURE ANALYSIS
      - 12. INSERT TEST USR_PAY_11 - EMPLOYEE - PAYROLL POSITION OVERLAP
      - 13. INSERT TEST USR_PAY_12 - PAYSLIP - PAYSLIP AFTER TERMINATION
      - 14. INSERT TEST USR_PAY_13 - PAYSLIP - OVERTIME ANALYSIS
      - 15. INSERT TEST USR_PAY_14 - PAYSLIP - EMPLOYEE WITH ONE PAYSLIP
      - 16. INSERT TEST USR_PAY_15 - PAYSLIP - ROUND DOLLAR PAYSLIP
      - 17. INSERT TEST USR_PAY_16 - PAYSLIP - EMPLOYEE NOT IN MASTER
      - 18. INSERT TEST USR_PAY_17 - PAYSLIP - MULTIPLE PAYSLIPS
      - 19. INSERT TEST USR_PAY_18 - PAYSLIP - PAY RATE CHANGES
      - 20. INSERT TEST USR_PAY_19 - PAYSLIP - SPREAD OF EACH PAYMENT TYPE
      - 21. INSERT TEST USR_PAY_20 - PAYSLIP - PAYSLIP PROCESSED ON WEEKEND OR OUTSIDE HOURS
      - 22. INSERT TEST USR_PAY_21 - PAYSLIP - EFT PAYMENTS MADE ON WEEKEND OR OUTSIDE HOURS
      - 23. INSERT TEST USR_PAY_22 - PAYSLIP - DUPLICATE PAYSLIP
      - 24. INSERT TEST USR_PAY_23 - PAYSLIP - UNUSUAL SPIKE IN BASE PAY
      - 25. INSERT TEST USR_PAY_24 - PAYSLIP - UNUSUAL SPIKE IN ADDITIONS BEFORE TAX
      
      - 26. INSERT TEST USR_PAY_25 - AUDIT - EMPLOYEE MOVEMENT
      - 27. INSERT TEST USR_PAY_26 - EMPLOYEE - EMPLOYEE GENDER PROFILE
      - 39. INSERT TEST USR_PAY_30 - PAYSLIP - PAYSLIPS BEFORE START DATE
      - 38. INSERT TEST USR_ALL - AUDIT - EMPLOYEE SUMMARY
      - 28. INSERT TEST USR_PAY_TB - AUDIT - PAYSLIPS TO TB RECONCILIATION
      - 29. INSERT TEST USR_PAY_EFT - AUDIT - PAYSLIPS TO EFT RECONCILIATION
      - 30. CREATE DYNAMIC STRING TO COLLECT ALL THE TEST FIELDS FOR RES_EMPLOYEE TESTS
      
      - 31. INSERT TEST PAY_31 - LEAVE - ANN LEAVE > 20 DAYS
      - 32. INSERT TEST PAY_32 - LEAVE - SICK LEAVE > 10 DAYS
      - 33. INSERT TEST PAY_33 - LEAVE - SICK LEAVE > ANN LEAVE
      - 34. INSERT TEST PAY_34 - LEAVE - UNPAID LEAVE <>0
      - 35. INSERT TEST PAY_35 - LEAVE - SICK < 1 DAYS
      - 36. INSERT TEST PAY_36 - LEAVE - SICK LEAVE =1 DAY
      
      - 37. SELECT ALL EMPLOYEE TEST RESULTS WITH PAYSLIP COUNT FOR RES_EMPLOYEE TESTS
      - 38. UNPIVOT FOR PAY_XX TESTS FOR RES_EMPLOYEE TESTS
      - 39. UPDATE [DBO].[RES_TEST_DESCRIPTION] WITH PWC_ FIELDS FOR RES_EMPLOYEE TESTS
      - 41. CREATE DYNAMIC STRING TO COLLECT ALL THE TEST FIELDS FOR RES_PAYSLIP TESTS
      - 42. FOR EACH PAYSLIP FIND THE EMPLOYEE ID AND THE PAYSLIP AMOUNT
      - 44. UNPIVOT FOR PAY_XX TESTS FOR RES_PAYSLIP TESTS 
      - 45. UPDATE [DBO].[RES_TEST_DESCRIPTION] WITH PWC_ FIELDS FOR RES_PAYROLL TESTS
      - 46. UPDATE [DBO].[RES_TEST_DESCRIPTION] WITH PAY_13 OVERTIME TEST RESULTS
      
      ************************************************************************************************************
      01. DROP TABLE STATEMENT
      ***********************************************************************************************************/
      
      IF OBJECT_ID('RES_TEST_DESCRIPTION') IS NOT NULL
      DROP TABLE RES_TEST_DESCRIPTION
      
      /***********************************************************************************************************
      02. CREATE TABLE
      ***********************************************************************************************************/
      
      CREATE TABLE [DBO].[RES_TEST_DESCRIPTION]
      (
      TEST_ID NVARCHAR(1000)
      ,TEST_TYPE NVARCHAR(1000)
      ,TEST_DESCRIPTION NVARCHAR(1000)
      ,TEST_DETAILED_DESCRIPTION NVARCHAR(1000)
      ,TEST_ASSERTION_ACCURACY NVARCHAR(1) 
      ,TEST_ASSERTION_COMPLETENESS NVARCHAR(1) 
      ,TEST_ASSERTION_VALUATION NVARCHAR(1)
      ,TEST_ASSERTION_PRESENTATION_DISCLOSURE NVARCHAR(1)
      ,TEST_ASSERTION_EXISTENCE_OCCURENCE NVARCHAR(1)
      ,TEST_ASSERTION_RIGHTS_OBLIGATIONS NVARCHAR(1)
      ,TEST_ASSERTION_CUT_OFF NVARCHAR(1)
      ,TEST_USERDEFINED NVARCHAR(1000) DEFAULT 0
      ,Target_Sample NVARCHAR(1000) DEFAULT 0
      ,Random_Sample NVARCHAR(1000) DEFAULT 0
      ,PWC_TOTAL_GROSS_VALUE DECIMAL(18,4) DEFAULT 0
      ,PWC_NUMBER_OF_PAYSLIPS INT DEFAULT 0
      ,PWC_NUMBER_OF_EMPLOYEES INT DEFAULT 0
      )
      
      /***********************************************************************************************************
      03. INSERT TEST PAY_01 - EMPLOYEE - EMPLOYEE TO EMPLOYEE MATCH
      ***********************************************************************************************************/
      
      INSERT INTO [DBO].[RES_TEST_DESCRIPTION] (TEST_ID,TEST_TYPE,TEST_DESCRIPTION,TEST_ASSERTION_ACCURACY
      ,TEST_ASSERTION_COMPLETENESS,TEST_ASSERTION_VALUATION,TEST_ASSERTION_PRESENTATION_DISCLOSURE
      ,TEST_ASSERTION_EXISTENCE_OCCURENCE,TEST_ASSERTION_RIGHTS_OBLIGATIONS,TEST_ASSERTION_CUT_OFF
      ,TEST_USERDEFINED,TEST_DETAILED_DESCRIPTION) VALUES ('USR_PAY_01','Employee','Employee to employee match'
      ,'X','','','','X','','',''
      ,'Identifies employees sharing one or more of the following attributes with another employee: Employee Name, Employee Address, Employee Contact Details, and Employee Bank Account Details')
      
      /***********************************************************************************************************
      04. INSERT TEST PAY_02 - EMPLOYEE - EMPLOYEE TO VENDOR MATCH
      ***********************************************************************************************************/
      
      INSERT INTO [DBO].[RES_TEST_DESCRIPTION] (TEST_ID,TEST_TYPE,TEST_DESCRIPTION,TEST_ASSERTION_ACCURACY
      ,TEST_ASSERTION_COMPLETENESS,TEST_ASSERTION_VALUATION,TEST_ASSERTION_PRESENTATION_DISCLOSURE
      ,TEST_ASSERTION_EXISTENCE_OCCURENCE,TEST_ASSERTION_RIGHTS_OBLIGATIONS,TEST_ASSERTION_CUT_OFF
      ,TEST_USERDEFINED,TEST_DETAILED_DESCRIPTION) VALUES ('USR_PAY_02','Employee','Employee to vendor match'
      ,'','','','','','','',''
      ,'Identifies employees sharing one or more of the following attributes with a vendor: Name, Address, Contact Details, and Bank Account Details')
      
      /***********************************************************************************************************
      05. INSERT TEST PAY_03 - EMPLOYEE - EMPLOYEE WITH MISSING MASTER DATA
      ***********************************************************************************************************/
      
      INSERT INTO [DBO].[RES_TEST_DESCRIPTION] (TEST_ID,TEST_TYPE,TEST_DESCRIPTION,TEST_ASSERTION_ACCURACY
      ,TEST_ASSERTION_COMPLETENESS,TEST_ASSERTION_VALUATION,TEST_ASSERTION_PRESENTATION_DISCLOSURE
      ,TEST_ASSERTION_EXISTENCE_OCCURENCE,TEST_ASSERTION_RIGHTS_OBLIGATIONS,TEST_ASSERTION_CUT_OFF
      ,TEST_USERDEFINED,TEST_DETAILED_DESCRIPTION) VALUES ('USR_PAY_03','Employee','Employee with missing master data'
      ,'','','','','','','',''
      ,'Identifies employee from the employee master database with one or more missing attribute in the following areas: Employee Name, Employee Address, Employee Contract Details, and Employee Bank Details')
      
      /***********************************************************************************************************
      06. INSERT TEST PAY_05 - EMPLOYEE - EMPLOYEE WITH TERMINATION DATE BEFORE START DATE
      ***********************************************************************************************************/
      
      INSERT INTO [DBO].[RES_TEST_DESCRIPTION] (TEST_ID,TEST_TYPE,TEST_DESCRIPTION,TEST_ASSERTION_ACCURACY
      ,TEST_ASSERTION_COMPLETENESS,TEST_ASSERTION_VALUATION,TEST_ASSERTION_PRESENTATION_DISCLOSURE
      ,TEST_ASSERTION_EXISTENCE_OCCURENCE,TEST_ASSERTION_RIGHTS_OBLIGATIONS,TEST_ASSERTION_CUT_OFF
      ,TEST_USERDEFINED,TEST_DETAILED_DESCRIPTION) VALUES ('USR_PAY_05','Employee','Employees with termination date before start date'
      ,'X','','','','','','',''
      ,'Identifies employees with termination date before its starting date')
      
      /***********************************************************************************************************
      07. INSERT TEST PAY_06 - EMPLOYEE - EMPLOYEE WITH NO PAYSLIP
      ***********************************************************************************************************/
      
      INSERT INTO [DBO].[RES_TEST_DESCRIPTION] (TEST_ID,TEST_TYPE,TEST_DESCRIPTION,TEST_ASSERTION_ACCURACY
      ,TEST_ASSERTION_COMPLETENESS,TEST_ASSERTION_VALUATION,TEST_ASSERTION_PRESENTATION_DISCLOSURE
      ,TEST_ASSERTION_EXISTENCE_OCCURENCE,TEST_ASSERTION_RIGHTS_OBLIGATIONS,TEST_ASSERTION_CUT_OFF
      ,TEST_USERDEFINED,TEST_DETAILED_DESCRIPTION) VALUES ('USR_PAY_06','Employee','Employee with no payslip'
      ,'','','','','','','',''
      ,'Identifies employee from the employee master database that has not been terminated that does not have any payslip during the analysis period')
      
      /***********************************************************************************************************
      08. INSERT TEST PAY_07 - EMPLOYEE - EMPLOYEE AGE ANALYSIS
      ***********************************************************************************************************/
      
      INSERT INTO [DBO].[RES_TEST_DESCRIPTION] (TEST_ID,TEST_TYPE,TEST_DESCRIPTION,TEST_ASSERTION_ACCURACY
      ,TEST_ASSERTION_COMPLETENESS,TEST_ASSERTION_VALUATION,TEST_ASSERTION_PRESENTATION_DISCLOSURE
      ,TEST_ASSERTION_EXISTENCE_OCCURENCE,TEST_ASSERTION_RIGHTS_OBLIGATIONS,TEST_ASSERTION_CUT_OFF
      ,TEST_USERDEFINED,TEST_DETAILED_DESCRIPTION) VALUES ('USR_PAY_07','Employee','Employee age analysis'
      ,'','','','','','','',''
      ,'Perform employee age analysis using employee date of birth information in the employee master database and the analysis cut off date as the date of analysis')
      
      /***********************************************************************************************************
      09. INSERT TEST PAY_08 - EMPLOYEE - EMPLOYEE NAME VALIDITY
      ***********************************************************************************************************/
      
      INSERT INTO [DBO].[RES_TEST_DESCRIPTION] (TEST_ID,TEST_TYPE,TEST_DESCRIPTION,TEST_ASSERTION_ACCURACY
      ,TEST_ASSERTION_COMPLETENESS,TEST_ASSERTION_VALUATION,TEST_ASSERTION_PRESENTATION_DISCLOSURE
      ,TEST_ASSERTION_EXISTENCE_OCCURENCE,TEST_ASSERTION_RIGHTS_OBLIGATIONS,TEST_ASSERTION_CUT_OFF
      ,TEST_USERDEFINED,TEST_DETAILED_DESCRIPTION) VALUES ('USR_PAY_08','Employee','Employee name validity'
      ,'','','','','','','',''
      ,'Identifies employee names containing restricted keywords that likely indicate dummy / test employee accounts')
      
      /***********************************************************************************************************
      10. INSERT TEST PAY_09 - EMPLOYEE - EMPLOYEE BANK ACCOUNT VALIDITY
      ***********************************************************************************************************/
      
      INSERT INTO [DBO].[RES_TEST_DESCRIPTION] (TEST_ID,TEST_TYPE,TEST_DESCRIPTION,TEST_ASSERTION_ACCURACY
      ,TEST_ASSERTION_COMPLETENESS,TEST_ASSERTION_VALUATION,TEST_ASSERTION_PRESENTATION_DISCLOSURE
      ,TEST_ASSERTION_EXISTENCE_OCCURENCE,TEST_ASSERTION_RIGHTS_OBLIGATIONS,TEST_ASSERTION_CUT_OFF
      ,TEST_USERDEFINED,TEST_DETAILED_DESCRIPTION) VALUES ('USR_PAY_09','Employee','Employee bank account validity'
      ,'','','','','','','',''
      ,'Identifies employees with invalid BSB numbers compared with the BSB number registery')
      
      /***********************************************************************************************************
      11. INSERT TEST PAY_10 - EMPLOYEE - TENURE ANALYSIS
      ***********************************************************************************************************/
      
      INSERT INTO [DBO].[RES_TEST_DESCRIPTION] (TEST_ID,TEST_TYPE,TEST_DESCRIPTION,TEST_ASSERTION_ACCURACY
      ,TEST_ASSERTION_COMPLETENESS,TEST_ASSERTION_VALUATION,TEST_ASSERTION_PRESENTATION_DISCLOSURE
      ,TEST_ASSERTION_EXISTENCE_OCCURENCE,TEST_ASSERTION_RIGHTS_OBLIGATIONS,TEST_ASSERTION_CUT_OFF
      ,TEST_USERDEFINED,TEST_DETAILED_DESCRIPTION) VALUES ('USR_PAY_10','Employee','Tenure analysis'
      ,'','','','','','','',''
      ,'Perform employee tenure analysis based on employee start date and the analysis cut off period as the date of analysis')
      
      /***********************************************************************************************************
      12. INSERT TEST PAY_11 - EMPLOYEE - PAYROLL POSITION OVERLAP
      ***********************************************************************************************************/
      
      INSERT INTO [DBO].[RES_TEST_DESCRIPTION] (TEST_ID,TEST_TYPE,TEST_DESCRIPTION,TEST_ASSERTION_ACCURACY
      ,TEST_ASSERTION_COMPLETENESS,TEST_ASSERTION_VALUATION,TEST_ASSERTION_PRESENTATION_DISCLOSURE
      ,TEST_ASSERTION_EXISTENCE_OCCURENCE,TEST_ASSERTION_RIGHTS_OBLIGATIONS,TEST_ASSERTION_CUT_OFF
      ,TEST_USERDEFINED,TEST_DETAILED_DESCRIPTION) VALUES ('USR_PAY_11','Employee','Payroll position overlap'
      ,'','','','','','','',''
      ,'Identifies employee holding more than one position during the analysis period')
      
      /***********************************************************************************************************
      13. INSERT TEST PAY_12 - PAYSLIP - PAYSLIP AFTER TERMINATION
      ***********************************************************************************************************/
      
      INSERT INTO [DBO].[RES_TEST_DESCRIPTION] (TEST_ID,TEST_TYPE,TEST_DESCRIPTION,TEST_ASSERTION_ACCURACY
      ,TEST_ASSERTION_COMPLETENESS,TEST_ASSERTION_VALUATION,TEST_ASSERTION_PRESENTATION_DISCLOSURE
      ,TEST_ASSERTION_EXISTENCE_OCCURENCE,TEST_ASSERTION_RIGHTS_OBLIGATIONS,TEST_ASSERTION_CUT_OFF
      ,TEST_USERDEFINED,TEST_DETAILED_DESCRIPTION) VALUES ('USR_PAY_12','Payslip','Payslips after termination'
      ,'X','','','','X','','',''
      ,'Identifies employee with payslip after their termination date during the analysis period')
      
      /***********************************************************************************************************
      14. INSERT TEST PAY_13 - PAYSLIP - OVERTIME ANALYSIS
      ***********************************************************************************************************/
      
      INSERT INTO [DBO].[RES_TEST_DESCRIPTION] (TEST_ID,TEST_TYPE,TEST_DESCRIPTION,TEST_ASSERTION_ACCURACY
      ,TEST_ASSERTION_COMPLETENESS,TEST_ASSERTION_VALUATION,TEST_ASSERTION_PRESENTATION_DISCLOSURE
      ,TEST_ASSERTION_EXISTENCE_OCCURENCE,TEST_ASSERTION_RIGHTS_OBLIGATIONS,TEST_ASSERTION_CUT_OFF
      ,TEST_USERDEFINED,TEST_DETAILED_DESCRIPTION) VALUES ('USR_PAY_13','Payslip','Overtime analysis'
      ,'X','','','','','','',''
      ,'Perform employee overtime movement analysis at the employee level between each payrun during the analysis period')
      
      /***********************************************************************************************************
      15. INSERT TEST PAY_14 - PAYSLIP - EMPLOYEE WITH ONE PAYSLIP
      ***********************************************************************************************************/
      
      INSERT INTO [DBO].[RES_TEST_DESCRIPTION] (TEST_ID,TEST_TYPE,TEST_DESCRIPTION,TEST_ASSERTION_ACCURACY
      ,TEST_ASSERTION_COMPLETENESS,TEST_ASSERTION_VALUATION,TEST_ASSERTION_PRESENTATION_DISCLOSURE
      ,TEST_ASSERTION_EXISTENCE_OCCURENCE,TEST_ASSERTION_RIGHTS_OBLIGATIONS,TEST_ASSERTION_CUT_OFF
      ,TEST_USERDEFINED,TEST_DETAILED_DESCRIPTION) VALUES ('USR_PAY_14','Payslip','Employee with one payslip'
      ,'X','','','','X','','',''
      ,'Identifies employee from the employee master database that has exactly one payslip during the analysis period')
      
      /***********************************************************************************************************
      16. INSERT TEST PAY_15 - PAYSLIP - ROUND DOLLAR PAYSLIP
      ***********************************************************************************************************/
      
      INSERT INTO [DBO].[RES_TEST_DESCRIPTION] (TEST_ID,TEST_TYPE,TEST_DESCRIPTION,TEST_ASSERTION_ACCURACY
      ,TEST_ASSERTION_COMPLETENESS,TEST_ASSERTION_VALUATION,TEST_ASSERTION_PRESENTATION_DISCLOSURE
      ,TEST_ASSERTION_EXISTENCE_OCCURENCE,TEST_ASSERTION_RIGHTS_OBLIGATIONS,TEST_ASSERTION_CUT_OFF
      ,TEST_USERDEFINED,TEST_DETAILED_DESCRIPTION) VALUES ('USR_PAY_15','Payslip','Round dollar payslip'
      ,'X','','','','X','','',''
      ,'Identifies employee payslips in which the base pay and/or overtime pay ends in 000.00 during the analysis period')
      
      /***********************************************************************************************************
      17. INSERT TEST PAY_16 - PAYSLIP - EMPLOYEE NOT IN MASTER
      ***********************************************************************************************************/
      
      INSERT INTO [DBO].[RES_TEST_DESCRIPTION] (TEST_ID,TEST_TYPE,TEST_DESCRIPTION,TEST_ASSERTION_ACCURACY
      ,TEST_ASSERTION_COMPLETENESS,TEST_ASSERTION_VALUATION,TEST_ASSERTION_PRESENTATION_DISCLOSURE
      ,TEST_ASSERTION_EXISTENCE_OCCURENCE,TEST_ASSERTION_RIGHTS_OBLIGATIONS,TEST_ASSERTION_CUT_OFF
      ,TEST_USERDEFINED,TEST_DETAILED_DESCRIPTION) VALUES ('USR_PAY_16','Payslip','Employee not in master'
      ,'X','','','','X','','',''
      ,'Perform employee payrate movement analysis between each payrun during the analysis period')
      
      /***********************************************************************************************************
      18. INSERT TEST PAY_17 - PAYSLIP - MULTIPLE PAYSLIPS
      ***********************************************************************************************************/
      
      INSERT INTO [DBO].[RES_TEST_DESCRIPTION] (TEST_ID,TEST_TYPE,TEST_DESCRIPTION,TEST_ASSERTION_ACCURACY
      ,TEST_ASSERTION_COMPLETENESS,TEST_ASSERTION_VALUATION,TEST_ASSERTION_PRESENTATION_DISCLOSURE
      ,TEST_ASSERTION_EXISTENCE_OCCURENCE,TEST_ASSERTION_RIGHTS_OBLIGATIONS,TEST_ASSERTION_CUT_OFF
      ,TEST_USERDEFINED,TEST_DETAILED_DESCRIPTION) VALUES ('USR_PAY_17','Payslip','Mutiple payslips'
      ,'X','','','','X','','',''
      ,'Identifies payslips to employees with the same payslip reason in the same payrun during the analysis period')
      
      /***********************************************************************************************************
      19. INSERT TEST PAY_18 - PAYSLIP - PAY RATE CHANGES
      ***********************************************************************************************************/
      
      INSERT INTO [DBO].[RES_TEST_DESCRIPTION] (TEST_ID,TEST_TYPE,TEST_DESCRIPTION,TEST_ASSERTION_ACCURACY
      ,TEST_ASSERTION_COMPLETENESS,TEST_ASSERTION_VALUATION,TEST_ASSERTION_PRESENTATION_DISCLOSURE
      ,TEST_ASSERTION_EXISTENCE_OCCURENCE,TEST_ASSERTION_RIGHTS_OBLIGATIONS,TEST_ASSERTION_CUT_OFF
      ,TEST_USERDEFINED,TEST_DETAILED_DESCRIPTION) VALUES ('USR_PAY_18','Payslip','Payrate changes'
      ,'','','','','','','',''
      ,'Perform employee payrate movement analysis between each payrun during the analysis period')
      
      /***********************************************************************************************************
      20. INSERT TEST PAY_19 - PAYSLIP - SPREAD OF EACH PAYMENT TYPE
      ***********************************************************************************************************/
      
      INSERT INTO [DBO].[RES_TEST_DESCRIPTION] (TEST_ID,TEST_TYPE,TEST_DESCRIPTION,TEST_ASSERTION_ACCURACY
      ,TEST_ASSERTION_COMPLETENESS,TEST_ASSERTION_VALUATION,TEST_ASSERTION_PRESENTATION_DISCLOSURE
      ,TEST_ASSERTION_EXISTENCE_OCCURENCE,TEST_ASSERTION_RIGHTS_OBLIGATIONS,TEST_ASSERTION_CUT_OFF
      ,TEST_USERDEFINED,TEST_DETAILED_DESCRIPTION) VALUES ('USR_PAY_19','Payslip','Spread of each payment type'
      ,'','','','','','','',''
      ,'Perform payslip payment type movement analysis of total paycode amounts in each payrun during the analysis period')
      
      /***********************************************************************************************************
      21. INSERT TEST PAY_20 - PAYSLIP - PAYSLIP PROCESSED ON WEEKEND OR OUTSIDE HOURS
      ***********************************************************************************************************/
      
      INSERT INTO [DBO].[RES_TEST_DESCRIPTION] (TEST_ID,TEST_TYPE,TEST_DESCRIPTION,TEST_ASSERTION_ACCURACY
      ,TEST_ASSERTION_COMPLETENESS,TEST_ASSERTION_VALUATION,TEST_ASSERTION_PRESENTATION_DISCLOSURE
      ,TEST_ASSERTION_EXISTENCE_OCCURENCE,TEST_ASSERTION_RIGHTS_OBLIGATIONS,TEST_ASSERTION_CUT_OFF
      ,TEST_USERDEFINED,TEST_DETAILED_DESCRIPTION) VALUES ('USR_PAY_20','Payslip','Payslip processed on weekend or outside hours'
      ,'','','','','','','',''
      ,'Identifies payslips with processing date on a weekend and/or if processing time is given, identifies payslip processed outside of business hours')
      
      /***********************************************************************************************************
      22. INSERT TEST PAY_21 - PAYSLIP - EFT PAYMENTS MADE ON WEEKEND OR OUTSIDE HOURS
      ***********************************************************************************************************/
      
      INSERT INTO [DBO].[RES_TEST_DESCRIPTION] (TEST_ID,TEST_TYPE,TEST_DESCRIPTION,TEST_ASSERTION_ACCURACY
      ,TEST_ASSERTION_COMPLETENESS,TEST_ASSERTION_VALUATION,TEST_ASSERTION_PRESENTATION_DISCLOSURE
      ,TEST_ASSERTION_EXISTENCE_OCCURENCE,TEST_ASSERTION_RIGHTS_OBLIGATIONS,TEST_ASSERTION_CUT_OFF
      ,TEST_USERDEFINED,TEST_DETAILED_DESCRIPTION) VALUES ('USR_PAY_21','Payslip','EFT payments made on weekend or outside hours'
      ,'','','','','','','',''
      ,'Identifies EFT payments with processing date on a weekend and/or if processing time is given, identifies EFT payment processed outside of business hours')
      
      /***********************************************************************************************************
      23. INSERT TEST PAY_22 - PAYSLIP - DUPLICATE PAYSLIP
      ***********************************************************************************************************/
      
      INSERT INTO [DBO].[RES_TEST_DESCRIPTION] (TEST_ID,TEST_TYPE,TEST_DESCRIPTION,TEST_ASSERTION_ACCURACY
      ,TEST_ASSERTION_COMPLETENESS,TEST_ASSERTION_VALUATION,TEST_ASSERTION_PRESENTATION_DISCLOSURE
      ,TEST_ASSERTION_EXISTENCE_OCCURENCE,TEST_ASSERTION_RIGHTS_OBLIGATIONS,TEST_ASSERTION_CUT_OFF
      ,TEST_USERDEFINED,TEST_DETAILED_DESCRIPTION) VALUES ('USR_PAY_22','Payslip','Duplicate payslip'
      ,'X','','','','X','','',''
      ,'Identifies payslips with multiple of the same lines repeating for the same employee within the same payrun during the analysis period')
      
      /***********************************************************************************************************
      24. INSERT TEST PAY_23 - PAYSLIP - UNUSUAL SPIKE IN BASE PAY
      ***********************************************************************************************************/
      
      INSERT INTO [DBO].[RES_TEST_DESCRIPTION] (TEST_ID,TEST_TYPE,TEST_DESCRIPTION,TEST_ASSERTION_ACCURACY
      ,TEST_ASSERTION_COMPLETENESS,TEST_ASSERTION_VALUATION,TEST_ASSERTION_PRESENTATION_DISCLOSURE
      ,TEST_ASSERTION_EXISTENCE_OCCURENCE,TEST_ASSERTION_RIGHTS_OBLIGATIONS,TEST_ASSERTION_CUT_OFF
      ,TEST_USERDEFINED,TEST_DETAILED_DESCRIPTION) VALUES ('USR_PAY_23','Payslip','Unusual spike in base pay'
      ,'X','','','','X','','',''
      ,'Perform base pay movement analysis at the employee level between each payrun during the analysis period')
      
      /***********************************************************************************************************
      25. INSERT TEST PAY_24 - PAYSLIP - UNUSUAL SPIKE IN ADDITIONS BEFORE TAX
      ***********************************************************************************************************/
      
      INSERT INTO [DBO].[RES_TEST_DESCRIPTION] (TEST_ID,TEST_TYPE,TEST_DESCRIPTION,TEST_ASSERTION_ACCURACY
      ,TEST_ASSERTION_COMPLETENESS,TEST_ASSERTION_VALUATION,TEST_ASSERTION_PRESENTATION_DISCLOSURE
      ,TEST_ASSERTION_EXISTENCE_OCCURENCE,TEST_ASSERTION_RIGHTS_OBLIGATIONS,TEST_ASSERTION_CUT_OFF
      ,TEST_USERDEFINED,TEST_DETAILED_DESCRIPTION) VALUES ('USR_PAY_24','Payslip','Unusual spike in additions before tax'
      ,'','','','','','','',''
      ,'Perform additions before tax movement analysis at the employee level between each payrun during the analysis period')
      
      /***********************************************************************************************************
      26. INSERT TEST PAY_25 - AUDIT - EMPLOYEE MOVEMENT
      ***********************************************************************************************************/
      
      INSERT INTO [DBO].[RES_TEST_DESCRIPTION] (TEST_ID,TEST_TYPE,TEST_DESCRIPTION,TEST_ASSERTION_ACCURACY
      ,TEST_ASSERTION_COMPLETENESS,TEST_ASSERTION_VALUATION,TEST_ASSERTION_PRESENTATION_DISCLOSURE
      ,TEST_ASSERTION_EXISTENCE_OCCURENCE,TEST_ASSERTION_RIGHTS_OBLIGATIONS,TEST_ASSERTION_CUT_OFF
      ,TEST_USERDEFINED,TEST_DETAILED_DESCRIPTION) VALUES ('USR_PAY_25','Audit','Employee Movement'
      ,'','X','','','X','','',''
      ,'Perform employee headcount movement analysis during the analysis period using employee master database')
      
      
      /***********************************************************************************************************
      27. INSERT TEST PAY_26 - EMPLOYEE - EMPLOYEE GENDER PROFILE
      ***********************************************************************************************************/
      
      INSERT INTO [DBO].[RES_TEST_DESCRIPTION] (TEST_ID,TEST_TYPE,TEST_DESCRIPTION,TEST_ASSERTION_ACCURACY
      ,TEST_ASSERTION_COMPLETENESS,TEST_ASSERTION_VALUATION,TEST_ASSERTION_PRESENTATION_DISCLOSURE
      ,TEST_ASSERTION_EXISTENCE_OCCURENCE,TEST_ASSERTION_RIGHTS_OBLIGATIONS,TEST_ASSERTION_CUT_OFF
      ,TEST_USERDEFINED,TEST_DETAILED_DESCRIPTION) VALUES ('USR_PAY_26','Employee','Employee Gender Profile'
      ,'','','','','','','',''
      ,'Perform employee gender breakdown analysis using the employee master database')
      
      /***********************************************************************************************************
      39. INSERT TEST USR_PAY_30 - PAYSLIP - PAYSLIPS BEFORE START DATE
      ***********************************************************************************************************/
      
      INSERT INTO [DBO].[RES_TEST_DESCRIPTION] (TEST_ID,TEST_TYPE,TEST_DESCRIPTION,TEST_ASSERTION_ACCURACY
      ,TEST_ASSERTION_COMPLETENESS,TEST_ASSERTION_VALUATION,TEST_ASSERTION_PRESENTATION_DISCLOSURE
      ,TEST_ASSERTION_EXISTENCE_OCCURENCE,TEST_ASSERTION_RIGHTS_OBLIGATIONS,TEST_ASSERTION_CUT_OFF
      ,TEST_USERDEFINED,TEST_DETAILED_DESCRIPTION) VALUES ('USR_PAY_30','Payslip','Payslips Before Start Date'
      ,'','','','','','','',''
      ,'Identifies payslips for employee for periods before the employee''s start date using the employee master database')
      
      /***********************************************************************************************************
      28. INSERT TEST PAY_TB - AUDIT - PAYSLIPS TO TB RECONCILIATION
      ***********************************************************************************************************/
      
      INSERT INTO [DBO].[RES_TEST_DESCRIPTION] (TEST_ID,TEST_TYPE,TEST_DESCRIPTION,TEST_ASSERTION_ACCURACY
      ,TEST_ASSERTION_COMPLETENESS,TEST_ASSERTION_VALUATION,TEST_ASSERTION_PRESENTATION_DISCLOSURE
      ,TEST_ASSERTION_EXISTENCE_OCCURENCE,TEST_ASSERTION_RIGHTS_OBLIGATIONS,TEST_ASSERTION_CUT_OFF
      ,TEST_USERDEFINED,TEST_DETAILED_DESCRIPTION) VALUES ('USR_PAY_TB','Audit','Payslips to TB Reconciliation'
      ,'X','X','','X','','','',''
      ,'Perform payslip to general ledger trial balance reconciliation to verify all payslip information is being captured in the payroll related accounts in the general ledger trial balance')
      
      /***********************************************************************************************************
      29. INSERT TEST PAY_EFT - AUDIT - PAYSLIPS TO EFT RECONCILIATION
      ***********************************************************************************************************/
      
      INSERT INTO [DBO].[RES_TEST_DESCRIPTION] (TEST_ID,TEST_TYPE,TEST_DESCRIPTION,TEST_ASSERTION_ACCURACY
      ,TEST_ASSERTION_COMPLETENESS,TEST_ASSERTION_VALUATION,TEST_ASSERTION_PRESENTATION_DISCLOSURE
      ,TEST_ASSERTION_EXISTENCE_OCCURENCE,TEST_ASSERTION_RIGHTS_OBLIGATIONS,TEST_ASSERTION_CUT_OFF
      ,TEST_USERDEFINED,TEST_DETAILED_DESCRIPTION) VALUES ('USR_PAY_EFT','Audit','Payslips to EFT Reconciliation'
      ,'X','X','','','X','','',''
      ,'Perform payslip to EFT payment to verify all payslip items corresponds to all payroll related EFT payments')
      
      /***********************************************************************************************************
      30. INSERT TEST USR_ALL - AUDIT - EMPLOYEE SUMMARY
      ***********************************************************************************************************/
      
      INSERT INTO [DBO].[RES_TEST_DESCRIPTION] (TEST_ID,TEST_TYPE,TEST_DESCRIPTION,TEST_ASSERTION_ACCURACY
      ,TEST_ASSERTION_COMPLETENESS,TEST_ASSERTION_VALUATION,TEST_ASSERTION_PRESENTATION_DISCLOSURE
      ,TEST_ASSERTION_EXISTENCE_OCCURENCE,TEST_ASSERTION_RIGHTS_OBLIGATIONS,TEST_ASSERTION_CUT_OFF
      ,TEST_USERDEFINED,TEST_DETAILED_DESCRIPTION) VALUES ('USR_PAY_ALL','Audit','Self discovery'
      ,'','','','','','','',''
      ,'Allows the audit team to navigate between different analytic sandbox to identify relevant audit insights')
      
      
      /***********************************************************************************************************
      31. INSERT TEST PAY_31 - LEAVE - ANN LEAVE > 20 DAYS
      ***********************************************************************************************************/
      
      INSERT INTO [DBO].[RES_TEST_DESCRIPTION] (TEST_ID,TEST_TYPE,TEST_DESCRIPTION,TEST_ASSERTION_ACCURACY
      ,TEST_ASSERTION_COMPLETENESS,TEST_ASSERTION_VALUATION,TEST_ASSERTION_PRESENTATION_DISCLOSURE
      ,TEST_ASSERTION_EXISTENCE_OCCURENCE,TEST_ASSERTION_RIGHTS_OBLIGATIONS,TEST_ASSERTION_CUT_OFF
      ,TEST_USERDEFINED,TEST_DETAILED_DESCRIPTION) VALUES ('USR_PAY_31','Leave','Annual leave more than 20 days'
      ,'','','','','','','',''
      ,'Identifies employee with annual leave more than 20 days')
      
      /***********************************************************************************************************
      32. INSERT TEST PAY_32 - LEAVE - SICK LEAVE > 10 DAYS
      ***********************************************************************************************************/
      
      INSERT INTO [DBO].[RES_TEST_DESCRIPTION] (TEST_ID,TEST_TYPE,TEST_DESCRIPTION,TEST_ASSERTION_ACCURACY
      ,TEST_ASSERTION_COMPLETENESS,TEST_ASSERTION_VALUATION,TEST_ASSERTION_PRESENTATION_DISCLOSURE
      ,TEST_ASSERTION_EXISTENCE_OCCURENCE,TEST_ASSERTION_RIGHTS_OBLIGATIONS,TEST_ASSERTION_CUT_OFF
      ,TEST_USERDEFINED,TEST_DETAILED_DESCRIPTION) VALUES ('USR_PAY_32','Leave','Sick leave more than 10 days'
      ,'','','','','','','',''
      ,'Identifies employee with sick leave more than 10 days')
      
      
      /***********************************************************************************************************
      33. INSERT TEST PAY_33 - LEAVE - SICK LEAVE > ANN LEAVE
      ***********************************************************************************************************/
      
      INSERT INTO [DBO].[RES_TEST_DESCRIPTION] (TEST_ID,TEST_TYPE,TEST_DESCRIPTION,TEST_ASSERTION_ACCURACY
      ,TEST_ASSERTION_COMPLETENESS,TEST_ASSERTION_VALUATION,TEST_ASSERTION_PRESENTATION_DISCLOSURE
      ,TEST_ASSERTION_EXISTENCE_OCCURENCE,TEST_ASSERTION_RIGHTS_OBLIGATIONS,TEST_ASSERTION_CUT_OFF
      ,TEST_USERDEFINED,TEST_DETAILED_DESCRIPTION) VALUES ('USR_PAY_33','Leave','Sick leave greater than annual leave'
      ,'','','','','','','',''
      ,'Identifies employee has sick greater than annual leave')
      
      
      /***********************************************************************************************************
      34. INSERT TEST PAY_34 - LEAVE - UNPAID LEAVE <>0
      ***********************************************************************************************************/
      
      INSERT INTO [DBO].[RES_TEST_DESCRIPTION] (TEST_ID,TEST_TYPE,TEST_DESCRIPTION,TEST_ASSERTION_ACCURACY
      ,TEST_ASSERTION_COMPLETENESS,TEST_ASSERTION_VALUATION,TEST_ASSERTION_PRESENTATION_DISCLOSURE
      ,TEST_ASSERTION_EXISTENCE_OCCURENCE,TEST_ASSERTION_RIGHTS_OBLIGATIONS,TEST_ASSERTION_CUT_OFF
      ,TEST_USERDEFINED,TEST_DETAILED_DESCRIPTION) VALUES ('USR_PAY_34','Leave','Unpaid leave with non zero dollars amount'
      ,'','','','','','','',''
      ,'Identifies employee with unpaid leave with non zero dollars amount')
      
      
      /***********************************************************************************************************
      35. INSERT TEST PAY_35 - LEAVE - SICK < 1 DAYS
      ***********************************************************************************************************/
      
      INSERT INTO [DBO].[RES_TEST_DESCRIPTION] (TEST_ID,TEST_TYPE,TEST_DESCRIPTION,TEST_ASSERTION_ACCURACY
      ,TEST_ASSERTION_COMPLETENESS,TEST_ASSERTION_VALUATION,TEST_ASSERTION_PRESENTATION_DISCLOSURE
      ,TEST_ASSERTION_EXISTENCE_OCCURENCE,TEST_ASSERTION_RIGHTS_OBLIGATIONS,TEST_ASSERTION_CUT_OFF
      ,TEST_USERDEFINED,TEST_DETAILED_DESCRIPTION) VALUES ('USR_PAY_35','Leave','Sick leave less than 1 working day'
      ,'','','','','','','',''
      ,'Identifies employee with sick leave less than 1 working day')
      
      
      /***********************************************************************************************************
      36. INSERT TEST PAY_36 - LEAVE - SICK LEAVE =1 DAY
      ***********************************************************************************************************/
      
      INSERT INTO [DBO].[RES_TEST_DESCRIPTION] (TEST_ID,TEST_TYPE,TEST_DESCRIPTION,TEST_ASSERTION_ACCURACY
      ,TEST_ASSERTION_COMPLETENESS,TEST_ASSERTION_VALUATION,TEST_ASSERTION_PRESENTATION_DISCLOSURE
      ,TEST_ASSERTION_EXISTENCE_OCCURENCE,TEST_ASSERTION_RIGHTS_OBLIGATIONS,TEST_ASSERTION_CUT_OFF
      ,TEST_USERDEFINED,TEST_DETAILED_DESCRIPTION) VALUES ('USR_PAY_36','Leave','1 day sick leave'
      ,'','','','','','','',''
      ,'Identifies employee with 1 day sick leave')
      
      
      
      /***********************************************************************************************************
      37. CREATE DYNAMIC STRING TO COLLECT ALL THE TEST FIELDS FOR RES_EMPLOYEE TESTS
      - PWC_EMPLOYEE_COUNT
      - PWC_PAYSLIP_COUNT
      - PWC_GROSS_AMOUNT
      ***********************************************************************************************************/
      
      PRINT 'START 30. CREATE DYNAMIC STRING TO COLLECT ALL THE TEST FIELDS FOR RES_EMPLOYEE TESTS'
      
      DECLARE @COLS_EMPLOYEE NVARCHAR(MAX)
      SELECT @COLS_EMPLOYEE = COALESCE(@COLS_EMPLOYEE+',','') + QUOTENAME(COLUMNS.NAME) 
      FROM SYSCOLUMNS COLUMNS
      INNER JOIN 
      SYSOBJECTS OBJECTS 
      ON COLUMNS.ID = OBJECTS.ID AND OBJECTS.xtype = 'u'
      WHERE OBJECTS.NAME = 'RES_EMPLOYEE' AND LEN(COLUMNS.NAME) < 10 AND NOT(COLUMNS.NAME = 'PAY_ALL')
      ORDER BY COLUMNS.colid
      
      DECLARE @QUERY_EMPLOYEE NVARCHAR(MAX)
      
      SELECT @QUERY_EMPLOYEE = ';WITH CTE_EMPLOYEE_RESULTS_TABLE
      AS
      (
      SELECT [OUTPUT].TEST_ID AS TEST_ID
      ,SUM([OUTPUT].EMPLOYEE_COUNT) AS PWC_EMPLOYEE_COUNT
      ,COUNT([OUTPUT].PWC_NUMBER_OF_PAYSLIP) AS PWC_PAYSLIP_COUNT
      ,SUM([OUTPUT].PWC_GROSS_AMOUNT) AS PWC_GROSS_AMOUNT
      FROM (
      SELECT ''USR_'' + DETAILS AS TEST_ID
      ,COUNT(DISTINCT EMPLOYEE_ID) AS EMPLOYEE_COUNT
      ,PWC_NUMBER_OF_PAYSLIP
      ,PWC_GROSS_AMOUNT
      FROM (
      
      /***********************************************************************************************************
      38. SELECT ALL EMPLOYEE TEST RESULTS WITH PAYSLIP COUNT FOR RES_EMPLOYEE TESTS
      ***********************************************************************************************************/
      
      SELECT RESULTS.*
      ,[HEADER].PWC_NUMBER_OF_PAYSLIP
      ,[HEADER].PWC_GROSS_AMOUNT
      FROM [dbo].[RES_EMPLOYEE] AS RESULTS
      LEFT JOIN
      (
      SELECT EMPLOYEE_ID
      ,SYSTEM_NAME
      ,COUNT(DISTINCT PAYSLIP_ID) AS PWC_NUMBER_OF_PAYSLIP
      ,SUM(PWC_GROSS_AMOUNT) AS PWC_GROSS_AMOUNT
      FROM [PREP_PAYSLIPS_HEADER]
      GROUP BY EMPLOYEE_ID
      ,SYSTEM_NAME
      )  AS [HEADER]
      ON [HEADER].EMPLOYEE_ID = RESULTS.EMPLOYEE_ID
      AND ISNULL([HEADER].SYSTEM_NAME,'''') = ISNULL(RESULTS.SYSTEM_NAME,'''')
      WHERE NOT (EMPLOYEE_SYSTEM_ID = ''PWC_TEST_EXECUTED_'')
      ) AS EMPLOYEE_DATA
      
      /***********************************************************************************************************
      39. UNPIVOT FOR PAY_XX TESTS FOR RES_EMPLOYEE TESTS
      ***********************************************************************************************************/
      
      UNPIVOT
      (
      EMPLOYEE_COUNT FOR DETAILS IN (' + @COLS_EMPLOYEE + ')
      ) AS UNPIV
      WHERE UNPIV.EMPLOYEE_COUNT <> 0 
      AND NOT ISNULL(UNPIV.EMPLOYEE_COUNT, '''') = ''''
      GROUP BY ''USR_'' + DETAILS
      ,PWC_NUMBER_OF_PAYSLIP
      ,PWC_GROSS_AMOUNT
      ) AS [OUTPUT]
      GROUP BY [OUTPUT].TEST_ID
      )
      
      /***********************************************************************************************************
      40. UPDATE [DBO].[RES_TEST_DESCRIPTION] WITH PWC_ FIELDS FOR RES_EMPLOYEE TESTS
      ***********************************************************************************************************/	
      
      UPDATE [DBO].[RES_TEST_DESCRIPTION]
      SET PWC_NUMBER_OF_EMPLOYEES = TEST_RESULTS.PWC_EMPLOYEE_COUNT
      ,PWC_NUMBER_OF_PAYSLIPS = TEST_RESULTS.PWC_PAYSLIP_COUNT
      ,PWC_TOTAL_GROSS_VALUE = CASE WHEN TEST_RESULTS.PWC_PAYSLIP_COUNT = 0
      THEN 0.0000
      ELSE TEST_RESULTS.PWC_GROSS_AMOUNT
      END
      FROM CTE_EMPLOYEE_RESULTS_TABLE AS TEST_RESULTS 
      LEFT JOIN
      [DBO].[RES_TEST_DESCRIPTION] AS TEST_DESCRIPTION 
      ON ISNULL(TEST_RESULTS.TEST_ID,'''') = ISNULL(TEST_DESCRIPTION.TEST_ID,'''')'
      
      EXEC SP_EXECUTESQL @QUERY_EMPLOYEE
      
      PRINT 'FINISH 30. CREATE DYNAMIC STRING TO COLLECT ALL THE TEST FIELDS FOR RES_EMPLOYEE TESTS'
      
      /***********************************************************************************************************
      41. CREATE DYNAMIC STRING TO COLLECT ALL THE TEST FIELDS FOR RES_PAYSLIP TESTS
      - PWC_EMPLOYEE_COUNT
      - PWC_PAYSLIP_COUNT
      - PWC_GROSS_AMOUNT
      ***********************************************************************************************************/	
      
      PRINT 'START 34. CREATE DYNAMIC STRING TO COLLECT ALL THE TEST FIELDS FOR RES_PAYSLIP TESTS'
      
      DECLARE @COLS_PAYSLIP NVARCHAR(MAX)
      SELECT @COLS_PAYSLIP = COALESCE(@COLS_PAYSLIP+',','') + QUOTENAME(COLUMNS.NAME) 
      FROM SYSCOLUMNS COLUMNS
      INNER JOIN 
      SYSOBJECTS OBJECTS 
      ON COLUMNS.ID = OBJECTS.ID AND OBJECTS.xtype = 'u'
      WHERE OBJECTS.NAME = 'RES_PAYSLIP' AND LEN(COLUMNS.NAME) < 10 AND NOT(COLUMNS.NAME = 'PAY_TB') AND NOT(COLUMNS.NAME = 'PAY_EFT')
      ORDER BY COLUMNS.colid
      
      DECLARE @QUERY_PAYSLIP NVARCHAR(MAX)
      
      SELECT @QUERY_PAYSLIP = ';WITH CTE_PAYROLL_RESULTS_TABLE
      AS
      (
      SELECT ''USR_'' + [OUTPUT].TEST_DETAILS AS TEST_ID
      ,COUNT(DISTINCT [OUTPUT].EMPLOYEE_ID) AS PWC_EMPLOYEE_COUNT
      ,SUM([OUTPUT].PWC_GROSS_AMOUNT) AS PWC_GROSS_AMOUNT
      ,COUNT([OUTPUT].PWC_PAYSLIP_ID) AS PWC_PAYSLIP_COUNT
      FROM 
      (
      SELECT TEST_DETAILS
      ,UNPIV.PWC_GROSS_AMOUNT
      ,UNPIV.EMPLOYEE_ID
      ,UNPIV.PWC_PAYSLIP_ID
      FROM (
      
      /***********************************************************************************************************
      42. FOR EACH PAYSLIP FIND THE EMPLOYEE ID AND THE PAYSLIP AMOUNT
      ***********************************************************************************************************/
      
      SELECT RESULTS.*
      ,PAY_HEADER.PWC_GROSS_AMOUNT AS PWC_GROSS_AMOUNT
      ,LEFT(RESULTS.PAYSLIP_ID,8) AS EMPLOYEE_ID
      ,PAY_HEADER.PAYSLIP_ID AS PWC_PAYSLIP_ID
      FROM [dbo].[RES_PAYSLIP] AS RESULTS
      LEFT JOIN
      [dbo].[PREP_PAYSLIPS_HEADER] AS PAY_HEADER
      ON RESULTS.PAYSLIP_ID = PAY_HEADER.PAYSLIP_ID
      WHERE NOT (RESULTS.PAYSLIP_ID = ''PWC_TEST_EXECUTED_'')
      AND ISNULL(RESULTS.SYSTEM_NAME, '''') = ISNULL(PAY_HEADER.SYSTEM_NAME, '''')
      ) AS DATA
      
      /***********************************************************************************************************
      43. UNPIVOT FOR PAY_XX TESTS FOR RES_PAYSLIP TESTS 
      ***********************************************************************************************************/
      
      UNPIVOT
      (
      AMOUNT FOR TEST_DETAILS IN (' + @COLS_PAYSLIP + ')
      ) AS UNPIV
      WHERE UNPIV.AMOUNT <> 0 
      AND NOT ISNULL(UNPIV.AMOUNT, '''') = ''''
      ) AS [OUTPUT]
      GROUP BY [OUTPUT].TEST_DETAILS
      )
      
      /***********************************************************************************************************
      44. UPDATE [DBO].[RES_TEST_DESCRIPTION] WITH PWC_ FIELDS FOR RES_PAYROLL TESTS
      ***********************************************************************************************************/	
      
      UPDATE [DBO].[RES_TEST_DESCRIPTION]
      SET PWC_NUMBER_OF_EMPLOYEES = TEST_RESULTS.PWC_EMPLOYEE_COUNT
      ,PWC_NUMBER_OF_PAYSLIPS = TEST_RESULTS.PWC_PAYSLIP_COUNT
      ,PWC_TOTAL_GROSS_VALUE = CASE WHEN TEST_RESULTS.PWC_PAYSLIP_COUNT = 0 
      THEN 0.0000
      ELSE TEST_RESULTS.PWC_GROSS_AMOUNT
      END
      FROM CTE_PAYROLL_RESULTS_TABLE AS TEST_RESULTS
      LEFT JOIN
      [DBO].[RES_TEST_DESCRIPTION] AS TEST_DESCRIPTION 	
      ON ISNULL(TEST_RESULTS.TEST_ID,'''') = ISNULL(TEST_DESCRIPTION.TEST_ID,'''')'
      
      EXEC SP_EXECUTESQL @QUERY_PAYSLIP
      
      PRINT 'FINISH 34. CREATE DYNAMIC STRING TO COLLECT ALL THE TEST FIELDS FOR RES_PAYSLIP TESTS'
      
      
      /***********************************************************************************************************
      45. UPDATE [DBO].[RES_TEST_DESCRIPTION] WITH PAY_13 OVERTIME TEST RESULTS
      ***********************************************************************************************************/	
      
      UPDATE [DBO].[RES_TEST_DESCRIPTION]
      SET PWC_NUMBER_OF_EMPLOYEES = HEADER.PWC_EMPLOYEE_COUNT 
      ,PWC_NUMBER_OF_PAYSLIPS = HEADER.PWC_PAYSLIP_COUNT
      ,PWC_TOTAL_GROSS_VALUE = HEADER.PWC_GROSS_AMOUNT
      FROM 
      (
      SELECT COUNT(DISTINCT EMPLOYEE_ID) AS PWC_EMPLOYEE_COUNT 
      ,COUNT(DISTINCT PAYSLIP_ID) AS PWC_PAYSLIP_COUNT
      ,SUM(OVERTIME_HOURS) AS PWC_GROSS_AMOUNT
      FROM [dbo].[PREP_PAYSLIPS_HEADER]
      WHERE OVERTIME_HOURS <> 0
      ) AS HEADER
      WHERE TEST_ID = 'USR_PAY_13'
      
      /***********************************************************************************************************
      46. UPDATE [DBO].[RES_TEST_DESCRIPTION] WITH PAY_EFT - AUDIT - PAYSLIPS TO EFT RECONCILIATION
      ***********************************************************************************************************/	
      
      UPDATE [DBO].[RES_TEST_DESCRIPTION]
      SET PWC_NUMBER_OF_EMPLOYEES = NT.PWC_EMPLOYEE_COUNT 
      ,PWC_NUMBER_OF_PAYSLIPS = NT.PWC_PAYSLIP_COUNT
      ,PWC_TOTAL_GROSS_VALUE = 
      CASE WHEN NT.PWC_PAYSLIP_COUNT = 0 
      THEN 0.0000
      ELSE NT.PWC_GROSS_AMOUNT
      END
      FROM 
      (
      SELECT COUNT(DISTINCT EMPLOYEE_ID) AS PWC_EMPLOYEE_COUNT
      ,COUNT(DISTINCT EMPLOYEE_ID + '_' + PERIOD_NO) AS PWC_PAYSLIP_COUNT
      ,SUM([DIFFERENCE]) AS PWC_GROSS_AMOUNT
      FROM [dbo].[RES_PAYSLIP_EFT]
      WHERE [DIFFERENCE] <> 0
      ) AS NT
      WHERE TEST_ID = 'USR_PAY_EFT'USE [z'9bbaf92f-d960-4e33-a9cd-228c72cc97ef]
      GO
      /****** Object:  StoredProcedure [dbo].[38.BLD_TEST_RESULT_DESCRIPTION]    Script Date: 4/10/2018 10:54:24 AM ******/
      SET ANSI_NULLS ON
      GO
      SET QUOTED_IDENTIFIER ON
      GO
      ALTER PROC [dbo].[38.BLD_TEST_RESULT_DESCRIPTION]
      AS
      
      /*******************************************************************************************************************
      *                           DATA ASSURANCE                                                                         *
      ********************************************************************************************************************
      UPDATES            - Version 0.1 {18/02/2015} {Simon Tsai} - {Created Script}
      - Version 0.2 {05/03/2015} {Simon Tsai} - {Added Commentary}
      - Version 0.3 {11/03/2015} {Simon Tsai} - {Added USR_ to test id}
      - Version 0.4 {31/08/2015} {Fei Li} - {Added leave tests results}
      - Version 0.5 {28/02/2017} {Justin Moy} - {Fixed bug in section 03 to check for tests > 0}
      
      
      SCRIPT DESCRIPTION - {UNPIVOT THE RESULTS TABLE TO INCLUDE TEST DESCRIPTION}
      
      TABLE INFORMATION
      INPUT TABLE(S)
      - [DBO].[RES_EMPLOYEE]
      
      OUTPUT TABLE(S)
      - [DBO].[RES_TEST_RESULT_DESCRIPTION]
      
      SUMMARY OF SCRIPT  - 01. DROP TABLE STATEMENT
      - 02. CREATE TABLE
      - 03. UPDATE TABLE WITH EMPLOYEE TESTS
      - 04. UPDATE TABLE WITH PAYSLIP TEST WITH POSITIVE TEST RESULTS
      - 05. UNPIVOT PAYSLIP_ID TO INCLUDE TEST_DESCRIPTION
      
      ********************************************************************************************************************
      01. DROP TABLE STATEMENT
      *******************************************************************************************************************/
      
      IF OBJECT_ID('RES_TEST_RESULT_DESCRIPTION') IS NOT NULL
      DROP TABLE RES_TEST_RESULT_DESCRIPTION
      
      /*******************************************************************************************************************
      02. CREATE TABLE
      *******************************************************************************************************************/
      
      CREATE TABLE [DBO].[RES_TEST_RESULT_DESCRIPTION]
      (
      EMPLOYEE_SYSTEM_ID NVARCHAR(1000)
      ,DETAILS NVARCHAR(1000)
      ,RESULTS INT
      ,TEST_TYPE NVARCHAR(1000)
      ,TEST_DESCRIPTION NVARCHAR(1000)
      )
      
      /*******************************************************************************************************************
      03. UPDATE TABLE WITH EMPLOYEE TESTS WITH POSITIVE TEST RESULTS
      *******************************************************************************************************************/
      
      INSERT INTO [DBO].[RES_TEST_RESULT_DESCRIPTION]
      (
      EMPLOYEE_SYSTEM_ID
      ,DETAILS
      ,RESULTS
      ,TEST_TYPE
      ,[TEST_DESCRIPTION]
      )
      SELECT NT.EMPLOYEE_SYSTEM_ID
      ,NT.DETAILS
      ,NT.RESULTS
      ,TEST.[TEST_TYPE]
      ,TEST.TEST_DESCRIPTION
      FROM (
      SELECT EMPLOYEE_SYSTEM_ID
      ,'USR_' + DETAILS AS DETAILS
      ,RESULTS
      FROM [dbo].[RES_EMPLOYEE]
      UNPIVOT
      (
      RESULTS FOR DETAILS IN (PAY_01, PAY_02, PAY_03, PAY_04, PAY_05, PAY_06, PAY_07, PAY_08, PAY_09, PAY_10, PAY_11)
      ) AS UNPIV
      WHERE RESULTS > 0) AS NT
      LEFT JOIN 
      [DBO].[RES_TEST_DESCRIPTION] AS TEST
      ON TEST.[TEST_ID] = NT.DETAILS
      WHERE EMPLOYEE_SYSTEM_ID <> 'PWC_TEST_EXECUTED_'
      
      /*******************************************************************************************************************
      04. UPDATE TABLE WITH PAYSLIP TEST WITH POSITIVE TEST RESULTS
      *******************************************************************************************************************/
      
      ;WITH CTE_PAYSLIP_RESULTS
      AS 
      (
      SELECT DISTINCT HEADER.EMPLOYEE_ID + '_' + ISNULL(HEADER.SYSTEM_NAME,'') AS EMPLOYEE_SYSTEM_ID
      ,PAYSLIP.PAYSLIP_ID
      FROM [dbo].[PREP_PAYSLIPS_HEADER] AS HEADER
      LEFT JOIN
      [dbo].[RES_PAYSLIP] AS PAYSLIP
      ON HEADER.PAYSLIP_ID = PAYSLIP.PAYSLIP_ID
      )
      
      /*******************************************************************************************************************
      05. UNPIVOT PAYSLIP_ID TO INCLUDE TEST_DESCRIPTION
      *******************************************************************************************************************/
      
      INSERT INTO [DBO].[RES_TEST_RESULT_DESCRIPTION]
      (
      EMPLOYEE_SYSTEM_ID
      ,DETAILS
      ,RESULTS
      ,TEST_TYPE
      ,[TEST_DESCRIPTION]
      )
      SELECT DISTINCT PAY_RESULTS.EMPLOYEE_SYSTEM_ID 
      ,NT.DETAILS
      ,NT.RESULTS
      ,TEST.[TEST_TYPE]
      ,TEST.TEST_DESCRIPTION
      FROM (
      SELECT PAYSLIP_ID
      ,'USR_' + DETAILS AS DETAILS
      ,RESULTS
      FROM [dbo].[RES_PAYSLIP]
      UNPIVOT
      (
      RESULTS FOR DETAILS IN (PAY_12, PAY_13, PAY_14, PAY_15, PAY_16, PAY_17, PAY_18, PAY_19, PAY_20, PAY_21, PAY_22,PAY_23, PAY_24) 
      ) AS UNPIV
      WHERE RESULTS = 1
      AND PAYSLIP_ID <> 'PWC_TEST_EXECUTED_') AS NT
      LEFT JOIN
      [DBO].[RES_TEST_DESCRIPTION] AS TEST
      ON TEST.[TEST_ID] = NT.DETAILS
      LEFT JOIN 
      CTE_PAYSLIP_RESULTS AS PAY_RESULTS
      ON	PAY_RESULTS.PAYSLIP_ID = NT.PAYSLIP_ID
      WHERE EMPLOYEE_SYSTEM_ID <> 'PWC_TEST_EXECUTED_'
      
      /*******************************************************************************************************************
      06. UPDATE TABLE WITH LEAVE TESTS WITH POSITIVE TEST RESULTS
      *******************************************************************************************************************/
      
      INSERT INTO [DBO].[RES_TEST_RESULT_DESCRIPTION]
      (
      EMPLOYEE_SYSTEM_ID
      ,DETAILS
      ,RESULTS
      ,TEST_TYPE
      ,[TEST_DESCRIPTION]
      )
      SELECT NT.EMPLOYEE_SYSTEM_ID
      ,NT.DETAILS
      ,NT.RESULTS
      ,TEST.[TEST_TYPE]
      ,TEST.TEST_DESCRIPTION
      FROM (
      SELECT EMPLOYEE_SYSTEM_ID
      ,'USR_' + DETAILS AS DETAILS
      ,RESULTS
      FROM [dbo].[RES_LEAVE]
      UNPIVOT
      (
      RESULTS FOR DETAILS IN (PAY_31, PAY_32, PAY_33, PAY_34, PAY_35, PAY_36)
      ) AS UNPIV
      WHERE RESULTS = 1) AS NT
      LEFT JOIN 
      [DBO].[RES_TEST_DESCRIPTION] AS TEST
      ON TEST.[TEST_ID] = NT.DETAILS
      WHERE EMPLOYEE_SYSTEM_ID <> 'PWC_TEST_EXECUTED_'USE [z'9bbaf92f-d960-4e33-a9cd-228c72cc97ef]
      GO
      /****** Object:  StoredProcedure [dbo].[39.UPDATE_EMP_BANK_ACCOUNT]    Script Date: 4/10/2018 10:54:48 AM ******/
      SET ANSI_NULLS ON
      GO
      SET QUOTED_IDENTIFIER ON
      GO
      ALTER PROC [dbo].[39.UPDATE_EMP_BANK_ACCOUNT]
      AS
      
      /***************************************************************************************************************
      *                           DATA ASSURANCE                                                                     *
      ****************************************************************************************************************
      UPDATES            - Version 0.1 {18/02/2015} {Simon Tsai} - {Created Script}
      - Version 0.2 {05/03/2015} {Simon Tsai} - {Added Commentary}
      
      SCRIPT DESCRIPTION - {Update emp bank account with PWC columns}
      
      TABLE INFORMATION
      INPUT TABLE(S)
      - [DBO].[PREP_EMP_BANK_ACCOUNT]
      - [DA_Master_DataSet].[dbo].[RAW_BSB_LISTING]
      
      OUTPUT TABLE(S)
      - [DBO].[PREP_EMP_BANK_ACCOUNT]
      
      SUMMARY OF SCRIPT  - 01. CREATE CTE WITH CLEANSED BANK BSB NUMBER AND BANK LOCATION INFORMATION
      - 02. UPDATE [PREP_EMP_BANK_ACCOUNT] TABLE WITH CLEANSED BANK BSB NUMBER AND BANK NAME
      - 03. UPDATE [PREP_EMP_BANK_ACCOUNT] TABLE WITH BANK NAME FOR THOSE WITH MISSING BANK BSB 
      NUMBER
      
      ****************************************************************************************************************
      01. CREATE CTE WITH CLEANSED BANK BSB NUMBER AND BANK LOCATION INFORMATION
      ***************************************************************************************************************/
      
      ;WITH CTE_BANK
      AS 
      (
      SELECT EMPLOYEE_ID + '_' + ISNULL(SYSTEM_NAME,'') AS EMPLOYEE_SYSTEM_ID
      ,RIGHT('000000000000000'+dbo.fn_StripCharacters(BSB.BSB, '^0-9'),15) AS BSB
      ,BANK = BSB.Bank 
      ,BSB.LOCATION
      ,BSB.[Street address]
      FROM [dbo].[PREP_EMP_BANK_ACCOUNT] AS BA
      LEFT JOIN
      [DA_Master_DataSet].[dbo].[RAW_BSB_LISTING] AS BSB
      ON BA.PWC_BSB_NUMBER = RIGHT('000000000000000'+dbo.fn_StripCharacters(BSB.BSB, '^0-9'),15)
      )
      
      /***************************************************************************************************************
      02. UPDATE [PREP_EMP_BANK_ACCOUNT] TABLE WITH CLEANSED BANK BSB NUMBER AND BANK NAME
      ***************************************************************************************************************/
      
      UPDATE [DBO].[PREP_EMP_BANK_ACCOUNT]
      SET PWC_BSB_STATUS = CASE WHEN (CTE_BANK.BSB IS NULL) 
      THEN 1
      ELSE 0
      END
      ,PWC_BANK_NAME = CTE_BANK.BANK
      FROM [dbo].[PREP_EMP_BANK_ACCOUNT]
      LEFT JOIN
      CTE_BANK
      ON Employee_ID + '_' + ISNULL(SYSTEM_NAME,'') = CTE_BANK.EMPLOYEE_SYSTEM_ID
      AND
      PWC_BSB_NUMBER = CTE_BANK.BSB
      
      /***************************************************************************************************************
      03. UPDATE [PREP_EMP_BANK_ACCOUNT] TABLE WITH BANK NAME FOR THOSE WITH MISSING BANK BSB NUMBER
      USING THE LEFT MOST 3 DIGIT OF THE BANK BSB NUMBER TO DETERMINE THE BANK NAME
      ***************************************************************************************************************/
      
      UPDATE [dbo].[PREP_EMP_BANK_ACCOUNT]
      SET PWC_BANK_NAME = 
      (
      SELECT DISTINCT [RAW].BANK
      FROM [DA_Master_DataSet].[dbo].[RAW_BSB_LISTING] AS [RAW]
      WHERE LEFT(RIGHT(dbo.fn_StripCharacters(BSB, '^0-9'),6),3) =LEFT(RIGHT(BA.PWC_BSB_NUMBER,6),3)
      )
      FROM [dbo].[PREP_EMP_BANK_ACCOUNT] AS BA
      WHERE ISNULL(PWC_BANK_NAME,'') =  '' AND PWC_BSB_STATUS<>1USE [z'9bbaf92f-d960-4e33-a9cd-228c72cc97ef]
      GO
      /****** Object:  StoredProcedure [dbo].[40.UPDATE_EMP_MASTER_TEST_FAILED]    Script Date: 4/10/2018 10:55:13 AM ******/
      SET ANSI_NULLS ON
      GO
      SET QUOTED_IDENTIFIER ON
      GO
      ALTER PROC [dbo].[40.UPDATE_EMP_MASTER_TEST_FAILED]
      AS
      
      /********************************************************************************************************************
      *                           DATA ASSURANCE                                                                          *
      *********************************************************************************************************************
      UPDATES            - Version 0.1 {12/02/2015} {Simon Tsai} - {Update emp master with PWC columns}
      - Version 0.2 {05/03/2015} {Simon Tsai} - {Added Commentary}
      - Version 0.3 {31/08/2015} {Fei Li} - {Update leave test result}
      
      SCRIPT DESCRIPTION - {Update emp master with PWC columns}
      
      TABLE INFORMATION
      INPUT TABLE(S)
      - [DBO].[RES_EMPLOYEE]
      - [DBO].[RES_PAYSLIP]
      - [DBO].[RES_LEAVE]
      - [DBO].[PREP_PAYSLIPS_HEADER]
      
      OUTPUT TABLE(S)
      - [DBO].[PREP_EMP_MASTER]
      
      SUMMARY OF SCRIPT  - 01. CREATE CTE TABLE TO IDENTIFY WHETHER EACH OF THE EMPLOYEE TEST HAS FAILED
      - 02. UPDATE [PREP_EMP_MASTER] TABLE WITH THE EMPLOYEE TEST EACH EMPLOYEE HAS FAILED
      - 03. CREATE CTE TABLE TO IDENTIFY WHETHER EACH OF THE PLAYSLIP TEST HAS FAILED
      - 04. UPDATE [PREP_EMP_MASTER] TABLE WITH THE PLAYSLIP TEST EACH EMPLOYEE HAS FAILED
      - 05. CREATE CTE TABLE TO IDENTIFY WHETHER EACH OF THE EMPLOYEE LEAVE TEST HAS FAILED 
      - 06. UPDATE [PREP_EMP_MASTER] TABLE WITH THE LEAVE TEST EACH EMPLOYEE HAS FAILED
      
      *********************************************************************************************************************
      01. CREATE CTE TABLE TO IDENTIFY WHETHER EACH OF THE EMPLOYEE TEST HAS FAILED 
      ********************************************************************************************************************/
      
      ;WITH CTE_RESULTS_B
      AS
      (
      SELECT DISTINCT EMPLOYEE_SYSTEM_ID
      ,TESTS_FAILED =
      (CASE WHEN ISNULL(PAY_01,0) > 0 THEN 1
      ELSE 0
      END) +
      (CASE WHEN ISNULL(PAY_02,0) > 0 THEN 1
      ELSE 0
      END) +
      (CASE WHEN ISNULL(PAY_03,0) > 0 THEN 1
      ELSE 0
      END) +
      (CASE WHEN ISNULL(PAY_04,0) > 0 THEN 1
      ELSE 0
      END) +
      (CASE WHEN ISNULL(PAY_05,0) > 0 THEN 1
      ELSE 0
      END) +
      (CASE WHEN ISNULL(PAY_06,0) > 0 THEN 1
      ELSE 0
      END) +
      (CASE WHEN ISNULL(PAY_07,0) > 0 THEN 1
      ELSE 0
      END) +
      (CASE WHEN ISNULL(PAY_08,0) > 0 THEN 1
      ELSE 0
      END) +
      (CASE WHEN ISNULL(PAY_09,0) > 0 THEN 1
      ELSE 0
      END) +
      (CASE WHEN ISNULL(PAY_10,0) > 0 THEN 1
      ELSE 0
      END) +
      (CASE WHEN ISNULL(PAY_11,0) > 0 THEN 1
      ELSE 0
      END)
      FROM [dbo].[RES_EMPLOYEE]
      )
      
      /********************************************************************************************************************
      02. UPDATE [PREP_EMP_MASTER] TABLE WITH THE EMPLOYEE TEST EACH EMPLOYEE HAS FAILED
      ********************************************************************************************************************/
      
      UPDATE [dbo].[PREP_EMP_MASTER]
      SET PWC_EMPLOYEE_TESTS_FAILED = CTE_RESULTS_B.TESTS_FAILED
      FROM CTE_RESULTS_B
      WHERE CTE_RESULTS_B.EMPLOYEE_SYSTEM_ID = ([dbo].[PREP_EMP_MASTER].EMPLOYEE_ID + '_' 
      + ISNULL([dbo].[PREP_EMP_MASTER].SYSTEM_NAME,''))
      
      /********************************************************************************************************************
      03. CREATE CTE TABLE TO IDENTIFY WHETHER EACH OF THE PLAYSLIP TEST HAS FAILED 
      ********************************************************************************************************************/
      
      ;WITH CTE_RESULTS_A
      AS
      (
      SELECT PREP_PAY.EMPLOYEE_ID
      ,SUM(RES_PAY.PAY_12) AS PAY_12
      ,SUM(RES_PAY.PAY_13) AS PAY_13
      ,SUM(RES_PAY.PAY_14) AS PAY_14
      ,SUM(RES_PAY.PAY_15) AS PAY_15
      ,SUM(RES_PAY.PAY_16) AS PAY_16
      ,SUM(RES_PAY.PAY_17) AS PAY_17
      ,SUM(RES_PAY.PAY_18) AS PAY_18
      ,SUM(RES_PAY.PAY_19) AS PAY_19
      ,SUM(RES_PAY.PAY_20) AS PAY_20
      ,SUM(RES_PAY.PAY_21) AS PAY_21
      ,SUM(RES_PAY.PAY_22) AS PAY_22
      ,SUM(RES_PAY.PAY_23) AS PAY_23
      ,SUM(RES_PAY.PAY_24) AS PAY_24
      FROM [dbo].[PREP_PAYSLIPS_HEADER] AS PREP_PAY
      LEFT JOIN
      [dbo].[RES_PAYSLIP] AS RES_PAY
      ON PREP_PAY.PAYSLIP_ID = RES_PAY.PAYSLIP_ID
      GROUP BY PREP_PAY.EMPLOYEE_ID
      )
      ,CTE_RESULTS
      AS
      (
      SELECT DISTINCT EMPLOYEE_ID
      ,TESTS_FAILED =
      (CASE WHEN ISNULL(PAY_12,0) > 0 THEN 1
      ELSE 0
      END) +
      (CASE WHEN ISNULL(PAY_13,0) > 0 THEN 1
      ELSE 0
      END) +	
      (CASE WHEN ISNULL(PAY_14,0) > 0 THEN 1
      ELSE 0
      END) +
      (CASE WHEN ISNULL(PAY_15,0) > 0 THEN 1
      ELSE 0
      END) +
      (CASE WHEN ISNULL(PAY_16,0) > 0 THEN 1
      ELSE 0
      END) +
      (CASE WHEN ISNULL(PAY_17,0) > 0 THEN 1
      ELSE 0
      END) +
      (CASE WHEN ISNULL(PAY_18,0) > 0 THEN 1
      ELSE 0
      END) +
      (CASE WHEN ISNULL(PAY_19,0) > 0 THEN 1
      ELSE 0
      END) +
      (CASE WHEN ISNULL(PAY_20,0) > 0 THEN 1
      ELSE 0
      END) +
      (CASE WHEN ISNULL(PAY_21,0) > 0 THEN 1
      ELSE 0
      END) + 
      (CASE WHEN ISNULL(PAY_22,0) > 0 THEN 1
      ELSE 0
      END) +
      (CASE WHEN ISNULL(PAY_23,0) > 0 THEN 1
      ELSE 0
      END) +
      (CASE WHEN ISNULL(PAY_24,0) > 0 THEN 1
      ELSE 0
      END)
      FROM CTE_RESULTS_A
      )
      
      
      /********************************************************************************************************************
      04. UPDATE [PREP_EMP_MASTER] TABLE WITH THE PLAYSLIP TEST EACH EMPLOYEE HAS FAILED
      ********************************************************************************************************************/
      
      UPDATE [dbo].[PREP_EMP_MASTER]
      SET PWC_PAYSLIP_TESTS_FAILED = ISNULL(
      (SELECT RESULTS.TESTS_FAILED
      FROM CTE_RESULTS AS RESULTS
      WHERE RESULTS.EMPLOYEE_ID = [dbo].[PREP_EMP_MASTER].EMPLOYEE_ID),0) 
      
      /********************************************************************************************************************
      05. CREATE CTE TABLE TO IDENTIFY WHETHER EACH OF THE EMPLOYEE LEAVE TEST HAS FAILED 
      ********************************************************************************************************************/
      
      ;WITH CTE_RESULTS_C
      AS
      (
      SELECT DISTINCT EMPLOYEE_SYSTEM_ID
      ,TESTS_FAILED =
      (CASE WHEN ISNULL(PAY_31,0) > 0 THEN 1
      ELSE 0
      END) +
      (CASE WHEN ISNULL(PAY_32,0) > 0 THEN 1
      ELSE 0
      END) +
      (CASE WHEN ISNULL(PAY_33,0) > 0 THEN 1
      ELSE 0
      END) +
      (CASE WHEN ISNULL(PAY_34,0) > 0 THEN 1
      ELSE 0
      END) +
      (CASE WHEN ISNULL(PAY_35,0) > 0 THEN 1
      ELSE 0
      END) +
      (CASE WHEN ISNULL(PAY_36,0) > 0 THEN 1
      ELSE 0
      END) 
      FROM [dbo].[RES_LEAVE]
      )
      
      /********************************************************************************************************************
      06. UPDATE [PREP_EMP_MASTER] TABLE WITH THE LEAVE TEST EACH EMPLOYEE HAS FAILED
      ********************************************************************************************************************/
      
      UPDATE [dbo].[PREP_EMP_MASTER]
      SET PWC_LEAVE_TESTS_FAILED = CTE_RESULTS_C.TESTS_FAILED
      FROM CTE_RESULTS_C
      WHERE CTE_RESULTS_C.EMPLOYEE_SYSTEM_ID = ([dbo].[PREP_EMP_MASTER].EMPLOYEE_ID + '_' 
      + ISNULL([dbo].[PREP_EMP_MASTER].SYSTEM_NAME,''))USE [z'9bbaf92f-d960-4e33-a9cd-228c72cc97ef]
      GO
      /****** Object:  StoredProcedure [dbo].[41.BLD_RES_USER_DEFINED]    Script Date: 4/10/2018 10:55:40 AM ******/
      SET ANSI_NULLS ON
      GO
      SET QUOTED_IDENTIFIER ON
      GO
      ALTER PROC [dbo].[41.BLD_RES_USER_DEFINED]
      AS
      
      /***********************************************************************************************************
      *                           DATA ASSURANCE                                                                 *
      ************************************************************************************************************
      UPDATES            - Version 0.1 {10/02/2015} {Avideep Agarwal} - {Base script}
      - Version 0.2 {02/03/2015} {Simon Tsai} - {Updated Script to automatically pick up all 
      fields}
      - Version 0.3 {04/03/2015} {Simon Tsai} - {Added Commentary}
      - Version 0.4 {31/08/2015} {Fei Li} -{Added RES_LEAVE}
      
      SCRIPT DESCRIPTION - {TO CREATE A TABLE WHICH DYNAMICALLY PICKS UP ALL THE FIELDS FROM OUR TESTING TABLES}
      
      TABLE INFORMATION
      INPUT TABLE(S)
      - [DBO].[RES_EMPLOYEE]
      - [DBO].[RES_PAYSLIP]
      - [DBO].[RES_LEAVE]
      
      OUTPUT TABLE(S)
      - [DBO].[CTE_EMPLOYEE_TEST_TEMP]
      - [DBO].[RES_USER_DEFINED]
      
      SUMMARY OF SCRIPT  - 01. DROP TABLE STATEMENT
      - 02. DEFINE VARIABLES
      - 03. GENERATE A STRING WHICH CAPTURES ALL THE EMPLOYEE AND PAYSLIP TESTS
      - 04. USING A DYNAMIC PIVOT TABLE TO CREATE A TABLE USING EACH TEST AS HEADER
      - 05. RESET THE DYNAMIC PIVOT TABLE TO CLEAR ALL EXISTING INFORMATION
      - 06. CREATE CTE TO UPDATE ALL TEST FIELDS TO DEFAULT TO 0 AND COMMENT SECTION TO NULL
      ************************************************************************************************************
      01. DROP TABLE STATEMENT
      ***********************************************************************************************************/
      
      IF OBJECT_ID('RES_USER_DEFINED') IS NOT NULL
      DROP TABLE [DBO].[RES_USER_DEFINED]
      
      IF OBJECT_ID('CTE_EMPLOYEE_TEST_TEMP') IS NOT NULL
      DROP TABLE [DBO].[CTE_EMPLOYEE_TEST_TEMP]
      
      /***********************************************************************************************************
      02. DEFINE VARIABLES
      ***********************************************************************************************************/
      
      DECLARE @COLUMN_NAME NVARCHAR(4000) 
      DECLARE @DYNAMICPIVOT AS NVARCHAR(4000)
      DECLARE @UPDATESTRING AS NVARCHAR(4000)
      
      /***********************************************************************************************************
      03. GENERATE A STRING WHICH CAPTURES ALL THE EMPLOYEE AND PAYSLIP TESTS
      STORE TEMPORY INFORMATION IN [DBO].[CTE_EMPLOYEE_TEST_TEMP]
      ***********************************************************************************************************/
      
      SELECT CAST('EMPLOYEE_SYSTEM_ID' AS NVARCHAR(1000)) AS EMPLOYEE_SYSTEM_ID 
      ,CAST('USR_'+ C.NAME AS NVARCHAR(1000)) AS COLUMN_NAME
      ,1 AS VALUE
      INTO [DBO].[CTE_EMPLOYEE_TEST_TEMP]
      FROM SYS.tables AS T
      INNER JOIN SYS.columns AS C ON T.object_id = C.object_id
      WHERE (T.NAME = 'RES_EMPLOYEE' OR T.NAME = 'RES_PAYSLIP' OR T.NAME='RES_LEAVE') 
      AND
      (LEN(C.NAME) < 10)
      
      SELECT @COLUMN_NAME = COALESCE(@COLUMN_NAME + ',', '') + CAST(COLUMN_NAME AS NVARCHAR(1000))
      FROM (SELECT DISTINCT COLUMN_NAME FROM [DBO].[CTE_EMPLOYEE_TEST_TEMP]) TEST
      
      /***********************************************************************************************************
      04. USING A DYNAMIC PIVOT TABLE TO CREATE A TABLE USING EACH TEST AS HEADER
      ***********************************************************************************************************/
      
      SET @DYNAMICPIVOT = 
      'SELECT CAST(''EMPLOYEE_SYSTEM_ID'' AS NVARCHAR(1000)) AS EMPLOYEE_SYSTEM_ID
      ,' + @COLUMN_NAME + '
      ,CAST('''' AS NVARCHAR(1000)) AS COMMENT
      INTO [DBO].[RES_USER_DEFINED]
      FROM (
      SELECT VALUE, COLUMN_NAME FROM [DBO].[CTE_EMPLOYEE_TEST_TEMP]
      ) AS TEST
      PIVOT (
      SUM(VALUE)
      FOR COLUMN_NAME IN (' + @COLUMN_NAME + ')
      ) AS PIV;'

      EXEC SP_EXECUTESQL @DYNAMICPIVOT
      
      /***********************************************************************************************************
      05. RESET THE DYNAMIC PIVOT TABLE TO CLEAR ALL EXISTING INFORMATION
      ***********************************************************************************************************/
      
      TRUNCATE TABLE [DBO].[RES_USER_DEFINED]
      INSERT [DBO].[RES_USER_DEFINED] (EMPLOYEE_SYSTEM_ID) 
      SELECT DISTINCT EMPLOYEE_SYSTEM_ID AS EMPLOYEE_SYSTEM_ID FROM [DBO].[RES_EMPLOYEE]
      
      /***********************************************************************************************************
      06. CREATE CTE TO UPDATE ALL TEST FIELDS TO DEFAULT TO 0 AND COMMENT SECTION TO NULL
      ***********************************************************************************************************/
      
      ;WITH CTE_UPDATE_USER_PAY
      AS
      (
      SELECT 'UPDATE [DBO].[RES_USER_DEFINED] SET ' + C.NAME 
      + ' = 0 WHERE ISNULL(' + C.NAME + ','''') = ''''' AS UPDATESTRING
      FROM SYS.tables AS T
      INNER JOIN SYS.columns AS C ON T.object_id = C.object_id
      WHERE T.NAME = 'RES_USER_DEFINED' AND NOT (C.NAME = 'EMPLOYEE_SYSTEM_ID' OR C.NAME = 'COMMENT') -- OR )
      )
      
      SELECT @UPDATESTRING = COALESCE(@UPDATESTRING + ';', '') + CAST(UPDATESTRING AS NVARCHAR(1000))
      FROM (SELECT DISTINCT UPDATESTRING FROM CTE_UPDATE_USER_PAY) TEST
      
      EXEC SP_EXECUTESQL @UPDATESTRINGUSE [z'9bbaf92f-d960-4e33-a9cd-228c72cc97ef]
      GO
      /****** Object:  StoredProcedure [dbo].[42.BLD_RES_TOTAL_LEVEL_SUMMARY]    Script Date: 4/10/2018 10:56:11 AM ******/
      SET ANSI_NULLS ON
      GO
      SET QUOTED_IDENTIFIER ON
      GO
      ALTER PROC [dbo].[42.BLD_RES_TOTAL_LEVEL_SUMMARY]
      AS
      
      /**************************************************************************************************************************************
      *                           DATA ASSURANCE																							  *
      ***************************************************************************************************************************************
      UPDATES            - Version 0.1 {18/03/2015} {Simon Tsai} - {Base script}
      
      SCRIPT DESCRIPTION - {TO CREATE A TABLE WITH HIGH LEVEL PAYSLIP INFORMATION}
      
      TABLE INFORMATION
      INPUT TABLE(S)
      - [dbo].[PREP_PAYSLIPS_HEADER]
      - [dbo].[PREP_EMP_MASTER]
      
      OUTPUT TABLE(S)
      - [DBO].[RES_TOTAL_LEVEL_SUMMARY]
      
      SUMMARY OF SCRIPT  - 01. DROP TABLE STATEMENT
      - 02. CREATE TABLE
      - 03. INSERT DATA INTO [DBO].[RES_TOTAL_LEVEL_SUMMARY] USING PAYSLIP INFORMATION
      - 04. INSERT DATA INTO [DBO].[RES_TOTAL_LEVEL_SUMMARY] USING EMPLOYEE MASTER INFORMATION
      - 05. INSERT DATA INTO [DBO].[RES_TOTAL_LEVEL_SUMMARY] FOR EMPLOYEE_AVERAGE_HEADCOUNT
      - 06. INSERT DATA INTO [DBO].[RES_TOTAL_LEVEL_SUMMARY] FOR EMPLOYEE_AVERAGE_MONTHLY_PAY AND EMPLOYEE_OPENING_AVERAGE_PAY
      - 07. INSERT DATA INTO [DBO].[RES_TOTAL_LEVEL_SUMMARY] FOR EMPLOYEE_CLOSING_AVERAGE_PAY
      
      ***************************************************************************************************************************************
      01. DROP TABLE STATEMENT
      **************************************************************************************************************************************/
      
      IF OBJECT_ID('RES_TOTAL_LEVEL_SUMMARY') IS NOT NULL
      DROP TABLE [DBO].[RES_TOTAL_LEVEL_SUMMARY]
      
      /**************************************************************************************************************************************
      02. CREATE TABLE
      **************************************************************************************************************************************/
      
      CREATE TABLE [DBO].[RES_TOTAL_LEVEL_SUMMARY]
      (
      EMPLOYEE_GROSS_PAY DECIMAL(18, 4) DEFAULT 0
      ,EMPLOYEE_PAY_DEDUCTION_PRE_TAX DECIMAL(18, 4) DEFAULT 0
      ,EMPLOYEE_PAY_DEDUCTION_POST_TAX DECIMAL(18, 4) DEFAULT 0
      ,EMPLOYEE_NET_PAY DECIMAL(18, 4) DEFAULT 0
      ,EMPLOYEE_PAY_BONUS DECIMAL(18, 4) DEFAULT 0
      ,EMPLOYEE_OPENING_HEADCOUNT DECIMAL(18,4) DEFAULT 0
      ,EMPLOYEE_CLOSING_HEADCOUNT DECIMAL(18,4) DEFAULT 0
      ,EMPLOYEE_AVERAGE_HEADCOUNT DECIMAL(18,4) DEFAULT 0
      ,EMPLOYEE_AVERAGE_MONTHLY_PAY DECIMAL(18 ,4) DEFAULT 0
      ,EMPLOYEE_OPENING_AVERAGE_PAY DECIMAL(18 ,4) DEFAULT 0
      ,EMPLOYEE_CLOSING_AVERAGE_PAY DECIMAL(18 ,4) DEFAULT 0
      )
      
      /**************************************************************************************************************************************
      03. INSERT DATA INTO [DBO].[RES_TOTAL_LEVEL_SUMMARY] USING PAYSLIP INFORMATION
      - PLEASE NOTE: BONUS IS CALCULATED USING ADDITIONS BEFORE TAX
      **************************************************************************************************************************************/
      
      INSERT INTO [DBO].[RES_TOTAL_LEVEL_SUMMARY]
      (
      EMPLOYEE_GROSS_PAY
      ,EMPLOYEE_PAY_DEDUCTION_PRE_TAX
      ,EMPLOYEE_PAY_DEDUCTION_POST_TAX
      ,EMPLOYEE_NET_PAY
      ,EMPLOYEE_PAY_BONUS
      )
      SELECT SUM(PWC_GROSS_AMOUNT) AS EMPLOYEE_GROSS_PAY
      ,SUM(DEDUCTIONS_BEFORE_TAX) AS EMPLOYEE_PAY_DEDUCTION_PRE_TAX
      ,SUM(DEDUCTIONS_AFTER_TAX) AS EMPLOYEE_PAY_DEDUCTION_POST_TAX
      ,SUM(PWC_NET_AMOUNT) AS EMPLOYEE_NET_PAY
      ,SUM(ADDITIONS_BEFORE_TAX) AS EMPLOYEE_PAY_BONUS
      FROM [dbo].[PREP_PAYSLIPS_HEADER]
      
      /**************************************************************************************************************************************
      04. INSERT DATA INTO [DBO].[RES_TOTAL_LEVEL_SUMMARY] USING EMPLOYEE MASTER INFORMATION
      **************************************************************************************************************************************/
      
      UPDATE [DBO].[RES_TOTAL_LEVEL_SUMMARY]
      SET EMPLOYEE_OPENING_HEADCOUNT = NT.EMPLOYEE_OPENING_HEADCOUNT
      ,EMPLOYEE_CLOSING_HEADCOUNT = NT.EMPLOYEE_CLOSING_HEADCOUNT
      FROM (
      SELECT SUM(PWC_BEGINNING_ACTIVE_EMPLOYEE) AS EMPLOYEE_OPENING_HEADCOUNT
      ,SUM(PWC_ENDING_ACTIVE_EMPLOYEE) AS EMPLOYEE_CLOSING_HEADCOUNT
      FROM [dbo].[PREP_EMP_MASTER]
      ) AS NT
      
      /**************************************************************************************************************************************
      05. INSERT DATA INTO [DBO].[RES_TOTAL_LEVEL_SUMMARY] FOR EMPLOYEE_AVERAGE_HEADCOUNT
      **************************************************************************************************************************************/
      
      UPDATE [DBO].[RES_TOTAL_LEVEL_SUMMARY]
      SET EMPLOYEE_AVERAGE_HEADCOUNT = (EMPLOYEE_OPENING_HEADCOUNT + EMPLOYEE_CLOSING_HEADCOUNT) / 2
      
      /**************************************************************************************************************************************
      06. INSERT DATA INTO [DBO].[RES_TOTAL_LEVEL_SUMMARY] FOR EMPLOYEE_AVERAGE_MONTHLY_PAY AND EMPLOYEE_OPENING_AVERAGE_PAY
      PLEASE NOTE: IF EMPLOYEE_AVERAGE_HEADCOUNT IS ZERO, THEN THE AVERAGE CALCULATED FIELDS WILL BE NULL
      **************************************************************************************************************************************/
      
      UPDATE [DBO].[RES_TOTAL_LEVEL_SUMMARY]
      SET EMPLOYEE_AVERAGE_MONTHLY_PAY = 
      CASE WHEN EMPLOYEE_AVERAGE_HEADCOUNT = 0 
      THEN NULL
      ELSE ((EMPLOYEE_GROSS_PAY - EMPLOYEE_PAY_BONUS) / EMPLOYEE_AVERAGE_HEADCOUNT) / 12
      END
      ,EMPLOYEE_OPENING_AVERAGE_PAY = 
      CASE WHEN EMPLOYEE_AVERAGE_HEADCOUNT = 0
      THEN NULL
      ELSE (NT.PWC_GROSS_AMOUNT - NT.ADDITIONS_BEFORE_TAX) / NT.PWC_HEAD_COUNT
      END
      FROM 
      (
      SELECT COUNT(DISTINCT EMPLOYEE_ID) AS PWC_HEAD_COUNT 
      ,SUM(PWC_GROSS_AMOUNT) AS PWC_GROSS_AMOUNT
      ,SUM(ADDITIONS_BEFORE_TAX) AS ADDITIONS_BEFORE_TAX
      ,MONTH(PAY_PERIOD) AS PAY_MONTH
      ,YEAR(PAY_PERIOD) AS PAY_YEAR
      FROM (
      SELECT MIN(PAY_PERIOD) AS MIN_PAY_PERIOD
      FROM [dbo].[PREP_PAYSLIPS_HEADER]
      ) AS TEMP 
      LEFT JOIN
      [dbo].[PREP_PAYSLIPS_HEADER]
      ON MONTH(PAY_PERIOD) = MONTH(TEMP.MIN_PAY_PERIOD)
      AND 
      YEAR(PAY_PERIOD) = YEAR(TEMP.MIN_PAY_PERIOD)
      GROUP BY MONTH(PAY_PERIOD)
      ,YEAR(PAY_PERIOD)
      ) AS NT
      
      /**************************************************************************************************************************************
      07. INSERT DATA INTO [DBO].[RES_TOTAL_LEVEL_SUMMARY] FOR EMPLOYEE_CLOSING_AVERAGE_PAY
      PLEASE NOTE: IF EMPLOYEE_AVERAGE_HEADCOUNT IS ZERO, THEN THE AVERAGE CALCULATED FIELDS WILL BE NULL
      **************************************************************************************************************************************/
      
      UPDATE [DBO].[RES_TOTAL_LEVEL_SUMMARY]
      SET EMPLOYEE_CLOSING_AVERAGE_PAY = 
      CASE WHEN EMPLOYEE_AVERAGE_HEADCOUNT = 0 
      THEN NULL
      ELSE (NT.PWC_GROSS_AMOUNT - NT.ADDITIONS_BEFORE_TAX) / NT.PWC_HEAD_COUNT
      END
      FROM 
      (
      SELECT COUNT(DISTINCT EMPLOYEE_ID) AS PWC_HEAD_COUNT 
      ,SUM(PWC_GROSS_AMOUNT) AS PWC_GROSS_AMOUNT
      ,SUM(ADDITIONS_BEFORE_TAX) AS ADDITIONS_BEFORE_TAX
      ,MONTH(PAY_PERIOD) AS PAY_MONTH
      ,YEAR(PAY_PERIOD) AS PAY_YEAR
      FROM (
      SELECT MAX(PAY_PERIOD) AS MIN_PAY_PERIOD
      FROM [dbo].[PREP_PAYSLIPS_HEADER]
      ) AS TEMP 
      LEFT JOIN
      [dbo].[PREP_PAYSLIPS_HEADER]
      ON MONTH(PAY_PERIOD) = MONTH(TEMP.MIN_PAY_PERIOD)
      AND 
      YEAR(PAY_PERIOD) = YEAR(TEMP.MIN_PAY_PERIOD)
      GROUP BY MONTH(PAY_PERIOD)
      ,YEAR(PAY_PERIOD)
      ) AS NT
      
      USE [z'9bbaf92f-d960-4e33-a9cd-228c72cc97ef]
      GO
      /****** Object:  StoredProcedure [dbo].[43.BLD_RES_POSITION_LEVEL_SUMMARY]    Script Date: 4/10/2018 10:56:59 AM ******/
      SET ANSI_NULLS ON
      GO
      SET QUOTED_IDENTIFIER ON
      GO
      ALTER PROC [dbo].[43.BLD_RES_POSITION_LEVEL_SUMMARY]
      AS
      
      /**************************************************************************************************************************************
      *                           DATA ASSURANCE																							  *
      ***************************************************************************************************************************************
      UPDATES            - Version 0.1 {18/03/2015} {Simon Tsai} - {Base script}
      
      SCRIPT DESCRIPTION - {TO CREATE A TABLE WITH HIGH LEVEL EMPLOYEE POSITION INFORMATION}
      
      TABLE INFORMATION
      INPUT TABLE(S)
      - [DBO].[RES_EMPLOYEE]
      - [DBO].[RES_PAYSLIP]
      
      OUTPUT TABLE(S)
      - [DBO].[RES_POSITION_LEVEL_SUMMARY]
      
      SUMMARY OF SCRIPT  - 01. DROP TABLE STATEMENT
      - 02. CREATE TABLE
      
      ***************************************************************************************************************************************
      01. DROP TABLE STATEMENT
      **************************************************************************************************************************************/
      
      IF OBJECT_ID('RES_POSITION_LEVEL_SUMMARY') IS NOT NULL
      DROP TABLE [DBO].[RES_POSITION_LEVEL_SUMMARY]
      
      /**************************************************************************************************************************************
      02. CREATE TABLE
      **************************************************************************************************************************************/
      
      CREATE TABLE [DBO].[RES_POSITION_LEVEL_SUMMARY]
      (
      EMPLOYEE_POSITION NVARCHAR(1000)
      ,EMPLOYEE_GROSS_PAY DECIMAL(18, 4) DEFAULT 0
      ,EMPLOYEE_PAY_DEDUCTION_PRE_TAX DECIMAL(18, 4) DEFAULT 0
      ,EMPLOYEE_PAY_DEDUCTION_POST_TAX DECIMAL(18, 4) DEFAULT 0
      ,EMPLOYEE_NET_PAY DECIMAL(18, 4) DEFAULT 0
      ,EMPLOYEE_PAY_BONUS DECIMAL(18, 4) DEFAULT 0
      ,EMPLOYEE_OPENING_HEADCOUNT DECIMAL(18,4) DEFAULT 0
      ,EMPLOYEE_CLOSING_HEADCOUNT DECIMAL(18,4) DEFAULT 0
      ,EMPLOYEE_AVERAGE_HEADCOUNT DECIMAL(18,4) DEFAULT 0
      ,EMPLOYEE_AVERAGE_MONTHLY_PAY DECIMAL(18 ,4) DEFAULT 0
      ,EMPLOYEE_OPENING_AVERAGE_PAY DECIMAL(18 ,4) DEFAULT 0
      ,EMPLOYEE_CLOSING_AVERAGE_PAY DECIMAL(18 ,4) DEFAULT 0
      )
      
      /**************************************************************************************************************************************
      03. INSERT DATA INTO [DBO].[RES_TOTAL_LEVEL_SUMMARY] USING PAYSLIP INFORMATION
      - PLEASE NOTE: BONUS IS CALCULATED USING ADDITIONS BEFORE TAX
      **************************************************************************************************************************************/
      
      INSERT INTO [DBO].[RES_POSITION_LEVEL_SUMMARY]
      (
      EMPLOYEE_POSITION
      ,EMPLOYEE_GROSS_PAY
      ,EMPLOYEE_PAY_DEDUCTION_PRE_TAX
      ,EMPLOYEE_PAY_DEDUCTION_POST_TAX
      ,EMPLOYEE_NET_PAY
      ,EMPLOYEE_PAY_BONUS
      )
      SELECT [MASTER].POSITION
      ,SUM(HEADER.PWC_GROSS_AMOUNT) AS EMPLOYEE_GROSS_PAY
      ,SUM(HEADER.DEDUCTIONS_BEFORE_TAX) AS EMPLOYEE_PAY_DEDUCTION_PRE_TAX
      ,SUM(HEADER.DEDUCTIONS_AFTER_TAX) AS EMPLOYEE_PAY_DEDUCTION_POST_TAX
      ,SUM(HEADER.PWC_NET_AMOUNT) AS EMPLOYEE_NET_PAY
      ,SUM(HEADER.ADDITIONS_BEFORE_TAX) AS EMPLOYEE_PAY_BONUS
      FROM [dbo].[PREP_PAYSLIPS_HEADER] AS HEADER
      LEFT JOIN
      [dbo].[PREP_EMP_MASTER] AS [MASTER]
      ON HEADER.EMPLOYEE_ID = [MASTER].EMPLOYEE_ID
      GROUP BY [MASTER].POSITION
      
      
      /**************************************************************************************************************************************
      04. INSERT DATA INTO [DBO].[RES_TOTAL_LEVEL_SUMMARY] USING EMPLOYEE MASTER INFORMATION
      **************************************************************************************************************************************/
      
      UPDATE [DBO].[RES_POSITION_LEVEL_SUMMARY]
      SET EMPLOYEE_OPENING_HEADCOUNT = NT.EMPLOYEE_OPENING_HEADCOUNT
      ,EMPLOYEE_CLOSING_HEADCOUNT = NT.EMPLOYEE_CLOSING_HEADCOUNT
      FROM [DBO].[RES_POSITION_LEVEL_SUMMARY] AS SUMM
      LEFT JOIN
      (
      SELECT POSITION AS EMPLOYEE_POSITION
      ,SUM(PWC_BEGINNING_ACTIVE_EMPLOYEE) AS EMPLOYEE_OPENING_HEADCOUNT
      ,SUM(PWC_ENDING_ACTIVE_EMPLOYEE) AS EMPLOYEE_CLOSING_HEADCOUNT
      FROM [dbo].[PREP_EMP_MASTER]
      GROUP BY POSITION
      ) AS NT
      ON NT.EMPLOYEE_POSITION = SUMM.EMPLOYEE_POSITION
      
      /**************************************************************************************************************************************
      05. INSERT DATA INTO [DBO].[RES_TOTAL_LEVEL_SUMMARY] FOR EMPLOYEE_AVERAGE_HEADCOUNT
      **************************************************************************************************************************************/
      
      UPDATE [DBO].[RES_POSITION_LEVEL_SUMMARY]
      SET EMPLOYEE_AVERAGE_HEADCOUNT = (EMPLOYEE_OPENING_HEADCOUNT + EMPLOYEE_CLOSING_HEADCOUNT) / 2
      FROM [DBO].[RES_POSITION_LEVEL_SUMMARY]
      
      /**************************************************************************************************************************************
      06. INSERT DATA INTO [DBO].[RES_TOTAL_LEVEL_SUMMARY] FOR EMPLOYEE_AVERAGE_MONTHLY_PAY AND EMPLOYEE_OPENING_AVERAGE_PAY
      PLEASE NOTE: IF EMPLOYEE_AVERAGE_HEADCOUNT IS ZERO, THEN THE AVERAGE CALCULATED FIELDS WILL BE NULL
      **************************************************************************************************************************************/
      
      UPDATE [DBO].[RES_POSITION_LEVEL_SUMMARY]
      SET EMPLOYEE_AVERAGE_MONTHLY_PAY =
      CASE WHEN EMPLOYEE_AVERAGE_HEADCOUNT = 0
      THEN NULL
      ELSE ((ISNULL(NT.EMPLOYEE_GROSS_PAY,0) - ISNULL(NT.EMPLOYEE_PAY_BONUS,0)) / EMPLOYEE_AVERAGE_HEADCOUNT) / 12.0000
      END
      ,EMPLOYEE_OPENING_AVERAGE_PAY = 
      CASE WHEN EMPLOYEE_AVERAGE_HEADCOUNT = 0 
      THEN NULL
      ELSE (ISNULL(NT.EMPLOYEE_GROSS_PAY,0) - ISNULL(NT.EMPLOYEE_PAY_BONUS,0)) / NT.PWC_HEAD_COUNT 
      END
      FROM [DBO].[RES_POSITION_LEVEL_SUMMARY] AS SUMM
      LEFT JOIN
      (
      SELECT EMP_POSITION.EMPLOYEE_POSITION
      ,PWC_HEAD_COUNT AS PWC_HEAD_COUNT 
      ,SUM(EMP_POSITION.PWC_GROSS_AMOUNT) AS EMPLOYEE_GROSS_PAY
      ,SUM(EMP_POSITION.ADDITIONS_BEFORE_TAX) AS EMPLOYEE_PAY_BONUS
      FROM (
      SELECT MIN(PAY_PERIOD) AS MIN_PAY_PERIOD
      FROM [dbo].[PREP_PAYSLIPS_HEADER]
      ) AS TEMP  
      LEFT JOIN 
      (	
      SELECT [MASTER].POSITION AS EMPLOYEE_POSITION
      ,MONTH(PAY_PERIOD) AS PAY_MONTH
      ,YEAR(PAY_PERIOD) AS PAY_YEAR
      ,COUNT(DISTINCT HEADER.EMPLOYEE_ID) AS PWC_HEAD_COUNT
      ,SUM(PWC_GROSS_AMOUNT) AS PWC_GROSS_AMOUNT
      ,SUM(ADDITIONS_BEFORE_TAX) AS ADDITIONS_BEFORE_TAX
      FROM [dbo].[PREP_PAYSLIPS_HEADER] AS HEADER
      LEFT JOIN
      [dbo].[PREP_EMP_MASTER] AS [MASTER]
      ON  HEADER.EMPLOYEE_ID = [MASTER].EMPLOYEE_ID
      GROUP BY [MASTER].POSITION
      ,MONTH(PAY_PERIOD)
      ,YEAR(PAY_PERIOD)
      ) AS EMP_POSITION 
      ON EMP_POSITION.PAY_MONTH = MONTH(TEMP.MIN_PAY_PERIOD)
      AND
      EMP_POSITION.PAY_YEAR = YEAR(TEMP.MIN_PAY_PERIOD)
      GROUP BY EMP_POSITION.EMPLOYEE_POSITION
      ,PWC_HEAD_COUNT
      ) AS NT
      ON NT.EMPLOYEE_POSITION = SUMM.EMPLOYEE_POSITION
      
      
      /**************************************************************************************************************************************
      07. INSERT DATA INTO [DBO].[RES_TOTAL_LEVEL_SUMMARY] FOR EMPLOYEE_CLOSING_AVERAGE_PAY
      **************************************************************************************************************************************/
      
      UPDATE [DBO].[RES_POSITION_LEVEL_SUMMARY]
      SET EMPLOYEE_CLOSING_AVERAGE_PAY = 
      CASE WHEN EMPLOYEE_AVERAGE_HEADCOUNT = 0
      THEN NULL
      ELSE (ISNULL(NT.EMPLOYEE_GROSS_PAY,0) - ISNULL(NT.EMPLOYEE_PAY_BONUS,0)) / NT.PWC_HEAD_COUNT 
      END
      FROM [DBO].[RES_POSITION_LEVEL_SUMMARY] AS SUMM
      LEFT JOIN
      (
      SELECT EMP_POSITION.EMPLOYEE_POSITION
      ,PWC_HEAD_COUNT AS PWC_HEAD_COUNT 
      ,SUM(EMP_POSITION.PWC_GROSS_AMOUNT) AS EMPLOYEE_GROSS_PAY
      ,SUM(EMP_POSITION.ADDITIONS_BEFORE_TAX) AS EMPLOYEE_PAY_BONUS
      FROM (
      SELECT MAX(PAY_PERIOD) AS MIN_PAY_PERIOD
      FROM [dbo].[PREP_PAYSLIPS_HEADER]
      ) AS TEMP  
      LEFT JOIN 
      (	
      SELECT [MASTER].POSITION AS EMPLOYEE_POSITION
      ,MONTH(PAY_PERIOD) AS PAY_MONTH
      ,YEAR(PAY_PERIOD) AS PAY_YEAR
      ,COUNT(DISTINCT HEADER.EMPLOYEE_ID) AS PWC_HEAD_COUNT
      ,SUM(PWC_GROSS_AMOUNT) AS PWC_GROSS_AMOUNT
      ,SUM(ADDITIONS_BEFORE_TAX) AS ADDITIONS_BEFORE_TAX
      FROM [dbo].[PREP_PAYSLIPS_HEADER] AS HEADER
      LEFT JOIN
      [dbo].[PREP_EMP_MASTER] AS [MASTER]
      ON  HEADER.EMPLOYEE_ID = [MASTER].EMPLOYEE_ID
      GROUP BY [MASTER].POSITION
      ,MONTH(PAY_PERIOD)
      ,YEAR(PAY_PERIOD)
      ) AS EMP_POSITION 
      ON EMP_POSITION.PAY_MONTH = MONTH(TEMP.MIN_PAY_PERIOD)
      AND
      EMP_POSITION.PAY_YEAR = YEAR(TEMP.MIN_PAY_PERIOD)
      GROUP BY EMP_POSITION.EMPLOYEE_POSITION
      ,PWC_HEAD_COUNT
      ) AS NT
      ON NT.EMPLOYEE_POSITION = SUMM.EMPLOYEE_POSITION
      USE [z'9bbaf92f-d960-4e33-a9cd-228c72cc97ef]
      GO
      /****** Object:  StoredProcedure [dbo].[44.BLD_VAL_MASTER]    Script Date: 4/10/2018 10:57:20 AM ******/
      SET ANSI_NULLS ON
      GO
      SET QUOTED_IDENTIFIER ON
      GO
      ALTER PROC [dbo].[44.BLD_VAL_MASTER]
      AS
      
      /*************************************************************************************************************
      *                           DATA ASSURANCE                                                                   *
      **************************************************************************************************************
      UPDATES            - Version 0.1 {10/08/2015} {Fei li} - {Creates basic script for data validation}
      
      SCRIPT DESCRIPTION - {Creates data validation script }
      
      TABLE INFORMATION
      INPUT TABLE(S)
      - [PREP_EMP_MASTER]
      - [PREP_EMP_ADDRESS]
      - [PREP_EMP_BANK_ACCOUNT]
      - [PREP_EMP_NUMBER]
      - [PREP_PAYSLIPS_HEADER]
      - [PREP_PAYSLIPS_DETAILS]
      - [PREP_BANK_EFT]
      
      OUTPUT TABLE(S)
      - [DBO].[REF_VAL_MASTER]
      
      SUMMARY OF SCRIPT  - 01. TRUNCATE TABLE
      - 02. PREP CTE TABLES
      - 03. INSERT DATA
      - 04. CREATE INDEX ON TABLE
      
      **************************************************************************************************************
      01. TRUNCATE TABLE
      *************************************************************************************************************/
      
      TRUNCATE TABLE REF_VAL_MASTER
      
      /**************************************************************************************************************
      02. PREP CTE TABLES
      *************************************************************************************************************/
      
      ;WITH CTE_UNION
      AS
      (
      SELECT  DISTINCT(EMPLOYEE_ID)
      FROM	DBO.PREP_EMP_MASTER
      
      UNION
      
      SELECT  DISTINCT(EMPLOYEE_ID)
      FROM	DBO.PREP_EMP_ADDRESS
      
      UNION
      
      SELECT  DISTINCT(EMPLOYEE_ID)
      FROM	DBO.PREP_EMP_BANK_ACCOUNT
      
      UNION
      
      SELECT  DISTINCT(EMPLOYEE_ID)
      FROM	DBO.PREP_EMP_NUMBER
      
      UNION
      
      SELECT DISTINCT(EMPLOYEE_ID)
      FROM DBO.PREP_PAYSLIPS_HEADER
      
      UNION
      
      SELECT DISTINCT(EMPLOYEE_ID)
      FROM DBO.PREP_PAYSLIPS_DETAILS
      
      UNION
      
      SELECT DISTINCT(EMPLOYEE_ID)
      FROM DBO.PREP_BANK_EFT
      )
      
      ,CTE_MASTER AS
      ( 
      SELECT		CTE_UNION.[EMPLOYEE_ID],
      COUNT(EMP_MAS.EMPLOYEE_ID) AS N_MASTER,
      EMP_MAS.PWC_TERMINATED AS T_FLAG
      FROM		
      CTE_UNION CTE_UNION
      LEFT JOIN 
      DBO.PREP_EMP_MASTER EMP_MAS
      ON 
      CTE_UNION.EMPLOYEE_ID=EMP_MAS.EMPLOYEE_ID
      GROUP BY 
      CTE_UNION.EMPLOYEE_ID,EMP_MAS.PWC_TERMINATED
      )
      
      ,CTE_ADDRESS AS
      ( 
      SELECT		CTE_UNION.EMPLOYEE_ID,
      COUNT(EMP_ADD.EMPLOYEE_ID) AS N_ADDRESS
      FROM		
      CTE_UNION CTE_UNION
      LEFT JOIN 
      DBO.PREP_EMP_ADDRESS EMP_ADD
      ON 
      CTE_UNION.EMPLOYEE_ID=EMP_ADD.EMPLOYEE_ID
      GROUP BY 
      CTE_UNION.EMPLOYEE_ID	
      )
      
      ,CTE_BANK AS
      ( 
      SELECT		CTE_UNION.EMPLOYEE_ID,
      COUNT(EMP_BAK.EMPLOYEE_ID) AS N_BANK
      FROM		
      CTE_UNION CTE_UNION
      LEFT JOIN 
      DBO.PREP_EMP_BANK_ACCOUNT EMP_BAK
      ON 
      CTE_UNION.EMPLOYEE_ID=EMP_BAK.EMPLOYEE_ID
      GROUP BY 
      CTE_UNION.EMPLOYEE_ID
      )
      
      ,CTE_CONTACT AS
      ( 
      SELECT		CTE_UNION.EMPLOYEE_ID,
      COUNT(EMP_NUM.EMPLOYEE_ID) AS N_CONTACT
      FROM		
      CTE_UNION CTE_UNION
      LEFT JOIN 
      DBO.PREP_EMP_NUMBER EMP_NUM
      ON 
      CTE_UNION.EMPLOYEE_ID=EMP_NUM.EMPLOYEE_ID
      GROUP BY 
      CTE_UNION.EMPLOYEE_ID	
      )
      ,CTE_HEADER AS
      ( 
      SELECT		CTE_UNION.EMPLOYEE_ID,
      COUNT(HEADER.EMPLOYEE_ID) AS N_HEADER,
      SUM(HEADER.NET) AS NET_HEADER,
      SUM(HEADER.BASE_VALUE) AS BASE_HEADER,
      COUNT(DISTINCT HEADER.PAYSLIP_ID) AS N_PAYSLIP_HEADER
      
      FROM		
      CTE_UNION CTE_UNION
      LEFT JOIN 
      DBO.PREP_PAYSLIPS_HEADER HEADER
      ON 
      CTE_UNION.EMPLOYEE_ID=HEADER.EMPLOYEE_ID
      GROUP BY 
      CTE_UNION.EMPLOYEE_ID	
      )
      ,CTE_DETAIL AS
      ( 
      SELECT		CTE_UNION.EMPLOYEE_ID,
      COUNT(DETAIL.EMPLOYEE_ID) AS N_DETAIL,
      SUM(CASE WHEN DETAIL.PAY_TYPE='REGULAR_HOURS' OR DETAIL.PAY_TYPE='Base value' THEN DETAIL.AMOUNT ELSE 0 END) AS BASE_DETAIL,
      COUNT(DISTINCT DETAIL.PAYSLIP_ID) AS N_PAYSLIP_DETAIL
      FROM		
      CTE_UNION CTE_UNION
      LEFT JOIN 
      DBO.PREP_PAYSLIPS_DETAILS DETAIL 
      ON 
      CTE_UNION.EMPLOYEE_ID=DETAIL.EMPLOYEE_ID
      GROUP BY 
      CTE_UNION.EMPLOYEE_ID	
      )
      
      ,CTE_EFT AS
      ( 
      SELECT		CTE_UNION.EMPLOYEE_ID,
      COUNT(EFT.EMPLOYEE_ID) AS N_EFT,
      SUM(EFT.AMOUNT) AS NET_EFT
      FROM		
      CTE_UNION CTE_UNION
      LEFT JOIN 
      DBO.PREP_BANK_EFT EFT
      ON 
      CTE_UNION.EMPLOYEE_ID=EFT.EMPLOYEE_ID
      GROUP BY 
      CTE_UNION.EMPLOYEE_ID	
      )
      
      /**************************************************************************************************************
      03. INSERT DATA
      *************************************************************************************************************/
      
      INSERT INTO  DBO.REF_VAL_MASTER
      (
      EMPLOYEE_ID 
      ,VAL_N_MASTER 
      ,VAL_N_ADDRESS 
      ,VAL_N_BANK
      ,VAL_N_CONTACT
      ,VAL_N_EFT 
      ,VAL_N_HEADER 
      ,VAL_N_DETAIL 
      ,VAL_N_PAYSLIP_HEADER
      ,VAL_N_PAYSLIP_DETAIL
      ,VAL_NET_EFT
      ,VAL_NET_HEADER
      ,VAL_BASE_HEADER
      ,VAL_BASE_DETAIL
      ,VAL_T_FLAG 
      )
      SELECT		CTE_UNION.EMPLOYEE_ID,
      N_MASTER,
      N_ADDRESS,
      N_BANK,
      N_CONTACT,
      N_EFT,
      N_HEADER,
      N_DETAIL,
      N_PAYSLIP_HEADER,
      N_PAYSLIP_DETAIL,
      NET_EFT,
      NET_HEADER,
      BASE_HEADER,
      BASE_DETAIL,
      T_FLAG
      FROM 
      CTE_UNION
      LEFT JOIN 
      CTE_MASTER
      ON 
      CTE_UNION.EMPLOYEE_ID=CTE_MASTER.EMPLOYEE_ID
      LEFT JOIN 
      CTE_ADDRESS
      ON
      CTE_UNION.EMPLOYEE_ID=CTE_ADDRESS.EMPLOYEE_ID
      LEFT JOIN 
      CTE_BANK
      ON 
      CTE_UNION.EMPLOYEE_ID=CTE_BANK.EMPLOYEE_ID
      LEFT JOIN 
      CTE_CONTACT
      ON
      CTE_UNION.EMPLOYEE_ID=CTE_CONTACT.EMPLOYEE_ID
      LEFT JOIN 
      CTE_HEADER
      ON
      CTE_UNION.EMPLOYEE_ID=CTE_HEADER.EMPLOYEE_ID
      LEFT JOIN 
      CTE_DETAIL
      ON
      CTE_UNION.EMPLOYEE_ID=CTE_DETAIL.EMPLOYEE_ID
      LEFT JOIN 
      CTE_EFT
      ON
      CTE_UNION.EMPLOYEE_ID=CTE_EFT.EMPLOYEE_ID
      
      /**************************************************************************************************************
      04. CREATE INDEX ON TABLE
      *************************************************************************************************************/ 
      
      CREATE INDEX [ID_EMPLOYEE_ID]
      ON [REF_VAL_MASTER] (
      EMPLOYEE_ID
      )
      
      CREATE INDEX [ID_N_MASTER]
      ON [REF_VAL_MASTER] (
      VAL_N_MASTER
      )
      
      CREATE INDEX [ID_N_ADDRESS]
      ON [REF_VAL_MASTER] (
      VAL_N_ADDRESS
      )
      
      CREATE INDEX [ID_N_BANK]
      ON [REF_VAL_MASTER] (
      VAL_N_BANK
      )
      
      CREATE INDEX [ID_N_CONTACT]
      ON [REF_VAL_MASTER] (
      VAL_N_CONTACT
      )
      
      CREATE INDEX [ID_N_EFT]
      ON [REF_VAL_MASTER] (
      VAL_N_EFT
      )
      
      CREATE INDEX [ID_N_HEADER]
      ON [REF_VAL_MASTER] (
      VAL_N_HEADER
      )
      
      CREATE INDEX [ID_N_DETAIL]
      ON [REF_VAL_MASTER] (
      VAL_N_DETAIL
      )
      
      CREATE INDEX [ID_N_PAYSLIP_HEADER]
      ON [REF_VAL_MASTER] (
      VAL_N_PAYSLIP_HEADER
      )
      
      CREATE INDEX [ID_N_PAYSLIP_DETAIL]
      ON [REF_VAL_MASTER] (
      VAL_N_PAYSLIP_DETAIL
      )
      
      CREATE INDEX [ID_NET_EFT]
      ON [REF_VAL_MASTER] (
      VAL_NET_EFT
      )
      
      CREATE INDEX [ID_NET_HEADER]
      ON [REF_VAL_MASTER] (
      VAL_NET_HEADER
      )
      
      CREATE INDEX [ID_BASE_HEADER]
      ON [REF_VAL_MASTER] (
      VAL_BASE_HEADER
      )
      
      CREATE INDEX [ID_BASE_DETAIL]
      ON [REF_VAL_MASTER] (
      VAL_BASE_DETAIL
      )
      
      CREATE INDEX [ID_T_FLAG]
      ON [REF_VAL_MASTER] (
      VAL_T_FLAG
      )USE [z'9bbaf92f-d960-4e33-a9cd-228c72cc97ef]
GO
      /****** Object:  StoredProcedure [dbo].[45.BLD_TEST_FIELD]    Script Date: 4/10/2018 10:57:46 AM ******/
      SET ANSI_NULLS ON
      GO
      SET QUOTED_IDENTIFIER ON
      GO
      ALTER PROC [dbo].[45.BLD_TEST_FIELD]
      AS
      
      /*************************************************************************************************************
      *                           DATA ASSURANCE                                                                   *
      **************************************************************************************************************
      UPDATES            - Version 0.1 {13/08/2015} {Fei li} - {Creates basic script for test fields}
      - Version 0.2 {17/02/2016} {Fei li} - {Updated test fields for PAY_09 to refelct change of invalid BSB test at bank detail level}
      
      
      SCRIPT DESCRIPTION - {Creates data validation script }
      
      TABLE INFORMATION
      INPUT TABLE(S)
      - 
      
      OUTPUT TABLE(S)
      - [DBO].[REF_TEST_FIELD]
      
      SUMMARY OF SCRIPT  - 01. TRUNCATE TABLE
      - 02. INSERT DATA
      - 03. CREATE INDEX ON TABLE
      
      **************************************************************************************************************
      01. TRUNCATE TABLE
      *************************************************************************************************************/
      
      TRUNCATE TABLE REF_TEST_FIELD
      
      
      /**************************************************************************************************************
      02. INSERT DATA
      *************************************************************************************************************/
      
      INSERT INTO dbo.[REF_TEST_FIELD]([TEST_ID],[CDM_TABLE_NAME],[CDM_COLUMN_NAME]) VALUES('USR_PAY_05','PREP_EMP_MASTER','EMPLOYEE_ID')
      INSERT INTO dbo.[REF_TEST_FIELD]([TEST_ID],[CDM_TABLE_NAME],[CDM_COLUMN_NAME]) VALUES('USR_PAY_05','PREP_EMP_MASTER','SYSTEM_NAME')
      INSERT INTO dbo.[REF_TEST_FIELD]([TEST_ID],[CDM_TABLE_NAME],[CDM_COLUMN_NAME]) VALUES('USR_PAY_05','PREP_EMP_MASTER','START_DATE')
      INSERT INTO dbo.[REF_TEST_FIELD]([TEST_ID],[CDM_TABLE_NAME],[CDM_COLUMN_NAME]) VALUES('USR_PAY_05','PREP_EMP_MASTER','PWC_TERMINATION_DATE')
      INSERT INTO dbo.[REF_TEST_FIELD]([TEST_ID],[CDM_TABLE_NAME],[CDM_COLUMN_NAME]) VALUES('USR_PAY_12','PREP_PAYSLIPS_HEADER','PAYSLIP_ID')
      INSERT INTO dbo.[REF_TEST_FIELD]([TEST_ID],[CDM_TABLE_NAME],[CDM_COLUMN_NAME]) VALUES('USR_PAY_12','PREP_PAYSLIPS_HEADER','PAYMENT_DATE')
      INSERT INTO dbo.[REF_TEST_FIELD]([TEST_ID],[CDM_TABLE_NAME],[CDM_COLUMN_NAME]) VALUES('USR_PAY_12','PREP_EMP_MASTER','EMPLOYEE_ID')
      INSERT INTO dbo.[REF_TEST_FIELD]([TEST_ID],[CDM_TABLE_NAME],[CDM_COLUMN_NAME]) VALUES('USR_PAY_12','PREP_EMP_MASTER','STATUS')
      INSERT INTO dbo.[REF_TEST_FIELD]([TEST_ID],[CDM_TABLE_NAME],[CDM_COLUMN_NAME]) VALUES('USR_PAY_12','PREP_EMP_MASTER','SYSTEM_NAME')
      INSERT INTO dbo.[REF_TEST_FIELD]([TEST_ID],[CDM_TABLE_NAME],[CDM_COLUMN_NAME]) VALUES('USR_PAY_12','PREP_EMP_MASTER','PWC_TERMINATION_DATE')
      INSERT INTO dbo.[REF_TEST_FIELD]([TEST_ID],[CDM_TABLE_NAME],[CDM_COLUMN_NAME]) VALUES('USR_PAY_14','PREP_PAYSLIPS_HEADER','PAYSLIP_ID')
      INSERT INTO dbo.[REF_TEST_FIELD]([TEST_ID],[CDM_TABLE_NAME],[CDM_COLUMN_NAME]) VALUES('USR_PAY_14','PREP_PAYSLIPS_HEADER','SYSTEM_NAME')
      INSERT INTO dbo.[REF_TEST_FIELD]([TEST_ID],[CDM_TABLE_NAME],[CDM_COLUMN_NAME]) VALUES('USR_PAY_14','PREP_PAYSLIPS_HEADER','EMPLOYEE_ID')
      INSERT INTO dbo.[REF_TEST_FIELD]([TEST_ID],[CDM_TABLE_NAME],[CDM_COLUMN_NAME]) VALUES('USR_PAY_03','PREP_EMP_MASTER','EMPLOYEE_ID')
      INSERT INTO dbo.[REF_TEST_FIELD]([TEST_ID],[CDM_TABLE_NAME],[CDM_COLUMN_NAME]) VALUES('USR_PAY_03','PREP_EMP_MASTER','SYSTEM_NAME')
      INSERT INTO dbo.[REF_TEST_FIELD]([TEST_ID],[CDM_TABLE_NAME],[CDM_COLUMN_NAME]) VALUES('USR_PAY_03','PREP_EMP_ADDRESS','EMPLOYEE_ID')
      INSERT INTO dbo.[REF_TEST_FIELD]([TEST_ID],[CDM_TABLE_NAME],[CDM_COLUMN_NAME]) VALUES('USR_PAY_03','PREP_EMP_ADDRESS','SYSTEM_NAME')
      INSERT INTO dbo.[REF_TEST_FIELD]([TEST_ID],[CDM_TABLE_NAME],[CDM_COLUMN_NAME]) VALUES('USR_PAY_06','PREP_PAYSLIPS_HEADER','SYSTEM_NAME')
      INSERT INTO dbo.[REF_TEST_FIELD]([TEST_ID],[CDM_TABLE_NAME],[CDM_COLUMN_NAME]) VALUES('USR_PAY_06','PREP_PAYSLIPS_HEADER','EMPLOYEE_ID')
      INSERT INTO dbo.[REF_TEST_FIELD]([TEST_ID],[CDM_TABLE_NAME],[CDM_COLUMN_NAME]) VALUES('USR_PAY_06','PREP_EMP_MASTER','EMPLOYEE_ID')
      INSERT INTO dbo.[REF_TEST_FIELD]([TEST_ID],[CDM_TABLE_NAME],[CDM_COLUMN_NAME]) VALUES('USR_PAY_06','PREP_EMP_MASTER','SYSTEM_NAME')
      INSERT INTO dbo.[REF_TEST_FIELD]([TEST_ID],[CDM_TABLE_NAME],[CDM_COLUMN_NAME]) VALUES('USR_PAY_06','PREP_EMP_MASTER','PWC_TERMINATED_FLAG')
      INSERT INTO dbo.[REF_TEST_FIELD]([TEST_ID],[CDM_TABLE_NAME],[CDM_COLUMN_NAME]) VALUES('USR_PAY_16','PREP_PAYSLIPS_HEADER','PAYSLIP_ID')
      INSERT INTO dbo.[REF_TEST_FIELD]([TEST_ID],[CDM_TABLE_NAME],[CDM_COLUMN_NAME]) VALUES('USR_PAY_16','PREP_PAYSLIPS_HEADER','EMPLOYEE_ID')
      INSERT INTO dbo.[REF_TEST_FIELD]([TEST_ID],[CDM_TABLE_NAME],[CDM_COLUMN_NAME]) VALUES('USR_PAY_16','PREP_EMP_MASTER','EMPLOYEE_ID')
      INSERT INTO dbo.[REF_TEST_FIELD]([TEST_ID],[CDM_TABLE_NAME],[CDM_COLUMN_NAME]) VALUES('USR_PAY_11','PREP_EMP_POSITION_HISTORY','EMPLOYEE_ID')
      INSERT INTO dbo.[REF_TEST_FIELD]([TEST_ID],[CDM_TABLE_NAME],[CDM_COLUMN_NAME]) VALUES('USR_PAY_11','PREP_EMP_POSITION_HISTORY','JOB_ID')
      INSERT INTO dbo.[REF_TEST_FIELD]([TEST_ID],[CDM_TABLE_NAME],[CDM_COLUMN_NAME]) VALUES('USR_PAY_11','PREP_EMP_POSITION_HISTORY','SYSTEM_NAME')
      INSERT INTO dbo.[REF_TEST_FIELD]([TEST_ID],[CDM_TABLE_NAME],[CDM_COLUMN_NAME]) VALUES('USR_PAY_11','PREP_EMP_POSITION_HISTORY','PWC_EARLIEST_POSITION_START_DATE')
      INSERT INTO dbo.[REF_TEST_FIELD]([TEST_ID],[CDM_TABLE_NAME],[CDM_COLUMN_NAME]) VALUES('USR_PAY_11','PREP_EMP_POSITION_HISTORY','PWC_LATEST_POSITION_END_DATE')
      INSERT INTO dbo.[REF_TEST_FIELD]([TEST_ID],[CDM_TABLE_NAME],[CDM_COLUMN_NAME]) VALUES('USR_PAY_15','PREP_PAYSLIPS_HEADER','PAYSLIP_ID')
      INSERT INTO dbo.[REF_TEST_FIELD]([TEST_ID],[CDM_TABLE_NAME],[CDM_COLUMN_NAME]) VALUES('USR_PAY_15','PREP_PAYSLIPS_HEADER','BASE_VALUE')
      INSERT INTO dbo.[REF_TEST_FIELD]([TEST_ID],[CDM_TABLE_NAME],[CDM_COLUMN_NAME]) VALUES('USR_PAY_15','PREP_PAYSLIPS_HEADER','OVERTIME_VALUE')
      INSERT INTO dbo.[REF_TEST_FIELD]([TEST_ID],[CDM_TABLE_NAME],[CDM_COLUMN_NAME]) VALUES('USR_PAY_EFT','PREP_PAYSLIPS_HEADER','EMPLOYEE_ID')
      INSERT INTO dbo.[REF_TEST_FIELD]([TEST_ID],[CDM_TABLE_NAME],[CDM_COLUMN_NAME]) VALUES('USR_PAY_EFT','PREP_PAYSLIPS_HEADER','PAYMENT_DATE')
      INSERT INTO dbo.[REF_TEST_FIELD]([TEST_ID],[CDM_TABLE_NAME],[CDM_COLUMN_NAME]) VALUES('USR_PAY_EFT','PREP_PAYSLIPS_HEADER','SYSTEM_NAME')
      INSERT INTO dbo.[REF_TEST_FIELD]([TEST_ID],[CDM_TABLE_NAME],[CDM_COLUMN_NAME]) VALUES('USR_PAY_EFT','PREP_PAYSLIPS_HEADER','PAYSLIP_ID')
      INSERT INTO dbo.[REF_TEST_FIELD]([TEST_ID],[CDM_TABLE_NAME],[CDM_COLUMN_NAME]) VALUES('USR_PAY_EFT','PREP_PAYSLIPS_HEADER','PWC_NET_AMOUNT')
      INSERT INTO dbo.[REF_TEST_FIELD]([TEST_ID],[CDM_TABLE_NAME],[CDM_COLUMN_NAME]) VALUES('USR_PAY_EFT','PREP_PAYSLIPS_HEADER','PAY_PERIOD')
      INSERT INTO dbo.[REF_TEST_FIELD]([TEST_ID],[CDM_TABLE_NAME],[CDM_COLUMN_NAME]) VALUES('USR_PAY_EFT','PREP_BANK_EFT','EMPLOYEE_ID')
      INSERT INTO dbo.[REF_TEST_FIELD]([TEST_ID],[CDM_TABLE_NAME],[CDM_COLUMN_NAME]) VALUES('USR_PAY_EFT','PREP_BANK_EFT','PAYPERNO')
      INSERT INTO dbo.[REF_TEST_FIELD]([TEST_ID],[CDM_TABLE_NAME],[CDM_COLUMN_NAME]) VALUES('USR_PAY_EFT','PREP_BANK_EFT','PAYPERYR')
      INSERT INTO dbo.[REF_TEST_FIELD]([TEST_ID],[CDM_TABLE_NAME],[CDM_COLUMN_NAME]) VALUES('USR_PAY_EFT','PREP_BANK_EFT','DISBURSE_DATE')
      INSERT INTO dbo.[REF_TEST_FIELD]([TEST_ID],[CDM_TABLE_NAME],[CDM_COLUMN_NAME]) VALUES('USR_PAY_EFT','PREP_BANK_EFT','NETPAY')
      INSERT INTO dbo.[REF_TEST_FIELD]([TEST_ID],[CDM_TABLE_NAME],[CDM_COLUMN_NAME]) VALUES('USR_PAY_EFT','PREP_BANK_EFT','SYSTEM_NAME')
      INSERT INTO dbo.[REF_TEST_FIELD]([TEST_ID],[CDM_TABLE_NAME],[CDM_COLUMN_NAME]) VALUES('USR_PAY_EFT','PREP_BANK_EFT','CHEQUE_DATE')
      INSERT INTO dbo.[REF_TEST_FIELD]([TEST_ID],[CDM_TABLE_NAME],[CDM_COLUMN_NAME]) VALUES('USR_PAY_17','PREP_PAYSLIPS_DETAILS','EMPLOYEE_ID')
      INSERT INTO dbo.[REF_TEST_FIELD]([TEST_ID],[CDM_TABLE_NAME],[CDM_COLUMN_NAME]) VALUES('USR_PAY_17','PREP_PAYSLIPS_DETAILS','PAY_PERIOD')
      INSERT INTO dbo.[REF_TEST_FIELD]([TEST_ID],[CDM_TABLE_NAME],[CDM_COLUMN_NAME]) VALUES('USR_PAY_17','PREP_PAYSLIPS_DETAILS','PAYSLIP_ID')
      INSERT INTO dbo.[REF_TEST_FIELD]([TEST_ID],[CDM_TABLE_NAME],[CDM_COLUMN_NAME]) VALUES('USR_PAY_17','PREP_PAYSLIPS_DETAILS','EMPLOYEE_ID')
      INSERT INTO dbo.[REF_TEST_FIELD]([TEST_ID],[CDM_TABLE_NAME],[CDM_COLUMN_NAME]) VALUES('USR_PAY_17','PREP_PAYSLIPS_DETAILS','DESCRIPTION')
      INSERT INTO dbo.[REF_TEST_FIELD]([TEST_ID],[CDM_TABLE_NAME],[CDM_COLUMN_NAME]) VALUES('USR_PAY_20','PREP_PAYSLIPS_HEADER','PAYSLIP_ID')
      INSERT INTO dbo.[REF_TEST_FIELD]([TEST_ID],[CDM_TABLE_NAME],[CDM_COLUMN_NAME]) VALUES('USR_PAY_20','PREP_PAYSLIPS_HEADER','PAYMENT_DATE')
      INSERT INTO dbo.[REF_TEST_FIELD]([TEST_ID],[CDM_TABLE_NAME],[CDM_COLUMN_NAME]) VALUES('USR_PAY_21','PREP_PAYSLIPS_HEADER','PAYSLIP_ID')
      INSERT INTO dbo.[REF_TEST_FIELD]([TEST_ID],[CDM_TABLE_NAME],[CDM_COLUMN_NAME]) VALUES('USR_PAY_21','PREP_PAYSLIPS_HEADER','PAYMENT_DATE')
      INSERT INTO dbo.[REF_TEST_FIELD]([TEST_ID],[CDM_TABLE_NAME],[CDM_COLUMN_NAME]) VALUES('USR_PAY_21','PREP_BANK_EFT','DISBURSE_DATE')
      INSERT INTO dbo.[REF_TEST_FIELD]([TEST_ID],[CDM_TABLE_NAME],[CDM_COLUMN_NAME]) VALUES('USR_PAY_08','PREP_EMP_MASTER','EMPLOYEE_ID')
      INSERT INTO dbo.[REF_TEST_FIELD]([TEST_ID],[CDM_TABLE_NAME],[CDM_COLUMN_NAME]) VALUES('USR_PAY_08','PREP_EMP_MASTER','SYSTEM_NAME')
      INSERT INTO dbo.[REF_TEST_FIELD]([TEST_ID],[CDM_TABLE_NAME],[CDM_COLUMN_NAME]) VALUES('USR_PAY_08','PREP_EMP_MASTER','PWC_EMPLOYEE_NAME')
      INSERT INTO dbo.[REF_TEST_FIELD]([TEST_ID],[CDM_TABLE_NAME],[CDM_COLUMN_NAME]) VALUES('USR_PAY_01','PREP_EMP_BANK_ACCOUNT','EMPLOYEE_ID')
      INSERT INTO dbo.[REF_TEST_FIELD]([TEST_ID],[CDM_TABLE_NAME],[CDM_COLUMN_NAME]) VALUES('USR_PAY_01','PREP_EMP_BANK_ACCOUNT','PWC_BSB_NUMBER')
      INSERT INTO dbo.[REF_TEST_FIELD]([TEST_ID],[CDM_TABLE_NAME],[CDM_COLUMN_NAME]) VALUES('USR_PAY_01','PREP_EMP_BANK_ACCOUNT','PWC_ACCOUNT_NUMBER')
      INSERT INTO dbo.[REF_TEST_FIELD]([TEST_ID],[CDM_TABLE_NAME],[CDM_COLUMN_NAME]) VALUES('USR_PAY_01','PREP_EMP_BANK_ACCOUNT','SYSTEM_NAME')
      INSERT INTO dbo.[REF_TEST_FIELD]([TEST_ID],[CDM_TABLE_NAME],[CDM_COLUMN_NAME]) VALUES('USR_PAY_01','PREP_EMP_NUMBER','EMPLOYEE_ID')
      INSERT INTO dbo.[REF_TEST_FIELD]([TEST_ID],[CDM_TABLE_NAME],[CDM_COLUMN_NAME]) VALUES('USR_PAY_01','PREP_EMP_NUMBER','PWC_CONTACT_NUMBER')
      INSERT INTO dbo.[REF_TEST_FIELD]([TEST_ID],[CDM_TABLE_NAME],[CDM_COLUMN_NAME]) VALUES('USR_PAY_01','PREP_EMP_NUMBER','SYSTEM_NAME')
      INSERT INTO dbo.[REF_TEST_FIELD]([TEST_ID],[CDM_TABLE_NAME],[CDM_COLUMN_NAME]) VALUES('USR_PAY_01','PREP_EMP_ADDRESS','EMPLOYEE_ID')
      INSERT INTO dbo.[REF_TEST_FIELD]([TEST_ID],[CDM_TABLE_NAME],[CDM_COLUMN_NAME]) VALUES('USR_PAY_01','PREP_EMP_ADDRESS','PWC_TOTAL_ADDRESS')
      INSERT INTO dbo.[REF_TEST_FIELD]([TEST_ID],[CDM_TABLE_NAME],[CDM_COLUMN_NAME]) VALUES('USR_PAY_01','PREP_EMP_ADDRESS','SYSTEM_NAME')
      INSERT INTO dbo.[REF_TEST_FIELD]([TEST_ID],[CDM_TABLE_NAME],[CDM_COLUMN_NAME]) VALUES('USR_PAY_01','PREP_EMP_MASTER','EMPLOYEE_ID')
      INSERT INTO dbo.[REF_TEST_FIELD]([TEST_ID],[CDM_TABLE_NAME],[CDM_COLUMN_NAME]) VALUES('USR_PAY_01','PREP_EMP_MASTER','SYSTEM_NAME')
      INSERT INTO dbo.[REF_TEST_FIELD]([TEST_ID],[CDM_TABLE_NAME],[CDM_COLUMN_NAME]) VALUES('USR_PAY_01','PREP_EMP_MASTER','PWC_EMPLOYEE_NAME')
      INSERT INTO dbo.[REF_TEST_FIELD]([TEST_ID],[CDM_TABLE_NAME],[CDM_COLUMN_NAME]) VALUES('USR_PAY_09','PREP_BANK_EFT','EMPLOYEE_ID')
      INSERT INTO dbo.[REF_TEST_FIELD]([TEST_ID],[CDM_TABLE_NAME],[CDM_COLUMN_NAME]) VALUES('USR_PAY_09','PREP_BANK_EFT','SYSTEM_NAME')
      INSERT INTO dbo.[REF_TEST_FIELD]([TEST_ID],[CDM_TABLE_NAME],[CDM_COLUMN_NAME]) VALUES('USR_PAY_09','PREP_BANK_EFT','BSB_NUMBER')
      INSERT INTO dbo.[REF_TEST_FIELD]([TEST_ID],[CDM_TABLE_NAME],[CDM_COLUMN_NAME]) VALUES('USR_PAY_22','PREP_PAYSLIPS_DETAILS','EMPLOYEE_ID')
      INSERT INTO dbo.[REF_TEST_FIELD]([TEST_ID],[CDM_TABLE_NAME],[CDM_COLUMN_NAME]) VALUES('USR_PAY_22','PREP_PAYSLIPS_DETAILS','JOB_ID')
      INSERT INTO dbo.[REF_TEST_FIELD]([TEST_ID],[CDM_TABLE_NAME],[CDM_COLUMN_NAME]) VALUES('USR_PAY_22','PREP_PAYSLIPS_DETAILS','PAYSLIP_ID')
      INSERT INTO dbo.[REF_TEST_FIELD]([TEST_ID],[CDM_TABLE_NAME],[CDM_COLUMN_NAME]) VALUES('USR_PAY_22','PREP_PAYSLIPS_DETAILS','PAYCODE_ID')
      INSERT INTO dbo.[REF_TEST_FIELD]([TEST_ID],[CDM_TABLE_NAME],[CDM_COLUMN_NAME]) VALUES('USR_PAY_22','PREP_PAYSLIPS_DETAILS','PAYCODE_DESC')
      INSERT INTO dbo.[REF_TEST_FIELD]([TEST_ID],[CDM_TABLE_NAME],[CDM_COLUMN_NAME]) VALUES('USR_PAY_22','PREP_PAYSLIPS_DETAILS','START_DATE')
      INSERT INTO dbo.[REF_TEST_FIELD]([TEST_ID],[CDM_TABLE_NAME],[CDM_COLUMN_NAME]) VALUES('USR_PAY_22','PREP_PAYSLIPS_DETAILS','END_DATE')
      INSERT INTO dbo.[REF_TEST_FIELD]([TEST_ID],[CDM_TABLE_NAME],[CDM_COLUMN_NAME]) VALUES('USR_PAY_22','PREP_PAYSLIPS_DETAILS','HOURS')
      INSERT INTO dbo.[REF_TEST_FIELD]([TEST_ID],[CDM_TABLE_NAME],[CDM_COLUMN_NAME]) VALUES('USR_PAY_22','PREP_PAYSLIPS_DETAILS','PAYRATE')
      INSERT INTO dbo.[REF_TEST_FIELD]([TEST_ID],[CDM_TABLE_NAME],[CDM_COLUMN_NAME]) VALUES('USR_PAY_22','PREP_PAYSLIPS_DETAILS','AMOUNT')
      INSERT INTO dbo.[REF_TEST_FIELD]([TEST_ID],[CDM_TABLE_NAME],[CDM_COLUMN_NAME]) VALUES('USR_PAY_22','PREP_PAYSLIPS_DETAILS','DESCRIPTION')
      INSERT INTO dbo.[REF_TEST_FIELD]([TEST_ID],[CDM_TABLE_NAME],[CDM_COLUMN_NAME]) VALUES('USR_PAY_25','PREP_PAYSLIPS_HEADER','EMPLOYEE_ID')
      INSERT INTO dbo.[REF_TEST_FIELD]([TEST_ID],[CDM_TABLE_NAME],[CDM_COLUMN_NAME]) VALUES('USR_PAY_25','PREP_EMP_MASTER','START_DATE')
      INSERT INTO dbo.[REF_TEST_FIELD]([TEST_ID],[CDM_TABLE_NAME],[CDM_COLUMN_NAME]) VALUES('USR_PAY_25','PREP_EMP_MASTER','PWC_TERMINATION_DATE')
      INSERT INTO dbo.[REF_TEST_FIELD]([TEST_ID],[CDM_TABLE_NAME],[CDM_COLUMN_NAME]) VALUES('USR_PAY_25','PREP_EMP_MASTER','EMPLOYEE_ID')
      INSERT INTO dbo.[REF_TEST_FIELD]([TEST_ID],[CDM_TABLE_NAME],[CDM_COLUMN_NAME]) VALUES('USR_PAY_30','PREP_PAYSLIPS_HEADER','PAYSLIP_ID')
      INSERT INTO dbo.[REF_TEST_FIELD]([TEST_ID],[CDM_TABLE_NAME],[CDM_COLUMN_NAME]) VALUES('USR_PAY_30','PREP_PAYSLIPS_HEADER','EMPLOYEE_ID')
      INSERT INTO dbo.[REF_TEST_FIELD]([TEST_ID],[CDM_TABLE_NAME],[CDM_COLUMN_NAME]) VALUES('USR_PAY_30','PREP_PAYSLIPS_HEADER','PAYMENT_DATE')
      INSERT INTO dbo.[REF_TEST_FIELD]([TEST_ID],[CDM_TABLE_NAME],[CDM_COLUMN_NAME]) VALUES('USR_PAY_30','PREP_EMP_MASTER','EMPLOYEE_ID')
      INSERT INTO dbo.[REF_TEST_FIELD]([TEST_ID],[CDM_TABLE_NAME],[CDM_COLUMN_NAME]) VALUES('USR_PAY_30','PREP_EMP_MASTER','START_DATE')
      INSERT INTO dbo.[REF_TEST_FIELD]([TEST_ID],[CDM_TABLE_NAME],[CDM_COLUMN_NAME]) VALUES('USR_PAY_07','PREP_EMP_MASTER','EMPLOYEE_ID')
      INSERT INTO dbo.[REF_TEST_FIELD]([TEST_ID],[CDM_TABLE_NAME],[CDM_COLUMN_NAME]) VALUES('USR_PAY_07','PREP_EMP_MASTER','DOB')
      INSERT INTO dbo.[REF_TEST_FIELD]([TEST_ID],[CDM_TABLE_NAME],[CDM_COLUMN_NAME]) VALUES('USR_PAY_10','PREP_EMP_MASTER','EMPLOYEE_ID')
      INSERT INTO dbo.[REF_TEST_FIELD]([TEST_ID],[CDM_TABLE_NAME],[CDM_COLUMN_NAME]) VALUES('USR_PAY_10','PREP_EMP_MASTER','START_DATE')
      INSERT INTO dbo.[REF_TEST_FIELD]([TEST_ID],[CDM_TABLE_NAME],[CDM_COLUMN_NAME]) VALUES('USR_PAY_13','PREP_PAYSLIPS_HEADER','EMPLOYEE_ID')
      INSERT INTO dbo.[REF_TEST_FIELD]([TEST_ID],[CDM_TABLE_NAME],[CDM_COLUMN_NAME]) VALUES('USR_PAY_13','PREP_PAYSLIPS_HEADER','OVERTIME_VALUE')
      INSERT INTO dbo.[REF_TEST_FIELD]([TEST_ID],[CDM_TABLE_NAME],[CDM_COLUMN_NAME]) VALUES('USR_PAY_13','PREP_PAYSLIPS_HEADER','PAY_PERIOD')
      INSERT INTO dbo.[REF_TEST_FIELD]([TEST_ID],[CDM_TABLE_NAME],[CDM_COLUMN_NAME]) VALUES('USR_PAY_13','PREP_PAYSLIPS_HEADER','PAY_RUN_ID')
      INSERT INTO dbo.[REF_TEST_FIELD]([TEST_ID],[CDM_TABLE_NAME],[CDM_COLUMN_NAME]) VALUES('USR_PAY_23','PREP_PAYSLIPS_HEADER','EMPLOYEE_ID')
      INSERT INTO dbo.[REF_TEST_FIELD]([TEST_ID],[CDM_TABLE_NAME],[CDM_COLUMN_NAME]) VALUES('USR_PAY_23','PREP_PAYSLIPS_HEADER','PAYSLIP_ID')
      INSERT INTO dbo.[REF_TEST_FIELD]([TEST_ID],[CDM_TABLE_NAME],[CDM_COLUMN_NAME]) VALUES('USR_PAY_23','PREP_PAYSLIPS_HEADER','BASE_VALUE')
      INSERT INTO dbo.[REF_TEST_FIELD]([TEST_ID],[CDM_TABLE_NAME],[CDM_COLUMN_NAME]) VALUES('USR_PAY_23','PREP_PAYSLIPS_HEADER','PAY_PERIOD')
      INSERT INTO dbo.[REF_TEST_FIELD]([TEST_ID],[CDM_TABLE_NAME],[CDM_COLUMN_NAME]) VALUES('USR_PAY_26','PREP_EMP_MASTER','EMPLOYEE_ID')
      INSERT INTO dbo.[REF_TEST_FIELD]([TEST_ID],[CDM_TABLE_NAME],[CDM_COLUMN_NAME]) VALUES('USR_PAY_26','PREP_EMP_MASTER','GENDER')
      INSERT INTO dbo.[REF_TEST_FIELD]([TEST_ID],[CDM_TABLE_NAME],[CDM_COLUMN_NAME]) VALUES('USR_PAY_31','PREP_EMP_LEAVE_TAKEN','EMPLOYEE_ID')
      INSERT INTO dbo.[REF_TEST_FIELD]([TEST_ID],[CDM_TABLE_NAME],[CDM_COLUMN_NAME]) VALUES('USR_PAY_31','PREP_EMP_LEAVE_TAKEN','LEAVE_TYPE')
      INSERT INTO dbo.[REF_TEST_FIELD]([TEST_ID],[CDM_TABLE_NAME],[CDM_COLUMN_NAME]) VALUES('USR_PAY_31','PREP_EMP_LEAVE_TAKEN','DAYS')
      INSERT INTO dbo.[REF_TEST_FIELD]([TEST_ID],[CDM_TABLE_NAME],[CDM_COLUMN_NAME]) VALUES('USR_PAY_32','PREP_EMP_LEAVE_TAKEN','EMPLOYEE_ID')
      INSERT INTO dbo.[REF_TEST_FIELD]([TEST_ID],[CDM_TABLE_NAME],[CDM_COLUMN_NAME]) VALUES('USR_PAY_32','PREP_EMP_LEAVE_TAKEN','LEAVE_TYPE')
      INSERT INTO dbo.[REF_TEST_FIELD]([TEST_ID],[CDM_TABLE_NAME],[CDM_COLUMN_NAME]) VALUES('USR_PAY_32','PREP_EMP_LEAVE_TAKEN','DAYS')
      INSERT INTO dbo.[REF_TEST_FIELD]([TEST_ID],[CDM_TABLE_NAME],[CDM_COLUMN_NAME]) VALUES('USR_PAY_33','PREP_EMP_LEAVE_TAKEN','EMPLOYEE_ID')
      INSERT INTO dbo.[REF_TEST_FIELD]([TEST_ID],[CDM_TABLE_NAME],[CDM_COLUMN_NAME]) VALUES('USR_PAY_33','PREP_EMP_LEAVE_TAKEN','LEAVE_TYPE')
      INSERT INTO dbo.[REF_TEST_FIELD]([TEST_ID],[CDM_TABLE_NAME],[CDM_COLUMN_NAME]) VALUES('USR_PAY_33','PREP_EMP_LEAVE_TAKEN','DAYS')
      INSERT INTO dbo.[REF_TEST_FIELD]([TEST_ID],[CDM_TABLE_NAME],[CDM_COLUMN_NAME]) VALUES('USR_PAY_34','PREP_EMP_LEAVE_TAKEN','EMPLOYEE_ID')
      INSERT INTO dbo.[REF_TEST_FIELD]([TEST_ID],[CDM_TABLE_NAME],[CDM_COLUMN_NAME]) VALUES('USR_PAY_34','PREP_EMP_LEAVE_TAKEN','LEAVE_SUB_TYPE')
      INSERT INTO dbo.[REF_TEST_FIELD]([TEST_ID],[CDM_TABLE_NAME],[CDM_COLUMN_NAME]) VALUES('USR_PAY_34','PREP_EMP_LEAVE_TAKEN','AMOUNT')
      INSERT INTO dbo.[REF_TEST_FIELD]([TEST_ID],[CDM_TABLE_NAME],[CDM_COLUMN_NAME]) VALUES('USR_PAY_35','PREP_EMP_LEAVE_TAKEN','EMPLOYEE_ID')
      INSERT INTO dbo.[REF_TEST_FIELD]([TEST_ID],[CDM_TABLE_NAME],[CDM_COLUMN_NAME]) VALUES('USR_PAY_35','PREP_EMP_LEAVE_TAKEN','LEAVE_TYPE')
      INSERT INTO dbo.[REF_TEST_FIELD]([TEST_ID],[CDM_TABLE_NAME],[CDM_COLUMN_NAME]) VALUES('USR_PAY_35','PREP_EMP_LEAVE_TAKEN','HOURS')
      INSERT INTO dbo.[REF_TEST_FIELD]([TEST_ID],[CDM_TABLE_NAME],[CDM_COLUMN_NAME]) VALUES('USR_PAY_36','PREP_EMP_LEAVE_TAKEN','EMPLOYEE_ID')
      INSERT INTO dbo.[REF_TEST_FIELD]([TEST_ID],[CDM_TABLE_NAME],[CDM_COLUMN_NAME]) VALUES('USR_PAY_36','PREP_EMP_LEAVE_TAKEN','LEAVE_TYPE')
      INSERT INTO dbo.[REF_TEST_FIELD]([TEST_ID],[CDM_TABLE_NAME],[CDM_COLUMN_NAME]) VALUES('USR_PAY_36','PREP_EMP_LEAVE_TAKEN','HOURS')
      
      /**************************************************************************************************************
      03. CREATE INDEX ON TABLE
      *************************************************************************************************************/ 
      
      CREATE INDEX [ID_TEST_ID]
      ON [REF_TEST_FIELD] (
      TEST_ID
      )
      
      CREATE INDEX [ID_CDM_TABLE_NAME]
      ON [REF_TEST_FIELD] (
      CDM_TABLE_NAME
      )
      
      CREATE INDEX [ID_CDM_COLUMN_NAME]
      ON [REF_TEST_FIELD] (
      CDM_COLUMN_NAME
      )USE [z'9bbaf92f-d960-4e33-a9cd-228c72cc97ef]
GO
      /****** Object:  StoredProcedure [dbo].[46.BLD_FIELD_MAPPING]    Script Date: 4/10/2018 10:58:12 AM ******/
      SET ANSI_NULLS ON
      GO
      SET QUOTED_IDENTIFIER ON
      GO
      ALTER PROC [dbo].[46.BLD_FIELD_MAPPING]
      AS
      
      /*************************************************************************************************************
      *                           DATA ASSURANCE                                                                   *
      **************************************************************************************************************
      UPDATES            - Version 0.1 {13/08/2015} {Fei li} - {Creates basic script for data field mapping}
      
      SCRIPT DESCRIPTION - {Creates data validation script }
      
      TABLE INFORMATION
      INPUT TABLE(S)
      - [^BIA CAF].[Management].[ProjectTypeDataSet]
      - [^BIA CAF].[Management].[ProjectTypeDataSetField]
      - [^BIA CAF].[Management].[ProjectTypeDataSetFieldSource]
      - [^BIA CAF].[Management].[Project]
      - [Store].[DataSet]
      - [FIELD_MAPPING_SOURNCE]
      
      OUTPUT TABLE(S)
      - [DBO].[REF_FIELD_MAPPING]
      
      SUMMARY OF SCRIPT  - 01. TRUNCATE TABLE
      - 02. INSERT DATA PART 1
      - 03. INSERT DATA PART 2
      - 04. CREATE INDEX ON TABLE
      
      **************************************************************************************************************
      01. TRUNCATE TABLE
      *************************************************************************************************************/
      
      TRUNCATE TABLE REF_FIELD_MAPPING
      
      /**************************************************************************************************************
      02. INSERT DATA 
      *************************************************************************************************************/
      INSERT INTO dbo.[REF_FIELD_MAPPING]([CDM_TABLE_NAME],[CDM_COLUMN_NAME],[INT_TABLE_NAME],[INT_COLUMN_NAME]) VALUES('PREP_BANK_EFT','ACCOUNT_NAME','BANK_EFT_DETAIL','ACCOUNT_NAME')
      INSERT INTO dbo.[REF_FIELD_MAPPING]([CDM_TABLE_NAME],[CDM_COLUMN_NAME],[INT_TABLE_NAME],[INT_COLUMN_NAME]) VALUES('PREP_BANK_EFT','ACCOUNT_NUMBER','BANK_EFT_DETAIL','ACCOUNT_NUMBER')
      INSERT INTO dbo.[REF_FIELD_MAPPING]([CDM_TABLE_NAME],[CDM_COLUMN_NAME],[INT_TABLE_NAME],[INT_COLUMN_NAME]) VALUES('PREP_BANK_EFT','AMOUNT','BANK_EFT_DETAIL','NETPAY')
      INSERT INTO dbo.[REF_FIELD_MAPPING]([CDM_TABLE_NAME],[CDM_COLUMN_NAME],[INT_TABLE_NAME],[INT_COLUMN_NAME]) VALUES('PREP_BANK_EFT','BSB_NUMBER','BANK_EFT_DETAIL','BSB_NUMBER')
      INSERT INTO dbo.[REF_FIELD_MAPPING]([CDM_TABLE_NAME],[CDM_COLUMN_NAME],[INT_TABLE_NAME],[INT_COLUMN_NAME]) VALUES('PREP_BANK_EFT','BSB_NUMBER_DESC','BANK_EFT_DETAIL','BSB_NUMBER_DESC')
      INSERT INTO dbo.[REF_FIELD_MAPPING]([CDM_TABLE_NAME],[CDM_COLUMN_NAME],[INT_TABLE_NAME],[INT_COLUMN_NAME]) VALUES('PREP_BANK_EFT','CHEQUE_DATE','BANK_EFT_DETAIL','CHEQUE_DATE')
      INSERT INTO dbo.[REF_FIELD_MAPPING]([CDM_TABLE_NAME],[CDM_COLUMN_NAME],[INT_TABLE_NAME],[INT_COLUMN_NAME]) VALUES('PREP_BANK_EFT','CHEQUE_NUMBER','BANK_EFT_DETAIL','CHEQUE_NUMBER')
      INSERT INTO dbo.[REF_FIELD_MAPPING]([CDM_TABLE_NAME],[CDM_COLUMN_NAME],[INT_TABLE_NAME],[INT_COLUMN_NAME]) VALUES('PREP_BANK_EFT','DISBURSE_DATE','BANK_EFT_DETAIL','PERIOD_END_DATE')
      INSERT INTO dbo.[REF_FIELD_MAPPING]([CDM_TABLE_NAME],[CDM_COLUMN_NAME],[INT_TABLE_NAME],[INT_COLUMN_NAME]) VALUES('PREP_BANK_EFT','DISBURSE_ID','BANK_EFT_DETAIL','DISBURSE_ID')
      INSERT INTO dbo.[REF_FIELD_MAPPING]([CDM_TABLE_NAME],[CDM_COLUMN_NAME],[INT_TABLE_NAME],[INT_COLUMN_NAME]) VALUES('PREP_BANK_EFT','EMPLOYEE_ID','BANK_EFT_DETAIL','EMPLOYEE_ID')
      INSERT INTO dbo.[REF_FIELD_MAPPING]([CDM_TABLE_NAME],[CDM_COLUMN_NAME],[INT_TABLE_NAME],[INT_COLUMN_NAME]) VALUES('PREP_BANK_EFT','NETPAY','BANK_EFT_DETAIL','NETPAY')
      INSERT INTO dbo.[REF_FIELD_MAPPING]([CDM_TABLE_NAME],[CDM_COLUMN_NAME],[INT_TABLE_NAME],[INT_COLUMN_NAME]) VALUES('PREP_BANK_EFT','PAYGRP','BANK_EFT_DETAIL','PAYGRP_DESC')
      INSERT INTO dbo.[REF_FIELD_MAPPING]([CDM_TABLE_NAME],[CDM_COLUMN_NAME],[INT_TABLE_NAME],[INT_COLUMN_NAME]) VALUES('PREP_BANK_EFT','PAYGRP_DESC','BANK_EFT_DETAIL','PAYGRP_DESC')
      INSERT INTO dbo.[REF_FIELD_MAPPING]([CDM_TABLE_NAME],[CDM_COLUMN_NAME],[INT_TABLE_NAME],[INT_COLUMN_NAME]) VALUES('PREP_BANK_EFT','PAYMETHOD','BANK_EFT_DETAIL','PAYMETHOD')
      INSERT INTO dbo.[REF_FIELD_MAPPING]([CDM_TABLE_NAME],[CDM_COLUMN_NAME],[INT_TABLE_NAME],[INT_COLUMN_NAME]) VALUES('PREP_BANK_EFT','PAYMETHOD_DESC','BANK_EFT_DETAIL','PAYMETHOD_DESC')
      INSERT INTO dbo.[REF_FIELD_MAPPING]([CDM_TABLE_NAME],[CDM_COLUMN_NAME],[INT_TABLE_NAME],[INT_COLUMN_NAME]) VALUES('PREP_BANK_EFT','PAYPERNO','BANK_EFT_DETAIL','PAYPERNO')
      INSERT INTO dbo.[REF_FIELD_MAPPING]([CDM_TABLE_NAME],[CDM_COLUMN_NAME],[INT_TABLE_NAME],[INT_COLUMN_NAME]) VALUES('PREP_BANK_EFT','PAYPERYR','BANK_EFT_DETAIL','PERIOD_END_DATE')
      INSERT INTO dbo.[REF_FIELD_MAPPING]([CDM_TABLE_NAME],[CDM_COLUMN_NAME],[INT_TABLE_NAME],[INT_COLUMN_NAME]) VALUES('PREP_BANK_EFT','PERIOD_END_DATE','BANK_EFT_DETAIL','PERIOD_END_DATE')
      INSERT INTO dbo.[REF_FIELD_MAPPING]([CDM_TABLE_NAME],[CDM_COLUMN_NAME],[INT_TABLE_NAME],[INT_COLUMN_NAME]) VALUES('PREP_BANK_EFT','REFERENCE','BANK_EFT_DETAIL','REFERENCE')
      INSERT INTO dbo.[REF_FIELD_MAPPING]([CDM_TABLE_NAME],[CDM_COLUMN_NAME],[INT_TABLE_NAME],[INT_COLUMN_NAME]) VALUES('PREP_BANK_EFT','SYSTEM_NAME','BANK_EFT_DETAIL','SYSTEM_NAME')
      INSERT INTO dbo.[REF_FIELD_MAPPING]([CDM_TABLE_NAME],[CDM_COLUMN_NAME],[INT_TABLE_NAME],[INT_COLUMN_NAME]) VALUES('PREP_EMP_ADDRESS','EMPLOYEE_ID','EMPLOYEE_ADDRESS','EMPLOYEE_ID')
      INSERT INTO dbo.[REF_FIELD_MAPPING]([CDM_TABLE_NAME],[CDM_COLUMN_NAME],[INT_TABLE_NAME],[INT_COLUMN_NAME]) VALUES('PREP_EMP_ADDRESS','ADDRESS_TYPE','EMPLOYEE_ADDRESS','ADDRESS_TYPE')
      INSERT INTO dbo.[REF_FIELD_MAPPING]([CDM_TABLE_NAME],[CDM_COLUMN_NAME],[INT_TABLE_NAME],[INT_COLUMN_NAME]) VALUES('PREP_EMP_ADDRESS','ADDRESS_1','EMPLOYEE_ADDRESS','ADDRESS_1')
      INSERT INTO dbo.[REF_FIELD_MAPPING]([CDM_TABLE_NAME],[CDM_COLUMN_NAME],[INT_TABLE_NAME],[INT_COLUMN_NAME]) VALUES('PREP_EMP_ADDRESS','ADDRESS_2','EMPLOYEE_ADDRESS','ADDRESS_2')
      INSERT INTO dbo.[REF_FIELD_MAPPING]([CDM_TABLE_NAME],[CDM_COLUMN_NAME],[INT_TABLE_NAME],[INT_COLUMN_NAME]) VALUES('PREP_EMP_ADDRESS','ADDRESS_3','EMPLOYEE_ADDRESS','ADDRESS_3')
      INSERT INTO dbo.[REF_FIELD_MAPPING]([CDM_TABLE_NAME],[CDM_COLUMN_NAME],[INT_TABLE_NAME],[INT_COLUMN_NAME]) VALUES('PREP_EMP_ADDRESS','ADDRESS_4','','')
      INSERT INTO dbo.[REF_FIELD_MAPPING]([CDM_TABLE_NAME],[CDM_COLUMN_NAME],[INT_TABLE_NAME],[INT_COLUMN_NAME]) VALUES('PREP_EMP_ADDRESS','UNIT_NUMBER','EMPLOYEE_ADDRESS','UNIT_NUMBER')
      INSERT INTO dbo.[REF_FIELD_MAPPING]([CDM_TABLE_NAME],[CDM_COLUMN_NAME],[INT_TABLE_NAME],[INT_COLUMN_NAME]) VALUES('PREP_EMP_ADDRESS','STREET_NUMBER','','')
      INSERT INTO dbo.[REF_FIELD_MAPPING]([CDM_TABLE_NAME],[CDM_COLUMN_NAME],[INT_TABLE_NAME],[INT_COLUMN_NAME]) VALUES('PREP_EMP_ADDRESS','STREET_NAME','','')
      INSERT INTO dbo.[REF_FIELD_MAPPING]([CDM_TABLE_NAME],[CDM_COLUMN_NAME],[INT_TABLE_NAME],[INT_COLUMN_NAME]) VALUES('PREP_EMP_ADDRESS','CITY','EMPLOYEE_ADDRESS','CITY')
      INSERT INTO dbo.[REF_FIELD_MAPPING]([CDM_TABLE_NAME],[CDM_COLUMN_NAME],[INT_TABLE_NAME],[INT_COLUMN_NAME]) VALUES('PREP_EMP_ADDRESS','STATE','EMPLOYEE_ADDRESS','STATE')
      INSERT INTO dbo.[REF_FIELD_MAPPING]([CDM_TABLE_NAME],[CDM_COLUMN_NAME],[INT_TABLE_NAME],[INT_COLUMN_NAME]) VALUES('PREP_EMP_ADDRESS','POSTCODE','EMPLOYEE_ADDRESS','POSTCODE')
      INSERT INTO dbo.[REF_FIELD_MAPPING]([CDM_TABLE_NAME],[CDM_COLUMN_NAME],[INT_TABLE_NAME],[INT_COLUMN_NAME]) VALUES('PREP_EMP_ADDRESS','COUNTRY','EMPLOYEE_ADDRESS','COUNTRY')
      INSERT INTO dbo.[REF_FIELD_MAPPING]([CDM_TABLE_NAME],[CDM_COLUMN_NAME],[INT_TABLE_NAME],[INT_COLUMN_NAME]) VALUES('PREP_EMP_ADDRESS','SYSTEM_NAME','EMPLOYEE_ADDRESS','SYSTEM_NAME')
      INSERT INTO dbo.[REF_FIELD_MAPPING]([CDM_TABLE_NAME],[CDM_COLUMN_NAME],[INT_TABLE_NAME],[INT_COLUMN_NAME]) VALUES('PREP_EMP_ADDRESS','PWC_TOTAL_ADDRESS','EMPLOYEE_ADDRESS','ADDRESS_1')
      INSERT INTO dbo.[REF_FIELD_MAPPING]([CDM_TABLE_NAME],[CDM_COLUMN_NAME],[INT_TABLE_NAME],[INT_COLUMN_NAME]) VALUES('PREP_EMP_ADDRESS','PWC_TOTAL_ADDRESS','EMPLOYEE_ADDRESS','CITY')
      INSERT INTO dbo.[REF_FIELD_MAPPING]([CDM_TABLE_NAME],[CDM_COLUMN_NAME],[INT_TABLE_NAME],[INT_COLUMN_NAME]) VALUES('PREP_EMP_ADDRESS','PWC_TOTAL_ADDRESS','EMPLOYEE_ADDRESS','STATE')
      INSERT INTO dbo.[REF_FIELD_MAPPING]([CDM_TABLE_NAME],[CDM_COLUMN_NAME],[INT_TABLE_NAME],[INT_COLUMN_NAME]) VALUES('PREP_EMP_ADDRESS','PWC_TOTAL_ADDRESS','EMPLOYEE_ADDRESS','POSTCODE')
      INSERT INTO dbo.[REF_FIELD_MAPPING]([CDM_TABLE_NAME],[CDM_COLUMN_NAME],[INT_TABLE_NAME],[INT_COLUMN_NAME]) VALUES('PREP_EMP_BANK_ACCOUNT','EMPLOYEE_ID','EMPLOYEE_BANK_DETAILS','EMPLOYEE_ID')
      INSERT INTO dbo.[REF_FIELD_MAPPING]([CDM_TABLE_NAME],[CDM_COLUMN_NAME],[INT_TABLE_NAME],[INT_COLUMN_NAME]) VALUES('PREP_EMP_BANK_ACCOUNT','SYSTEM_NAME','EMPLOYEE_BANK_DETAILS','SYSTEM_NAME')
      INSERT INTO dbo.[REF_FIELD_MAPPING]([CDM_TABLE_NAME],[CDM_COLUMN_NAME],[INT_TABLE_NAME],[INT_COLUMN_NAME]) VALUES('PREP_EMP_BANK_ACCOUNT','BSB_NUMBER','EMPLOYEE_BANK_DETAILS','BSB_NUMBER')
      INSERT INTO dbo.[REF_FIELD_MAPPING]([CDM_TABLE_NAME],[CDM_COLUMN_NAME],[INT_TABLE_NAME],[INT_COLUMN_NAME]) VALUES('PREP_EMP_BANK_ACCOUNT','ACCOUNT_NUMBER','EMPLOYEE_BANK_DETAILS','ACCOUNT_NUMBER')
      INSERT INTO dbo.[REF_FIELD_MAPPING]([CDM_TABLE_NAME],[CDM_COLUMN_NAME],[INT_TABLE_NAME],[INT_COLUMN_NAME]) VALUES('PREP_EMP_BANK_ACCOUNT','ACCOUNT_NAME','EMPLOYEE_BANK_DETAILS','ACCOUNT_NAME')
      INSERT INTO dbo.[REF_FIELD_MAPPING]([CDM_TABLE_NAME],[CDM_COLUMN_NAME],[INT_TABLE_NAME],[INT_COLUMN_NAME]) VALUES('PREP_EMP_BANK_ACCOUNT','STATUS','','')
      INSERT INTO dbo.[REF_FIELD_MAPPING]([CDM_TABLE_NAME],[CDM_COLUMN_NAME],[INT_TABLE_NAME],[INT_COLUMN_NAME]) VALUES('PREP_EMP_BANK_ACCOUNT','PWC_BSB_NUMBER','EMPLOYEE_BANK_DETAILS','BSB_NUMBER')
      INSERT INTO dbo.[REF_FIELD_MAPPING]([CDM_TABLE_NAME],[CDM_COLUMN_NAME],[INT_TABLE_NAME],[INT_COLUMN_NAME]) VALUES('PREP_EMP_BANK_ACCOUNT','PWC_ACCOUNT_NUMBER','EMPLOYEE_BANK_DETAILS','ACCOUNT_NUMBER')
      INSERT INTO dbo.[REF_FIELD_MAPPING]([CDM_TABLE_NAME],[CDM_COLUMN_NAME],[INT_TABLE_NAME],[INT_COLUMN_NAME]) VALUES('PREP_EMP_BANK_ACCOUNT','PWC_ACCOUNT_NAME','EMPLOYEE_BANK_DETAILS','ACCOUNT_NAME')
      INSERT INTO dbo.[REF_FIELD_MAPPING]([CDM_TABLE_NAME],[CDM_COLUMN_NAME],[INT_TABLE_NAME],[INT_COLUMN_NAME]) VALUES('PREP_EMP_BANK_ACCOUNT','PWC_BSB_STATUS','','')
      INSERT INTO dbo.[REF_FIELD_MAPPING]([CDM_TABLE_NAME],[CDM_COLUMN_NAME],[INT_TABLE_NAME],[INT_COLUMN_NAME]) VALUES('PREP_EMP_BANK_ACCOUNT','PWC_BANK_NAME','`','')
      INSERT INTO dbo.[REF_FIELD_MAPPING]([CDM_TABLE_NAME],[CDM_COLUMN_NAME],[INT_TABLE_NAME],[INT_COLUMN_NAME]) VALUES('PREP_EMP_MASTER','EMPLOYEE_ID','EMPLOYEE_MASTER','EMPLOYEE_ID')
      INSERT INTO dbo.[REF_FIELD_MAPPING]([CDM_TABLE_NAME],[CDM_COLUMN_NAME],[INT_TABLE_NAME],[INT_COLUMN_NAME]) VALUES('PREP_EMP_MASTER','SURNAME','EMPLOYEE_MASTER','SURNAME')
      INSERT INTO dbo.[REF_FIELD_MAPPING]([CDM_TABLE_NAME],[CDM_COLUMN_NAME],[INT_TABLE_NAME],[INT_COLUMN_NAME]) VALUES('PREP_EMP_MASTER','FIRST_NAME','EMPLOYEE_MASTER','FIRST_NAME')
      INSERT INTO dbo.[REF_FIELD_MAPPING]([CDM_TABLE_NAME],[CDM_COLUMN_NAME],[INT_TABLE_NAME],[INT_COLUMN_NAME]) VALUES('PREP_EMP_MASTER','SECOND_NAME','EMPLOYEE_MASTER','SECOND_NAME')
      INSERT INTO dbo.[REF_FIELD_MAPPING]([CDM_TABLE_NAME],[CDM_COLUMN_NAME],[INT_TABLE_NAME],[INT_COLUMN_NAME]) VALUES('PREP_EMP_MASTER','THIRD_NAME','EMPLOYEE_MASTER','THIRD_NAME')
      INSERT INTO dbo.[REF_FIELD_MAPPING]([CDM_TABLE_NAME],[CDM_COLUMN_NAME],[INT_TABLE_NAME],[INT_COLUMN_NAME]) VALUES('PREP_EMP_MASTER','FOURTH_NAME','','')
      INSERT INTO dbo.[REF_FIELD_MAPPING]([CDM_TABLE_NAME],[CDM_COLUMN_NAME],[INT_TABLE_NAME],[INT_COLUMN_NAME]) VALUES('PREP_EMP_MASTER','INITIAL','EMPLOYEE_MASTER','SURNAME')
      INSERT INTO dbo.[REF_FIELD_MAPPING]([CDM_TABLE_NAME],[CDM_COLUMN_NAME],[INT_TABLE_NAME],[INT_COLUMN_NAME]) VALUES('PREP_EMP_MASTER','INITIAL','EMPLOYEE_MASTER','FIRST_NAME')
      INSERT INTO dbo.[REF_FIELD_MAPPING]([CDM_TABLE_NAME],[CDM_COLUMN_NAME],[INT_TABLE_NAME],[INT_COLUMN_NAME]) VALUES('PREP_EMP_MASTER','COMPANY','EMPLOYEE_MASTER','COMPANY')
      INSERT INTO dbo.[REF_FIELD_MAPPING]([CDM_TABLE_NAME],[CDM_COLUMN_NAME],[INT_TABLE_NAME],[INT_COLUMN_NAME]) VALUES('PREP_EMP_MASTER','DEPARTMENT','EMPLOYEE_MASTER','DEPARTMENT')
      INSERT INTO dbo.[REF_FIELD_MAPPING]([CDM_TABLE_NAME],[CDM_COLUMN_NAME],[INT_TABLE_NAME],[INT_COLUMN_NAME]) VALUES('PREP_EMP_MASTER','SUB_DEPARTMENT','','')
      INSERT INTO dbo.[REF_FIELD_MAPPING]([CDM_TABLE_NAME],[CDM_COLUMN_NAME],[INT_TABLE_NAME],[INT_COLUMN_NAME]) VALUES('PREP_EMP_MASTER','POSITION','EMPLOYEE_MASTER','POSITION')
      INSERT INTO dbo.[REF_FIELD_MAPPING]([CDM_TABLE_NAME],[CDM_COLUMN_NAME],[INT_TABLE_NAME],[INT_COLUMN_NAME]) VALUES('PREP_EMP_MASTER','LOCATION','EMPLOYEE_MASTER','LOCATION')
      INSERT INTO dbo.[REF_FIELD_MAPPING]([CDM_TABLE_NAME],[CDM_COLUMN_NAME],[INT_TABLE_NAME],[INT_COLUMN_NAME]) VALUES('PREP_EMP_MASTER','TYPE','EMPLOYEE_MASTER','TYPE')
      INSERT INTO dbo.[REF_FIELD_MAPPING]([CDM_TABLE_NAME],[CDM_COLUMN_NAME],[INT_TABLE_NAME],[INT_COLUMN_NAME]) VALUES('PREP_EMP_MASTER','STATUS','EMPLOYEE_MASTER','START_DATE')
      INSERT INTO dbo.[REF_FIELD_MAPPING]([CDM_TABLE_NAME],[CDM_COLUMN_NAME],[INT_TABLE_NAME],[INT_COLUMN_NAME]) VALUES('PREP_EMP_MASTER','STATUS','EMPLOYEE_MASTER','TERM_DATE')
      INSERT INTO dbo.[REF_FIELD_MAPPING]([CDM_TABLE_NAME],[CDM_COLUMN_NAME],[INT_TABLE_NAME],[INT_COLUMN_NAME]) VALUES('PREP_EMP_MASTER','START_DATE','EMPLOYEE_MASTER','START_DATE')
      INSERT INTO dbo.[REF_FIELD_MAPPING]([CDM_TABLE_NAME],[CDM_COLUMN_NAME],[INT_TABLE_NAME],[INT_COLUMN_NAME]) VALUES('PREP_EMP_MASTER','TERM_DATE','EMPLOYEE_MASTER','TERM_DATE')
      INSERT INTO dbo.[REF_FIELD_MAPPING]([CDM_TABLE_NAME],[CDM_COLUMN_NAME],[INT_TABLE_NAME],[INT_COLUMN_NAME]) VALUES('PREP_EMP_MASTER','TERM_REASON','EMPLOYEE_MASTER','TERM_REASON')
      INSERT INTO dbo.[REF_FIELD_MAPPING]([CDM_TABLE_NAME],[CDM_COLUMN_NAME],[INT_TABLE_NAME],[INT_COLUMN_NAME]) VALUES('PREP_EMP_MASTER','DOB','EMPLOYEE_MASTER','DATE_OF_BIRTH')
      INSERT INTO dbo.[REF_FIELD_MAPPING]([CDM_TABLE_NAME],[CDM_COLUMN_NAME],[INT_TABLE_NAME],[INT_COLUMN_NAME]) VALUES('PREP_EMP_MASTER','TFN','','')
      INSERT INTO dbo.[REF_FIELD_MAPPING]([CDM_TABLE_NAME],[CDM_COLUMN_NAME],[INT_TABLE_NAME],[INT_COLUMN_NAME]) VALUES('PREP_EMP_MASTER','SUPER_NUMBER','','')
      INSERT INTO dbo.[REF_FIELD_MAPPING]([CDM_TABLE_NAME],[CDM_COLUMN_NAME],[INT_TABLE_NAME],[INT_COLUMN_NAME]) VALUES('PREP_EMP_MASTER','GENDER','EMPLOYEE_MASTER','GENDER')
      INSERT INTO dbo.[REF_FIELD_MAPPING]([CDM_TABLE_NAME],[CDM_COLUMN_NAME],[INT_TABLE_NAME],[INT_COLUMN_NAME]) VALUES('PREP_EMP_MASTER','SYSTEM_NAME','EMPLOYEE_MASTER','SYSTEM_NAME')
      INSERT INTO dbo.[REF_FIELD_MAPPING]([CDM_TABLE_NAME],[CDM_COLUMN_NAME],[INT_TABLE_NAME],[INT_COLUMN_NAME]) VALUES('PREP_EMP_NUMBER','EMPLOYEE_ID','EMPLOYEE_CONTACT_DETAILS','EMPLOYEE_ID')
      INSERT INTO dbo.[REF_FIELD_MAPPING]([CDM_TABLE_NAME],[CDM_COLUMN_NAME],[INT_TABLE_NAME],[INT_COLUMN_NAME]) VALUES('PREP_EMP_NUMBER','CONTACT_TYPE','','')
      INSERT INTO dbo.[REF_FIELD_MAPPING]([CDM_TABLE_NAME],[CDM_COLUMN_NAME],[INT_TABLE_NAME],[INT_COLUMN_NAME]) VALUES('PREP_EMP_NUMBER','NUMBER','EMPLOYEE_CONTACT_DETAILS','MOBILE_NUMBER')
      INSERT INTO dbo.[REF_FIELD_MAPPING]([CDM_TABLE_NAME],[CDM_COLUMN_NAME],[INT_TABLE_NAME],[INT_COLUMN_NAME]) VALUES('PREP_EMP_NUMBER','NUMBER','EMPLOYEE_CONTACT_DETAILS','HOME_NUMBER')
      INSERT INTO dbo.[REF_FIELD_MAPPING]([CDM_TABLE_NAME],[CDM_COLUMN_NAME],[INT_TABLE_NAME],[INT_COLUMN_NAME]) VALUES('PREP_EMP_NUMBER','SYSTEM_NAME','EMPLOYEE_CONTACT_DETAILS','SYSTEM_NAME')
      INSERT INTO dbo.[REF_FIELD_MAPPING]([CDM_TABLE_NAME],[CDM_COLUMN_NAME],[INT_TABLE_NAME],[INT_COLUMN_NAME]) VALUES('PREP_EMP_NUMBER','PWC_CONTACT_NUMBER_TYPE','','')
      INSERT INTO dbo.[REF_FIELD_MAPPING]([CDM_TABLE_NAME],[CDM_COLUMN_NAME],[INT_TABLE_NAME],[INT_COLUMN_NAME]) VALUES('PREP_EMP_NUMBER','PWC_CONTACT_NUMBER','EMPLOYEE_CONTACT_DETAILS','MOBILE_NUMBER')
      INSERT INTO dbo.[REF_FIELD_MAPPING]([CDM_TABLE_NAME],[CDM_COLUMN_NAME],[INT_TABLE_NAME],[INT_COLUMN_NAME]) VALUES('PREP_EMP_NUMBER','PWC_CONTACT_NUMBER','EMPLOYEE_CONTACT_DETAILS','HOME_NUMBER')
      INSERT INTO dbo.[REF_FIELD_MAPPING]([CDM_TABLE_NAME],[CDM_COLUMN_NAME],[INT_TABLE_NAME],[INT_COLUMN_NAME]) VALUES('PREP_EMP_POSITION_HISTORY','EMPLOYEE_ID','','')
      INSERT INTO dbo.[REF_FIELD_MAPPING]([CDM_TABLE_NAME],[CDM_COLUMN_NAME],[INT_TABLE_NAME],[INT_COLUMN_NAME]) VALUES('PREP_EMP_POSITION_HISTORY','JOB_ID','','')
      INSERT INTO dbo.[REF_FIELD_MAPPING]([CDM_TABLE_NAME],[CDM_COLUMN_NAME],[INT_TABLE_NAME],[INT_COLUMN_NAME]) VALUES('PREP_EMP_POSITION_HISTORY','TYPE','','')
      INSERT INTO dbo.[REF_FIELD_MAPPING]([CDM_TABLE_NAME],[CDM_COLUMN_NAME],[INT_TABLE_NAME],[INT_COLUMN_NAME]) VALUES('PREP_EMP_POSITION_HISTORY','STATUS','','')
      INSERT INTO dbo.[REF_FIELD_MAPPING]([CDM_TABLE_NAME],[CDM_COLUMN_NAME],[INT_TABLE_NAME],[INT_COLUMN_NAME]) VALUES('PREP_EMP_POSITION_HISTORY','COMPANY','','')
      INSERT INTO dbo.[REF_FIELD_MAPPING]([CDM_TABLE_NAME],[CDM_COLUMN_NAME],[INT_TABLE_NAME],[INT_COLUMN_NAME]) VALUES('PREP_EMP_POSITION_HISTORY','DEPARTMENT','','')
      INSERT INTO dbo.[REF_FIELD_MAPPING]([CDM_TABLE_NAME],[CDM_COLUMN_NAME],[INT_TABLE_NAME],[INT_COLUMN_NAME]) VALUES('PREP_EMP_POSITION_HISTORY','SUB_DEPARTMENT','','')
      INSERT INTO dbo.[REF_FIELD_MAPPING]([CDM_TABLE_NAME],[CDM_COLUMN_NAME],[INT_TABLE_NAME],[INT_COLUMN_NAME]) VALUES('PREP_EMP_POSITION_HISTORY','POSITION_CODE','','')
      INSERT INTO dbo.[REF_FIELD_MAPPING]([CDM_TABLE_NAME],[CDM_COLUMN_NAME],[INT_TABLE_NAME],[INT_COLUMN_NAME]) VALUES('PREP_EMP_POSITION_HISTORY','POSITION_DESC','','')
      INSERT INTO dbo.[REF_FIELD_MAPPING]([CDM_TABLE_NAME],[CDM_COLUMN_NAME],[INT_TABLE_NAME],[INT_COLUMN_NAME]) VALUES('PREP_EMP_POSITION_HISTORY','LOCATION','','')
      INSERT INTO dbo.[REF_FIELD_MAPPING]([CDM_TABLE_NAME],[CDM_COLUMN_NAME],[INT_TABLE_NAME],[INT_COLUMN_NAME]) VALUES('PREP_EMP_POSITION_HISTORY','COMMENCE_DATE','','')
      INSERT INTO dbo.[REF_FIELD_MAPPING]([CDM_TABLE_NAME],[CDM_COLUMN_NAME],[INT_TABLE_NAME],[INT_COLUMN_NAME]) VALUES('PREP_EMP_POSITION_HISTORY','POSITION_START_DATE','','')
      INSERT INTO dbo.[REF_FIELD_MAPPING]([CDM_TABLE_NAME],[CDM_COLUMN_NAME],[INT_TABLE_NAME],[INT_COLUMN_NAME]) VALUES('PREP_EMP_POSITION_HISTORY','POSITION_TERM_DATE','','')
      INSERT INTO dbo.[REF_FIELD_MAPPING]([CDM_TABLE_NAME],[CDM_COLUMN_NAME],[INT_TABLE_NAME],[INT_COLUMN_NAME]) VALUES('PREP_EMP_POSITION_HISTORY','TERM_DATE','','')
      INSERT INTO dbo.[REF_FIELD_MAPPING]([CDM_TABLE_NAME],[CDM_COLUMN_NAME],[INT_TABLE_NAME],[INT_COLUMN_NAME]) VALUES('PREP_EMP_POSITION_HISTORY','TERMINATION_CODE','','')
      INSERT INTO dbo.[REF_FIELD_MAPPING]([CDM_TABLE_NAME],[CDM_COLUMN_NAME],[INT_TABLE_NAME],[INT_COLUMN_NAME]) VALUES('PREP_EMP_POSITION_HISTORY','TERMINATION_REASON','','')
      INSERT INTO dbo.[REF_FIELD_MAPPING]([CDM_TABLE_NAME],[CDM_COLUMN_NAME],[INT_TABLE_NAME],[INT_COLUMN_NAME]) VALUES('PREP_EMP_POSITION_HISTORY','PAYMENT_FREQUENCY','','')
      INSERT INTO dbo.[REF_FIELD_MAPPING]([CDM_TABLE_NAME],[CDM_COLUMN_NAME],[INT_TABLE_NAME],[INT_COLUMN_NAME]) VALUES('PREP_EMP_POSITION_HISTORY','PAYMENT_METHOD','','')
      INSERT INTO dbo.[REF_FIELD_MAPPING]([CDM_TABLE_NAME],[CDM_COLUMN_NAME],[INT_TABLE_NAME],[INT_COLUMN_NAME]) VALUES('PREP_EMP_POSITION_HISTORY','SYSTEM_NAME','','')
      INSERT INTO dbo.[REF_FIELD_MAPPING]([CDM_TABLE_NAME],[CDM_COLUMN_NAME],[INT_TABLE_NAME],[INT_COLUMN_NAME]) VALUES('PREP_EMP_POSITION_HISTORY','SALARY','','')
      INSERT INTO dbo.[REF_FIELD_MAPPING]([CDM_TABLE_NAME],[CDM_COLUMN_NAME],[INT_TABLE_NAME],[INT_COLUMN_NAME]) VALUES('PREP_EMP_POSITION_HISTORY','PWC_LATEST_JOB_ID','','')
      INSERT INTO dbo.[REF_FIELD_MAPPING]([CDM_TABLE_NAME],[CDM_COLUMN_NAME],[INT_TABLE_NAME],[INT_COLUMN_NAME]) VALUES('PREP_EMP_POSITION_HISTORY','PWC_LASTEST_COMMENCE_DATE','','')
      INSERT INTO dbo.[REF_FIELD_MAPPING]([CDM_TABLE_NAME],[CDM_COLUMN_NAME],[INT_TABLE_NAME],[INT_COLUMN_NAME]) VALUES('PREP_EMP_POSITION_HISTORY','PWC_EARLIEST_COMMENCE_DATE','','')
      INSERT INTO dbo.[REF_FIELD_MAPPING]([CDM_TABLE_NAME],[CDM_COLUMN_NAME],[INT_TABLE_NAME],[INT_COLUMN_NAME]) VALUES('PREP_EMP_POSITION_HISTORY','PWC_EARLIEST_POSITION_START_DATE','','')
      INSERT INTO dbo.[REF_FIELD_MAPPING]([CDM_TABLE_NAME],[CDM_COLUMN_NAME],[INT_TABLE_NAME],[INT_COLUMN_NAME]) VALUES('PREP_EMP_POSITION_HISTORY','PWC_LATEST_POSITION_START_DATE','','')
      INSERT INTO dbo.[REF_FIELD_MAPPING]([CDM_TABLE_NAME],[CDM_COLUMN_NAME],[INT_TABLE_NAME],[INT_COLUMN_NAME]) VALUES('PREP_EMP_POSITION_HISTORY','PWC_LATEST_POSITION_END_DATE','','')
      INSERT INTO dbo.[REF_FIELD_MAPPING]([CDM_TABLE_NAME],[CDM_COLUMN_NAME],[INT_TABLE_NAME],[INT_COLUMN_NAME]) VALUES('PREP_PAYSLIPS_DETAILS','EMPLOYEE_ID','PAYSLIP_DETAIL','EMPLOYEE_ID')
      INSERT INTO dbo.[REF_FIELD_MAPPING]([CDM_TABLE_NAME],[CDM_COLUMN_NAME],[INT_TABLE_NAME],[INT_COLUMN_NAME]) VALUES('PREP_PAYSLIPS_DETAILS','JOB_ID','PAYCODE_MAPPING','Pay Code')
      INSERT INTO dbo.[REF_FIELD_MAPPING]([CDM_TABLE_NAME],[CDM_COLUMN_NAME],[INT_TABLE_NAME],[INT_COLUMN_NAME]) VALUES('PREP_PAYSLIPS_DETAILS','PAY_RUN_ID','PAYSLIP_DETAIL','PAY_RUN_ID')
      INSERT INTO dbo.[REF_FIELD_MAPPING]([CDM_TABLE_NAME],[CDM_COLUMN_NAME],[INT_TABLE_NAME],[INT_COLUMN_NAME]) VALUES('PREP_PAYSLIPS_DETAILS','PAY_PERIOD','PAYSLIP_DETAIL','END_DATE')
      INSERT INTO dbo.[REF_FIELD_MAPPING]([CDM_TABLE_NAME],[CDM_COLUMN_NAME],[INT_TABLE_NAME],[INT_COLUMN_NAME]) VALUES('PREP_PAYSLIPS_DETAILS','PAY_YEAR','PAYSLIP_DETAIL','END_DATE')
      INSERT INTO dbo.[REF_FIELD_MAPPING]([CDM_TABLE_NAME],[CDM_COLUMN_NAME],[INT_TABLE_NAME],[INT_COLUMN_NAME]) VALUES('PREP_PAYSLIPS_DETAILS','LINE_ID','PAYSLIP_DETAIL','LINE_ID')
      INSERT INTO dbo.[REF_FIELD_MAPPING]([CDM_TABLE_NAME],[CDM_COLUMN_NAME],[INT_TABLE_NAME],[INT_COLUMN_NAME]) VALUES('PREP_PAYSLIPS_DETAILS','PAYCODE_ID','PAYSLIP_DETAIL','Pay Code')
      INSERT INTO dbo.[REF_FIELD_MAPPING]([CDM_TABLE_NAME],[CDM_COLUMN_NAME],[INT_TABLE_NAME],[INT_COLUMN_NAME]) VALUES('PREP_PAYSLIPS_DETAILS','PAYCODE_DESC','PAYCODE_MAPPING','Description')
      INSERT INTO dbo.[REF_FIELD_MAPPING]([CDM_TABLE_NAME],[CDM_COLUMN_NAME],[INT_TABLE_NAME],[INT_COLUMN_NAME]) VALUES('PREP_PAYSLIPS_DETAILS','PAYSLIP_ID','PAYSLIP_DETAIL','EMPLOYEE_ID')
      INSERT INTO dbo.[REF_FIELD_MAPPING]([CDM_TABLE_NAME],[CDM_COLUMN_NAME],[INT_TABLE_NAME],[INT_COLUMN_NAME]) VALUES('PREP_PAYSLIPS_DETAILS','PAYSLIP_ID','PAYSLIP_DETAIL','PAY_RUN_ID')
      INSERT INTO dbo.[REF_FIELD_MAPPING]([CDM_TABLE_NAME],[CDM_COLUMN_NAME],[INT_TABLE_NAME],[INT_COLUMN_NAME]) VALUES('PREP_PAYSLIPS_DETAILS','PAY_TYPE','PAYCODE_MAPPING','Pay Type')
      INSERT INTO dbo.[REF_FIELD_MAPPING]([CDM_TABLE_NAME],[CDM_COLUMN_NAME],[INT_TABLE_NAME],[INT_COLUMN_NAME]) VALUES('PREP_PAYSLIPS_DETAILS','PAY_TYPE_DESC','PAYCODE_MAPPING','Pay Type')
      INSERT INTO dbo.[REF_FIELD_MAPPING]([CDM_TABLE_NAME],[CDM_COLUMN_NAME],[INT_TABLE_NAME],[INT_COLUMN_NAME]) VALUES('PREP_PAYSLIPS_DETAILS','SUB_TYPE','PAYCODE_MAPPING','Pay Type')
      INSERT INTO dbo.[REF_FIELD_MAPPING]([CDM_TABLE_NAME],[CDM_COLUMN_NAME],[INT_TABLE_NAME],[INT_COLUMN_NAME]) VALUES('PREP_PAYSLIPS_DETAILS','HOURS','PAYSLIP_DETAIL','HOURS')
      INSERT INTO dbo.[REF_FIELD_MAPPING]([CDM_TABLE_NAME],[CDM_COLUMN_NAME],[INT_TABLE_NAME],[INT_COLUMN_NAME]) VALUES('PREP_PAYSLIPS_DETAILS','AMOUNT','PAYSLIP_DETAIL','AMOUNT')
      INSERT INTO dbo.[REF_FIELD_MAPPING]([CDM_TABLE_NAME],[CDM_COLUMN_NAME],[INT_TABLE_NAME],[INT_COLUMN_NAME]) VALUES('PREP_PAYSLIPS_DETAILS','COMPANY_AMOUNT','PAYSLIP_DETAIL','COMPANY_AMOUNT')
      INSERT INTO dbo.[REF_FIELD_MAPPING]([CDM_TABLE_NAME],[CDM_COLUMN_NAME],[INT_TABLE_NAME],[INT_COLUMN_NAME]) VALUES('PREP_PAYSLIPS_DETAILS','DESCRIPTION','PAYSLIP_DETAIL','DESCRIPTION')
      INSERT INTO dbo.[REF_FIELD_MAPPING]([CDM_TABLE_NAME],[CDM_COLUMN_NAME],[INT_TABLE_NAME],[INT_COLUMN_NAME]) VALUES('PREP_PAYSLIPS_DETAILS','SYSTEM_NAME','PAYSLIP_DETAIL','SYSTEM_NAME')
      INSERT INTO dbo.[REF_FIELD_MAPPING]([CDM_TABLE_NAME],[CDM_COLUMN_NAME],[INT_TABLE_NAME],[INT_COLUMN_NAME]) VALUES('PREP_PAYSLIPS_DETAILS','PAYRATE','PAYSLIP_DETAIL','PAYRATE')
      INSERT INTO dbo.[REF_FIELD_MAPPING]([CDM_TABLE_NAME],[CDM_COLUMN_NAME],[INT_TABLE_NAME],[INT_COLUMN_NAME]) VALUES('PREP_PAYSLIPS_DETAILS','START_DATE','PAYSLIP_DETAIL','START_DATE')
      INSERT INTO dbo.[REF_FIELD_MAPPING]([CDM_TABLE_NAME],[CDM_COLUMN_NAME],[INT_TABLE_NAME],[INT_COLUMN_NAME]) VALUES('PREP_PAYSLIPS_DETAILS','END_DATE','PAYSLIP_DETAIL','END_DATE')
      INSERT INTO dbo.[REF_FIELD_MAPPING]([CDM_TABLE_NAME],[CDM_COLUMN_NAME],[INT_TABLE_NAME],[INT_COLUMN_NAME]) VALUES('PREP_PAYSLIPS_HEADER','PAYSLIP_ID','PAYSLIP_HEADER','EMPLOYEE_ID')
      INSERT INTO dbo.[REF_FIELD_MAPPING]([CDM_TABLE_NAME],[CDM_COLUMN_NAME],[INT_TABLE_NAME],[INT_COLUMN_NAME]) VALUES('PREP_PAYSLIPS_HEADER','PAYSLIP_ID','PAYSLIP_HEADER','PAY_RUN_ID')
      INSERT INTO dbo.[REF_FIELD_MAPPING]([CDM_TABLE_NAME],[CDM_COLUMN_NAME],[INT_TABLE_NAME],[INT_COLUMN_NAME]) VALUES('PREP_PAYSLIPS_HEADER','PAYMENT_DATE','PAYSLIP_HEADER','PAYMENT_DATE')
      INSERT INTO dbo.[REF_FIELD_MAPPING]([CDM_TABLE_NAME],[CDM_COLUMN_NAME],[INT_TABLE_NAME],[INT_COLUMN_NAME]) VALUES('PREP_PAYSLIPS_HEADER','SYSTEM_NAME','PAYSLIP_HEADER','SYSTEM_NAME')
      INSERT INTO dbo.[REF_FIELD_MAPPING]([CDM_TABLE_NAME],[CDM_COLUMN_NAME],[INT_TABLE_NAME],[INT_COLUMN_NAME]) VALUES('PREP_PAYSLIPS_HEADER','EMPLOYEE_ID','PAYSLIP_HEADER','EMPLOYEE_ID')
      INSERT INTO dbo.[REF_FIELD_MAPPING]([CDM_TABLE_NAME],[CDM_COLUMN_NAME],[INT_TABLE_NAME],[INT_COLUMN_NAME]) VALUES('PREP_PAYSLIPS_HEADER','BASE_VALUE','PAYSLIP_HEADER','BASE_VALUE')
      INSERT INTO dbo.[REF_FIELD_MAPPING]([CDM_TABLE_NAME],[CDM_COLUMN_NAME],[INT_TABLE_NAME],[INT_COLUMN_NAME]) VALUES('PREP_PAYSLIPS_HEADER','OVERTIME_VALUE','PAYSLIP_HEADER','OVERTIME_VALUE')
      INSERT INTO dbo.[REF_FIELD_MAPPING]([CDM_TABLE_NAME],[CDM_COLUMN_NAME],[INT_TABLE_NAME],[INT_COLUMN_NAME]) VALUES('PREP_PAYSLIPS_HEADER','PWC_NET_AMOUNT','PAYSLIP_HEADER','PWC_NET_AMOUNT')
      INSERT INTO dbo.[REF_FIELD_MAPPING]([CDM_TABLE_NAME],[CDM_COLUMN_NAME],[INT_TABLE_NAME],[INT_COLUMN_NAME]) VALUES('PREP_PAYSLIPS_HEADER','PAY_PERIOD','PAYSLIP_HEADER','PAY_PERIOD')
      INSERT INTO dbo.[REF_FIELD_MAPPING]([CDM_TABLE_NAME],[CDM_COLUMN_NAME],[INT_TABLE_NAME],[INT_COLUMN_NAME]) VALUES('PREP_PAYSLIPS_HEADER','ADDITIONS_BEFORE_TAX','PAYSLIP_HEADER','ADDITIONS_BEFORE_TAX')
      INSERT INTO dbo.[REF_FIELD_MAPPING]([CDM_TABLE_NAME],[CDM_COLUMN_NAME],[INT_TABLE_NAME],[INT_COLUMN_NAME]) VALUES('PREP_PAYSLIPS_HEADER','GROSS','PAYSLIP_HEADER','GROSS')
      INSERT INTO dbo.[REF_FIELD_MAPPING]([CDM_TABLE_NAME],[CDM_COLUMN_NAME],[INT_TABLE_NAME],[INT_COLUMN_NAME]) VALUES('PREP_PAYSLIPS_HEADER','DEDUCTIONS_BEFORE_TAX','PAYSLIP_HEADER','DEDUCTIONS_BEFORE_TAX')
      INSERT INTO dbo.[REF_FIELD_MAPPING]([CDM_TABLE_NAME],[CDM_COLUMN_NAME],[INT_TABLE_NAME],[INT_COLUMN_NAME]) VALUES('PREP_PAYSLIPS_HEADER','TAXABLE_INCOME','PAYSLIP_HEADER','TAXABLE_INCOME')
      INSERT INTO dbo.[REF_FIELD_MAPPING]([CDM_TABLE_NAME],[CDM_COLUMN_NAME],[INT_TABLE_NAME],[INT_COLUMN_NAME]) VALUES('PREP_PAYSLIPS_HEADER','TAX','PAYSLIP_HEADER','TAX')
      INSERT INTO dbo.[REF_FIELD_MAPPING]([CDM_TABLE_NAME],[CDM_COLUMN_NAME],[INT_TABLE_NAME],[INT_COLUMN_NAME]) VALUES('PREP_PAYSLIPS_HEADER','ADDITIONS_AFTER_TAX','PAYSLIP_HEADER','ADDITIONS_AFTER_TAX')
      INSERT INTO dbo.[REF_FIELD_MAPPING]([CDM_TABLE_NAME],[CDM_COLUMN_NAME],[INT_TABLE_NAME],[INT_COLUMN_NAME]) VALUES('PREP_PAYSLIPS_HEADER','DEDUCTIONS_AFTER_TAX','PAYSLIP_HEADER','DEDUCTIONS_AFTER_TAX')
      INSERT INTO dbo.[REF_FIELD_MAPPING]([CDM_TABLE_NAME],[CDM_COLUMN_NAME],[INT_TABLE_NAME],[INT_COLUMN_NAME]) VALUES('PREP_PAYSLIPS_HEADER','NET','PAYSLIP_HEADER','NET')
      INSERT INTO dbo.[REF_FIELD_MAPPING]([CDM_TABLE_NAME],[CDM_COLUMN_NAME],[INT_TABLE_NAME],[INT_COLUMN_NAME]) VALUES('PREP_PAYSLIPS_HEADER','SUPER','PAYSLIP_HEADER','SUPER')
      INSERT INTO dbo.[REF_FIELD_MAPPING]([CDM_TABLE_NAME],[CDM_COLUMN_NAME],[INT_TABLE_NAME],[INT_COLUMN_NAME]) VALUES('PREP_PAYSLIPS_HEADER','ACCRUED_LEAVE','','')
      INSERT INTO dbo.[REF_FIELD_MAPPING]([CDM_TABLE_NAME],[CDM_COLUMN_NAME],[INT_TABLE_NAME],[INT_COLUMN_NAME]) VALUES('PREP_PAYSLIPS_HEADER','PWC_GROSS_AMOUNT','PAYSLIP_HEADER','PWC_GROSS_AMOUNT')
      INSERT INTO dbo.[REF_FIELD_MAPPING]([CDM_TABLE_NAME],[CDM_COLUMN_NAME],[INT_TABLE_NAME],[INT_COLUMN_NAME]) VALUES('PREP_PAYSLIPS_HEADER','PAY_RUN_ID','PAYSLIP_HEADER','PAY_RUN_ID')
      INSERT INTO dbo.[REF_FIELD_MAPPING]([CDM_TABLE_NAME],[CDM_COLUMN_NAME],[INT_TABLE_NAME],[INT_COLUMN_NAME]) VALUES('PREP_PAYSLIPS_HEADER','PAY_YEAR','PAYSLIP_HEADER','PAY_YEAR')
      INSERT INTO dbo.[REF_FIELD_MAPPING]([CDM_TABLE_NAME],[CDM_COLUMN_NAME],[INT_TABLE_NAME],[INT_COLUMN_NAME]) VALUES('PREP_PAYSLIPS_HEADER','COMPANY','PAYSLIP_HEADER','COMPANY')
      INSERT INTO dbo.[REF_FIELD_MAPPING]([CDM_TABLE_NAME],[CDM_COLUMN_NAME],[INT_TABLE_NAME],[INT_COLUMN_NAME]) VALUES('PREP_PAYSLIPS_HEADER','DEPARTMENT','PAYSLIP_HEADER','DEPARTMENT')
      INSERT INTO dbo.[REF_FIELD_MAPPING]([CDM_TABLE_NAME],[CDM_COLUMN_NAME],[INT_TABLE_NAME],[INT_COLUMN_NAME]) VALUES('PREP_PAYSLIPS_HEADER','PAYMENT_DATE','PAYSLIP_HEADER','PAYMENT_DATE')
      INSERT INTO dbo.[REF_FIELD_MAPPING]([CDM_TABLE_NAME],[CDM_COLUMN_NAME],[INT_TABLE_NAME],[INT_COLUMN_NAME]) VALUES('PREP_PAYSLIPS_HEADER','PAY_PERIOD_FROM','PAYSLIP_HEADER','PAY_PERIOD_FROM')
      INSERT INTO dbo.[REF_FIELD_MAPPING]([CDM_TABLE_NAME],[CDM_COLUMN_NAME],[INT_TABLE_NAME],[INT_COLUMN_NAME]) VALUES('PREP_PAYSLIPS_HEADER','PAY_PERIOD_TO','PAYSLIP_HEADER','PAY_PERIOD_TO')
      INSERT INTO dbo.[REF_FIELD_MAPPING]([CDM_TABLE_NAME],[CDM_COLUMN_NAME],[INT_TABLE_NAME],[INT_COLUMN_NAME]) VALUES('PREP_PAYSLIPS_HEADER','REGULAR_HOURS','PAYSLIP_HEADER','REGULAR_HOURS')
      INSERT INTO dbo.[REF_FIELD_MAPPING]([CDM_TABLE_NAME],[CDM_COLUMN_NAME],[INT_TABLE_NAME],[INT_COLUMN_NAME]) VALUES('PREP_PAYSLIPS_HEADER','OVERTIME_HOURS','PAYSLIP_HEADER','OVERTIME_HOURS')
      INSERT INTO dbo.[REF_FIELD_MAPPING]([CDM_TABLE_NAME],[CDM_COLUMN_NAME],[INT_TABLE_NAME],[INT_COLUMN_NAME]) VALUES('PREP_PAYSLIPS_HEADER','AUTHORISED_BY','','')
      INSERT INTO dbo.[REF_FIELD_MAPPING]([CDM_TABLE_NAME],[CDM_COLUMN_NAME],[INT_TABLE_NAME],[INT_COLUMN_NAME]) VALUES('PREP_PAYSLIPS_HEADER','AUTHORISED_DATE','','')
      INSERT INTO dbo.[REF_FIELD_MAPPING]([CDM_TABLE_NAME],[CDM_COLUMN_NAME],[INT_TABLE_NAME],[INT_COLUMN_NAME]) VALUES('PREP_PAYSLIPS_HEADER','COMMENT','','')
      INSERT INTO dbo.[REF_FIELD_MAPPING]([CDM_TABLE_NAME],[CDM_COLUMN_NAME],[INT_TABLE_NAME],[INT_COLUMN_NAME]) VALUES('PREP_PAYSLIPS_HEADER','SYSTEM_NAME','PAYSLIP_HEADER','SYSTEM_NAME')
      INSERT INTO dbo.[REF_FIELD_MAPPING]([CDM_TABLE_NAME],[CDM_COLUMN_NAME],[INT_TABLE_NAME],[INT_COLUMN_NAME]) VALUES('PREP_PAYSLIPS_HEADER','PAYRATE_BASE','PAYSLIP_HEADER','PAYRATE_BASE')
      INSERT INTO dbo.[REF_FIELD_MAPPING]([CDM_TABLE_NAME],[CDM_COLUMN_NAME],[INT_TABLE_NAME],[INT_COLUMN_NAME]) VALUES('PREP_PAYSLIPS_HEADER','PAYRATE_OVERTIME','','')
      INSERT INTO dbo.[REF_FIELD_MAPPING]([CDM_TABLE_NAME],[CDM_COLUMN_NAME],[INT_TABLE_NAME],[INT_COLUMN_NAME]) VALUES('PREP_EMP_LEAVE_TAKEN','EMPLOYEE_ID','PAYSLIP_DETAIL','EMPLOYEE_ID')
      INSERT INTO dbo.[REF_FIELD_MAPPING]([CDM_TABLE_NAME],[CDM_COLUMN_NAME],[INT_TABLE_NAME],[INT_COLUMN_NAME]) VALUES('PREP_EMP_LEAVE_TAKEN','JOB_ID','PAYCODE_MAPPING','Pay Code')
      INSERT INTO dbo.[REF_FIELD_MAPPING]([CDM_TABLE_NAME],[CDM_COLUMN_NAME],[INT_TABLE_NAME],[INT_COLUMN_NAME]) VALUES('PREP_EMP_LEAVE_TAKEN','PAY_RUN_ID','PAYSLIP_DETAIL','PAY_RUN_ID')
      INSERT INTO dbo.[REF_FIELD_MAPPING]([CDM_TABLE_NAME],[CDM_COLUMN_NAME],[INT_TABLE_NAME],[INT_COLUMN_NAME]) VALUES('PREP_EMP_LEAVE_TAKEN','PAY_PERIOD','PAYSLIP_DETAIL','END_DATE')
      INSERT INTO dbo.[REF_FIELD_MAPPING]([CDM_TABLE_NAME],[CDM_COLUMN_NAME],[INT_TABLE_NAME],[INT_COLUMN_NAME]) VALUES('PREP_EMP_LEAVE_TAKEN','PAY_YEAR','PAYSLIP_DETAIL','END_DATE')
      INSERT INTO dbo.[REF_FIELD_MAPPING]([CDM_TABLE_NAME],[CDM_COLUMN_NAME],[INT_TABLE_NAME],[INT_COLUMN_NAME]) VALUES('PREP_EMP_LEAVE_TAKEN','PAYCODE_ID','PAYSLIP_DETAIL','Pay Code')
      INSERT INTO dbo.[REF_FIELD_MAPPING]([CDM_TABLE_NAME],[CDM_COLUMN_NAME],[INT_TABLE_NAME],[INT_COLUMN_NAME]) VALUES('PREP_EMP_LEAVE_TAKEN','PAYCODE_DESC','PAYCODE_MAPPING','Description')
      INSERT INTO dbo.[REF_FIELD_MAPPING]([CDM_TABLE_NAME],[CDM_COLUMN_NAME],[INT_TABLE_NAME],[INT_COLUMN_NAME]) VALUES('PREP_EMP_LEAVE_TAKEN','PAYSLIP_ID','PAYSLIP_DETAIL','EMPLOYEE_ID')
      INSERT INTO dbo.[REF_FIELD_MAPPING]([CDM_TABLE_NAME],[CDM_COLUMN_NAME],[INT_TABLE_NAME],[INT_COLUMN_NAME]) VALUES('PREP_EMP_LEAVE_TAKEN','PAYSLIP_ID','PAYSLIP_DETAIL','PAY_RUN_ID')
      INSERT INTO dbo.[REF_FIELD_MAPPING]([CDM_TABLE_NAME],[CDM_COLUMN_NAME],[INT_TABLE_NAME],[INT_COLUMN_NAME]) VALUES('PREP_EMP_LEAVE_TAKEN','LEAVE_TYPE','PAYCODE_MAPPING','Leave Type')
      INSERT INTO dbo.[REF_FIELD_MAPPING]([CDM_TABLE_NAME],[CDM_COLUMN_NAME],[INT_TABLE_NAME],[INT_COLUMN_NAME]) VALUES('PREP_EMP_LEAVE_TAKEN','LEAVE_TYPE_DESC','PAYCODE_MAPPING','DESCRIPTION')
      INSERT INTO dbo.[REF_FIELD_MAPPING]([CDM_TABLE_NAME],[CDM_COLUMN_NAME],[INT_TABLE_NAME],[INT_COLUMN_NAME]) VALUES('PREP_EMP_LEAVE_TAKEN','LEAVE_SUB_TYPE','PAYCODE_MAPPING','DESCRIPTION')
      INSERT INTO dbo.[REF_FIELD_MAPPING]([CDM_TABLE_NAME],[CDM_COLUMN_NAME],[INT_TABLE_NAME],[INT_COLUMN_NAME]) VALUES('PREP_EMP_LEAVE_TAKEN','HOURS','PAYSLIP_DETAIL','HOURS')
      INSERT INTO dbo.[REF_FIELD_MAPPING]([CDM_TABLE_NAME],[CDM_COLUMN_NAME],[INT_TABLE_NAME],[INT_COLUMN_NAME]) VALUES('PREP_EMP_LEAVE_TAKEN','AMOUNT','PAYSLIP_DETAIL','AMOUNT')
      INSERT INTO dbo.[REF_FIELD_MAPPING]([CDM_TABLE_NAME],[CDM_COLUMN_NAME],[INT_TABLE_NAME],[INT_COLUMN_NAME]) VALUES('PREP_EMP_LEAVE_TAKEN','DESCRIPTION','PAYSLIP_DETAIL','DESCRIPTION')
      INSERT INTO dbo.[REF_FIELD_MAPPING]([CDM_TABLE_NAME],[CDM_COLUMN_NAME],[INT_TABLE_NAME],[INT_COLUMN_NAME]) VALUES('PREP_EMP_LEAVE_TAKEN','SYSTEM_NAME','PAYSLIP_DETAIL','SYSTEM_NAME')
      INSERT INTO dbo.[REF_FIELD_MAPPING]([CDM_TABLE_NAME],[CDM_COLUMN_NAME],[INT_TABLE_NAME],[INT_COLUMN_NAME]) VALUES('PREP_EMP_LEAVE_TAKEN','PAYRATE','PAYSLIP_DETAIL','PAYRATE')
      INSERT INTO dbo.[REF_FIELD_MAPPING]([CDM_TABLE_NAME],[CDM_COLUMN_NAME],[INT_TABLE_NAME],[INT_COLUMN_NAME]) VALUES('PREP_EMP_LEAVE_TAKEN','START_DATE','PAYSLIP_HEADER','START_DATE')
      INSERT INTO dbo.[REF_FIELD_MAPPING]([CDM_TABLE_NAME],[CDM_COLUMN_NAME],[INT_TABLE_NAME],[INT_COLUMN_NAME]) VALUES('PREP_EMP_LEAVE_TAKEN','END_DATE','PAYSLIP_HEADER','END_DATE')
      INSERT INTO dbo.[REF_FIELD_MAPPING]([CDM_TABLE_NAME],[CDM_COLUMN_NAME],[INT_TABLE_NAME],[INT_COLUMN_NAME]) VALUES('PREP_EMP_LEAVE_TAKEN','DAYS','PAYSLIP_HEADER','HOURS')
      
      /**************************************************************************************************************
      03. INSERT DATA
      *************************************************************************************************************/
      ;WITH CTE_SRC
      AS 
      (
      SELECT 
      A.[DataSetName] as [INT_TABLE_NAME]
      ,C.[SourceFieldNotes] AS [INT_COLUMN_NAME]
      ,D.[SourceName] as [SOURCE_TABLE_NAME]
      ,C.[SourceFieldName] as [SOURCE_COLUMN_NAME]
      FROM [^BIA CAF].[Management].[ProjectTypeDataSet] A
      LEFT JOIN [^BIA CAF].[Management].[ProjectTypeDataSetField] B
      ON A.[DataSetCode]=B.[DataSetCode]
      LEFT JOIN [^BIA CAF].[Management].[ProjectTypeDataSetFieldSource] C
      ON B.[DataSetFieldCode]=C.[DataSetFieldCode]
      LEFT JOIN [Store].[DataSet] D
      ON A.[DataSetName]=D.[DataSetName] 
      LEFT JOIN [^BIA CAF].[Management].[Project] E
      on E.[ProjectTypeCode]=A.[ProjectTypeCode]
      where D.[SourceName] is not null and E.[ProjectDatabaseName] =  
      (
      SELECT SUBSTRING([name],1,(LEN([name])-4))
      FROM [sys].[database_files]
      where [type_desc]='LOG'
      )
      )
      UPDATE REF_FIELD_MAPPING
      SET REF_FIELD_MAPPING.[SOURCE_TABLE_NAME] = CTE_SRC.[SOURCE_TABLE_NAME],
      REF_FIELD_MAPPING.[SOURCE_COLUMN_NAME] = CTE_SRC.[SOURCE_COLUMN_NAME],
      REF_FIELD_MAPPING.[INT_TABLE_NAME]=CTE_SRC.[INT_TABLE_NAME],
      REF_FIELD_MAPPING.[INT_COLUMN_NAME]=CTE_SRC.[INT_COLUMN_NAME]
      FROM DBO.[REF_FIELD_MAPPING] REF_FIELD_MAPPING
      LEFT JOIN 
      CTE_SRC 
      ON REF_FIELD_MAPPING.[INT_TABLE_NAME]=CTE_SRC.[INT_TABLE_NAME] AND REF_FIELD_MAPPING.[INT_COLUMN_NAME]= CTE_SRC.[INT_COLUMN_NAME];
      
      /**************************************************************************************************************
      04. CREATE INDEX ON TABLE
      *************************************************************************************************************/ 
      
      CREATE INDEX [ID_CDM_TABLE_NAME]
      ON [REF_FIELD_MAPPING] (
      CDM_TABLE_NAME
      )
      
      CREATE INDEX [ID_CDM_COLUMN_NAME]
      ON [REF_FIELD_MAPPING] (
      CDM_COLUMN_NAME
      )
      
      CREATE INDEX [ID_INT_TABLE_NAME]
      ON [REF_FIELD_MAPPING] (
      INT_TABLE_NAME
      )
      
      CREATE INDEX [ID_INT_COLUMN_NAME]
      ON [REF_FIELD_MAPPING] (
      INT_COLUMN_NAME
      )
      CREATE INDEX [ID_SOURCE_TABLE_NAME]
      ON [REF_FIELD_MAPPING] (
      SOURCE_TABLE_NAME
      )
      
      CREATE INDEX [ID_SOURCE_COLUMN_NAME]
      ON [REF_FIELD_MAPPING] (
      SOURCE_COLUMN_NAME
      )USE [z'9bbaf92f-d960-4e33-a9cd-228c72cc97ef]
GO
      /****** Object:  StoredProcedure [dbo].[47.UPDATE_EMP_MASTER_WITH_DUMMY_RECORDS]    Script Date: 4/10/2018 10:58:40 AM ******/
      SET ANSI_NULLS ON
      GO
      SET QUOTED_IDENTIFIER ON
      GO
      ALTER PROC [dbo].[47.UPDATE_EMP_MASTER_WITH_DUMMY_RECORDS]
      AS
      
      /*********************************************************************************************************
      *                           DATA ASSURANCE                                                               *
      **********************************************************************************************************
      UPDATES            - Version 0.1 {19/02/2015} {Fei Li} - {Create base script}
      - Version 0.2 {14/06/2017} {Justin Moy} - {Renamed from DUMMY to * Not in master *}
      
      
      SCRIPT DESCRIPTION - {Update emp master with Dummy Records}
      
      
      TABLE INFORMATION
      INPUT TABLE(S)
      - N/A
      
      OUTPUT TABLE(S)
      - [DBO].[PREP_EMP_MASTER]
      - [DBO].[PREP_PAYSLIPS_HEADER]
      - [DBO].[PREP_PAYSLIPS_DETAILS]
      - [DBO].[PREP_BANK_EFT]
      
      SUMMARY OF SCRIPT  - 01. DROP TABLE STATEMENT
      - 02. CREATE TEMPORARY EMPLOYEE_ID TABLE FROM PAYSLIP AND EFT TABLE
      - 03. CREATE DUMMY RECORD IN EMP MASTER
      
      *********************************************************************************************************
      01. DROP TABLE STATEMENT
      ********************************************************************************************************/
      IF OBJECT_ID('tempdb..#TEMP_EMPLOYEE_ID') IS NOT NULL
      DROP TABLE #TEMP_EMPLOYEE_ID
      
      /******************************************************************************************************************
      02. CREATE TEMPORARY EMPLOYEE_ID TABLE FROM PAYSLIP AND EFT TABLE
      ******************************************************************************************************************/
      
      SELECT
      EMPLOYEE_ID,SYSTEM_NAME
      INTO 
      #TEMP_EMPLOYEE_ID 
      FROM 
      
      (
      SELECT DISTINCT PPH.EMPLOYEE_ID, PPH.SYSTEM_NAME
      FROM 
      [dbo].[PREP_PAYSLIPS_HEADER] AS PPH
      LEFT JOIN 
      [dbo].[PREP_EMP_MASTER] AS PEM
      ON 
      PPH.EMPLOYEE_ID = PEM.EMPLOYEE_ID
      WHERE 
      PEM.EMPLOYEE_ID IS NULL
      
      UNION 
      
      SELECT DISTINCT PPD.EMPLOYEE_ID, PPD.SYSTEM_NAME
      FROM 
      [dbo].[PREP_PAYSLIPS_DETAILS] AS PPD
      LEFT JOIN 
      [dbo].[PREP_EMP_MASTER] AS PEM
      ON 
      PPD.EMPLOYEE_ID = PEM.EMPLOYEE_ID
      WHERE 
      PEM.EMPLOYEE_ID IS NULL
      
      UNION
      
      SELECT DISTINCT EFT.EMPLOYEE_ID, EFT.SYSTEM_NAME
      FROM 
      [dbo].[PREP_BANK_EFT] AS EFT
      LEFT JOIN 
      [dbo].[PREP_EMP_MASTER] AS PEM
      ON 
      EFT.EMPLOYEE_ID = PEM.EMPLOYEE_ID
      WHERE 
      PEM.EMPLOYEE_ID IS NULL
      ) X
      
      
      
      /******************************************************************************************************************
      03. CREATE DUMMY RECORD IN EMP MASTER
      ******************************************************************************************************************/
      
      INSERT INTO [DBO].[PREP_EMP_MASTER]
      (
      [EMPLOYEE_ID]
      ,[SURNAME]
      ,[FIRST_NAME]
      ,[SECOND_NAME]
      ,[THIRD_NAME]
      ,[FOURTH_NAME]
      ,[INITIAL]
      ,[COMPANY]
      ,[DEPARTMENT]
      ,[SUB_DEPARTMENT]
      ,[POSITION]
      ,[LOCATION]
      ,[TYPE]
      ,[STATUS]
      ,[START_DATE]
      ,[TERM_DATE]
      ,[TERM_REASON]
      ,[DOB]
      ,[TFN]
      ,[SUPER_NUMBER]
      ,[GENDER]
      ,[SYSTEM_NAME]
      ,[PWC_EMPLOYEE_NAME]
      ,[PWC_TFN]
      ,[PWC_SUPERANNUATION_NUMBER]
      ,[PWC_TERMINATED_FLAG]
      ,[PWC_EMPLOYEE_TESTS_FAILED]
      ,[PWC_PAYSLIP_TESTS_FAILED]
      ,[PWC_LEAVE_TESTS_FAILED]
      ,[PWC_PAYSLIP_COUNT]
      ,[PWC_TOTAL_GROSS]
      ,[PWC_TOTAL_NET]
      ,[PWC_TOTAL_TAX]
      ,[PWC_TOTAL_SUPER]
      ,[PWC_TERMINATION_DATE]
      ,[PWC_AGE]
      ,[PWC_AGE_GROUP]
      ,[PWC_TENURE]
      ,[PWC_TENURE_GROUP]
      ,[PWC_BEGINNING_ACTIVE_EMPLOYEE]
      ,[PWC_NEW_HIRE]
      ,[PWC_TERMINATED]
      ,[PWC_ENDING_ACTIVE_EMPLOYEE]
      )
      
      SELECT DISTINCT
      [EMPLOYEE_ID]
      ,NULL
      ,NULL
      ,NULL
      ,NULL
      ,NULL
      ,NULL
      ,'* Not in master *'
      ,'* Not in master *'
      ,NULL
      ,'* Not in master *'
      ,NULL
      ,'* Not in master *'
      ,'* Not in master *'
      ,NULL
      ,NULL
      ,NULL
      ,NULL
      ,NULL
      ,NULL
      ,'* Not in master *'
      ,[SYSTEM_NAME]
      ,'* Not in master *'
      ,NULL
      ,NULL
      ,NULL
      ,NULL
      ,NULL
      ,NULL
      ,NULL
      ,NULL
      ,NULL
      ,NULL
      ,NULL
      ,NULL
      ,NULL
      ,NULL
      ,NULL
      ,NULL
      ,NULL
      ,NULL
      ,NULL
      ,NULL
      FROM 
      #TEMP_EMPLOYEE_ID AS TEMP
      
      /******************************************************************************************************************
      04. UPDATE RECORD IN EMP MASTER
      ******************************************************************************************************************/
      
      UPDATE 
      [dbo].[PREP_EMP_MASTER] 
      SET 
      COMPANY=PPH.COMPANY,DEPARTMENT=PPH.DEPARTMENT
      FROM 
      [dbo].[PREP_PAYSLIPS_HEADER] PPH
      RIGHT JOIN 
      #TEMP_EMPLOYEE_ID TEMP
      ON 
      PPH.EMPLOYEE_ID=TEMP.EMPLOYEE_ID AND PPH.SYSTEM_NAME=TEMP.SYSTEM_NAME
      WHERE 
      PPH.COMPANY IS NOT NULL OR PPH.DEPARTMENT IS NOT NULL
      USE [z'c40ee561-6d97-44f0-b4ca-46a9db4b5b99]
      GO
      /****** Object:  StoredProcedure [Manage].[MAN001]    Script Date: 19/09/2018 8:57:30 AM ******/
      SET ANSI_NULLS ON
      GO
      SET QUOTED_IDENTIFIER ON
      GO
      ALTER PROC [Manage].[MAN001]
      AS
      
      /*********************************************************************
      *                           DATA ASSURANCE                           *
      **********************************************************************
      SCRIPT REFERENCE - MAN001
      SCRIPT DESCRIPTION -Populate log with scripts to process
      
      UPDATES            - Version 0.1 {04/03/2016} {Russell Taylor} - {Notes}
      
      
      TABLE INFORMATION
      INPUT TABLE(S)
      - [Store].[Process]
      
      OUTPUT TABLE(S)
      - [Manage].[Log]
      
      SUMMARY OF SCRIPT	-	1 Populdate management log 
      
      **********************************************************************
      01. START
      **********************************************************************/
      RAISERROR('>START MAN001 - Populate log',0,1) WITH NOWAIT
      
      /**********************************************************************
      02. Insert data into [Manage].[Log]
      **********************************************************************/
      RAISERROR('..+Insert data into [Manage].[Log]',0,1) WITH NOWAIT
      
      TRUNCATE TABLE [Manage].[Log]
      
      INSERT INTO [Manage].[Log]
      (
      [ScriptSequence]
      ,[ScriptTypeName]
      ,[ScriptReference]
      ,[ScriptName]
      ,[ScriptNarration]
      )
      SELECT 
      [ScriptSequence]
      ,[ScriptTypeName]
      ,[ScriptReference]
      ,[ScriptName]
      ,[ScriptNarration]
      FROM[Store].[Process]
      WHERE [ScriptReference] not in ('SET001','MAN003')
      
      
      /**********************************************************************
      03. Update log with proc name [Manage].[Log] 
      **********************************************************************/
      RAISERROR('..+Update log with proc name [Manage].[Log]',0,1) WITH NOWAIT
      
      UPDATE		[Manage].[Log]
      SET			[SystemScriptName] = '[' + sc.name + '].[' + obj.name + ']'
      FROM		[Manage].[Log] AS L
      JOIN		[sys].[objects] AS obj
      ON			left([obj].[name],6) = L.[ScriptReference]
      JOIN		[sys].[schemas] AS sc
      ON			[sc].[schema_id] = obj.[schema_id]  
      
      /*********************************************************************
      04. END
      **********************************************************************/
      RAISERROR('>COMPLETE PRP001 - Populate log',0,1) WITH NOWAITUSE [z'c40ee561-6d97-44f0-b4ca-46a9db4b5b99]
      GO
      /****** Object:  StoredProcedure [Manage].[MAN002]    Script Date: 19/09/2018 8:57:04 AM ******/
      SET ANSI_NULLS ON
      GO
      SET QUOTED_IDENTIFIER ON
      GO
      ALTER PROC [Manage].[MAN002]
      AS
      
      /*********************************************************************
      *                           DATA ASSURANCE                           *
      **********************************************************************
      SCRIPT REFERENCE   - MAN002
      SCRIPT DESCRIPTION - Process all scripts 
      
      
      UPDATES            - Version 1.0 {24/03/2016} {Russell Taylor} - {Notes}
      
      TABLE INFORMATION
      INPUT TABLE(S)
      - NO INPUT REQUIRED
      
      OUTPUT TABLE(S)
      - [Manage].[ErrorMessage]
      
      SUMMARY OF SCRIPT	-	Create dynamic sql script and exec procs with error handeling. 
      
      *********************************************************************
      01. START
      **********************************************************************/
      RAISERROR('>START SET001 - Run project',0,1) WITH NOWAIT
      
      TRUNCATE TABLE [Manage].[ErrorMessage]
      
      /*********************************************************************
      02. Run mangaement script 2 [Manage].[MAN002]
      **********************************************************************/
      RAISERROR('..+Run mangaement script 2 [Manage].[MAN002]',0,1) WITH NOWAIT
      
      DECLARE @ScriptToRun as NVARCHAR(50);
      DECLARE @Scrips as CURSOR;
      
      SET @Scrips = CURSOR FOR SELECT [SystemScriptName] FROM [Manage].[Log] ORDER BY [ScriptSequence];
      
      OPEN @Scrips;
      FETCH NEXT FROM @Scrips INTO @ScriptToRun;
      
      WHILE @@FETCH_STATUS = 0
      BEGIN
      
      -- Set and Prep scripts
      IF Left(@ScriptToRun,15) IN ('[Prepared].[SET','[Prepared].[PRP','[Prepared].[AUD')
      BEGIN
      EXEC ('EXEC ' + @ScriptToRun + '');
      END 
      
      -- Test loop
      IF Left(@ScriptToRun,13) = '[Result].[TST'
      BEGIN
      EXEC 
      ('BEGIN TRY EXEC ' + @ScriptToRun + ' END TRY
      BEGIN CATCH
      INSERT INTO [Manage].[ErrorMessage]
      (
      [ErrorNumber],
      [ErrorSeverity],
      [ErrorState],
      [ErrorProcedure],
      [ErrorLine],
      [ErrorMessage]
      )
      SELECT 
      ERROR_NUMBER()  
      ,ERROR_SEVERITY()
      ,ERROR_STATE()
      ,ERROR_PROCEDURE()
      ,ERROR_LINE() 
      ,ERROR_MESSAGE() 
      ;
      END CATCH'
      );
      END 
      
      FETCH NEXT FROM @Scrips INTO @ScriptToRun;
      END
      
      CLOSE @Scrips;
      DEALLOCATE @Scrips;
      
      
      /*********************************************************************
      03. Update log with error message
      **********************************************************************/
      RAISERROR('..+ Update log with error message into [Manage].[Log]',0,1) WITH NOWAIT
      
      UPDATE		[Manage].[Log]
      SET			[ErrorNumber] = EM.[ErrorNumber]
      ,			[ErrorLine] = EM.[ErrorLine]
      ,			[ErrorMessage] = EM.[ErrorMessage]
      FROM		[Manage].[Log] AS L
      JOIN		[Manage].[ErrorMessage] as EM
      ON			left(L.[ScriptReference],6) = left(EM.[ErrorProcedure],6)
      
      
      /*********************************************************************
      04. START
      **********************************************************************/
      RAISERROR('>COMPLETE SET001 - Run project',0,1) WITH NOWAITUSE [z'c40ee561-6d97-44f0-b4ca-46a9db4b5b99]
      GO
      /****** Object:  StoredProcedure [Prepared].[PRP001_Entity]    Script Date: 19/09/2018 8:47:37 AM ******/
      SET ANSI_NULLS ON
      GO
      SET QUOTED_IDENTIFIER ON
      GO
      ALTER PROC [Prepared].[PRP001_Entity]
      AS
      
      /*********************************************************************
      *                           DATA ASSURANCE                           *
      **********************************************************************
      SCRIPT REFERENCE - PRP001
      SCRIPT DESCRIPTION - Create In-scope company list
      
      UPDATES            - Version 0.1 {04/03/2016} {Russell Taylor} - {Notes}
      
      
      TABLE INFORMATION
      INPUT TABLE(S)
      - [Store].[Entity]
      
      OUTPUT TABLE(S)
      - [Prepared].[Entity]
      
      SUMMARY OF SCRIPT	-	1 Create a distinct list of in-scope entities
      2 Allocate and review period all in-scope entities 
      
      **********************************************************************
      01. START
      **********************************************************************/
      RAISERROR('>START PRP001 - Create In-scope company list',0,1) WITH NOWAIT
      /**********************************************************************
      02. CREATE ENTITY INFORMATION 
      **********************************************************************/
      RAISERROR('..+Insert data into [Prepared].[Entity]',0,1) WITH NOWAIT
      
      TRUNCATE TABLE [Prepared].[Entity]
      
      INSERT INTO [Prepared].[Entity]
      (
      [EntityID], 
      [EntityName],
      [EntityCurrency],
      [EntityPeriodStart],
      [EntityPeriodeEnd]
      )
      
      SELECT		DISTINCT
      A.[EntityID],
      A.[EntityName],
      A.[EntityCurrency],
      -- Cross join to allocate the defuault (all) entity to and from date to all entities  
      COALESCE(A.[EntityPeriodStart],B.[EntityPeriodStart]) AS [EntityPeriodStart],
      COALESCE(A.[EntityPeriodEnd],B.[EntityPeriodEnd]) AS [EntityPeriodEnd]
      FROM		[Store].[Entity] AS A, 
      (
      SELECT	*
      FROM	[Store].[Entity] 
      WHERE	[EntityID] = '####'
      ) AS B
      -- Exclude where the user has not select an entity to run 
      WHERE		A.[EntityEnabled] = 1
      -- Exclude default (all) entity from list
      AND			A.[EntityID] <> '####'
      
      /**********************************************************************
      03. UPDATE ENTITY INFORMATION 
      **********************************************************************/
      RAISERROR('..+Update language keys [Prepared].[Entity]',0,1) WITH NOWAIT
      
      UPDATE	[Prepared].[Entity]
      SET		[ChartOfAccounts] = CM.[ChartOfAccounts],
      [City] = CM.[City],
      [LanguageKey] = CM.[LanguageKey]
      FROM	[Prepared].[Entity] A
      JOIN	[Interface].[CompanyMaster] AS CM
      ON		A.[EntityID] = CM.[CompanyCode]
      
      /*********************************************************************
      04. END
      **********************************************************************/
      RAISERROR('>COMPLETE PRP001 - Create In-scope company list',0,1) WITH NOWAITUSE [z'c40ee561-6d97-44f0-b4ca-46a9db4b5b99]
      GO
      /****** Object:  StoredProcedure [Prepared].[PRP002_VendorMaster]    Script Date: 19/09/2018 8:50:19 AM ******/
      SET ANSI_NULLS ON
      GO
      SET QUOTED_IDENTIFIER ON
      GO
      ALTER PROC [Prepared].[PRP002_VendorMaster]
      AS
      
      /*********************************************************************
      *                           DATA ASSURANCE                           *
      **********************************************************************
      SCRIPT REFERENCE - PRP002
      SCRIPT DESCRIPTION - Populate vendor master table
      
      UPDATES            - Version 1.0 {04/03/2016} {Russell Taylor} - {Create}
      - Version 1.1 {14/04/2016} {Russell Taylor} - {Add employee flag}
      - Version 1.2 {10/05/2016} {Russell Taylor} - {Fix bug}
      - Version 1.3 {08/08/2016} {Fei Li}	       - {Added [InterCo] is not null	 allows interco Flag to be free text}	
      
      TABLE INFORMATION
      INPUT TABLE(S)
      - [Store].[VendorMaser]
      - [Interface].[VendorIntercoFlag]
      
      OUTPUT TABLE(S)
      - [Prepared].[VendorMaser]
      
      SUMMARY OF SCRIPT	-	1 Insert vendor data
      2 Update with vendor intercompany flag
      
      **********************************************************************
      01. START
      **********************************************************************/
      RAISERROR('>START PRP002 - Populate vendor master ',0,1) WITH NOWAIT
      /**********************************************************************
      02. UPDATE ENTITY INFORMATION 
      **********************************************************************/
      RAISERROR('..+Insert data into [Prepared].[VendorMaster]',0,1) WITH NOWAIT
      
      TRUNCATE TABLE [Prepared].[VendorMaster]
      
      INSERT INTO [Prepared].[VendorMaster]
      (
      [VendorID]
      ,[VendorName]
      ,[VendorNameAlternitive]
      ,[VendorGroup]
      ,[VendorCountry]
      ,[Street]
      ,[City]
      ,[District]
      ,[Region]
      ,[PostalCode]
      ,[POBoxFlag_PWC]
      ,[AddressFlag_PWC]
      ,[CreatedOn]
      ,[CreatedBy]
      ,[CentralDeletionFlag]
      ,[CentralPostingBlock]
      ,[CentralPurchasingBlock]
      ,[OneTimeFlag]
      ,[ABN]
      ,[IntercompanyFlag_PWC]
      ,[EmployeeFlag_PWC]
      )
      
      SELECT 
      VM.[AccountNumberOfVendor] 
      ,IsNull([Name1],'No name') 
      ,Coalesce([Name2],[Name2],[Name3]) 
      ,[VendorAccountGroup] 
      ,[CountryKey] 
      ,Coalesce([Street],[POBox])
      ,Coalesce([City],[POBoxCity])
      ,[District]
      ,[Region] 
      ,Coalesce([PostalCode], [POBoxPostalCode])
      ,CASE 
      WHEN	[POBox] IS NOT NULL 
      THEN	1 
      WHEN	[Street] like '%PO%BOX%'
      THEN	1 
      WHEN	[Street] like '%LOCK%BAG%'
      THEN	1 
      ELSE	0 END 
      ,CASE WHEN Coalesce([Street],[POBox],[City],[POBoxCity],[District],[Region],[PostalCode],[POBoxPostalCode]) IS NOT NULL THEN 1 ELSE 0 END 
      ,[CreatedOn]
      ,[CreatedBy]
      ,IsNull([CentralDeletionFlag],'O')
      ,IsNull([CentralPostingBlock],'O')
      ,IsNull([CentralPurchasingBlock],'O')
      ,IsNull([One-TimeAccount],'O')
      ,[BIA].[TaxCleanAUABN](Coalesce([VATRegistrationNumber],[TaxNumber1],[TaxNumber2],[TaxNumber3],[TaxNumber4])) AS ABN
      ,CASE WHEN VF.[AccountNumberOfVendor] IS NOT NULL THEN 1 ELSE 0 END
      ,CASE WHEN [VendorAccountGroup] LIKE ('%EMP%') THEN 1 ELSE 0 END 
      FROM			[Interface].[VendorMaster] AS VM
      LEFT JOIN		(
      SELECT DISTINCT [AccountNumberOfVendor],[InterCo]
      FROM [Interface].[VendorIntercoFlag]
      WHERE [InterCo] is not null							-- Added on 08/08/2016: allows Intercoflag to be free text 
      ) AS VF
      ON				VM.[AccountNumberOfVendor] = VF.[AccountNumberOfVendor]
      
      /**********************************************************************
      03. END
      **********************************************************************/
      RAISERROR('>COMPLETE PRP002 - Populate vendor master ',0,1) WITH NOWAITUSE [z'c40ee561-6d97-44f0-b4ca-46a9db4b5b99]
      GO
      /****** Object:  StoredProcedure [Prepared].[PRP003_VendorContact]    Script Date: 19/09/2018 8:51:03 AM ******/
      SET ANSI_NULLS ON
      GO
      SET QUOTED_IDENTIFIER ON
      GO
      ALTER PROC [Prepared].[PRP003_VendorContact]
      AS
      
      /*********************************************************************
      *                           DATA ASSURANCE                           *
      **********************************************************************
      SCRIPT REFERENCE - PRP003
      SCRIPT DESCRIPTION - Populate vendor contract table
      
      UPDATES            - Version 1.0 {04/03/2016} {Russell Taylor} - {Notes}
      
      TABLE INFORMATION
      INPUT TABLE(S)
      - [Interface].[VendorMaster]
      - [Prepared].[VendorMaster] {PRP002}
      
      OUTPUT TABLE(S)
      - [Prepared].[VendorContact]
      
      SUMMARY OF SCRIPT	-	1 Create a distinct list vendor contacts 
      
      **********************************************************************
      01. START
      **********************************************************************/
      RAISERROR('>START PRP003 - Populate vendor contact table',0,1) WITH NOWAIT
      /*********************************************************************
      02. UPDATE ENTITY INFORMATION 
      **********************************************************************/
      RAISERROR('..+Insert data into [Prepared].[VendorContact]',0,1) WITH NOWAIT
      
      TRUNCATE TABLE [Prepared].[VendorContact]
      
      INSERT INTO [Prepared].[VendorContact]
      (
      [VENDOR_KEY_PWC]
      ,[VendorID]
      ,[ContactType]
      ,[ContactNumber]
      )
      
      SELECT  PVM.[VENDOR_KEY_PWC],
      PVM.VendorID,
      [PhoneType],
      [Telephone]
      FROM (
      SELECT		
      [AccountNumberOfVendor] AS VendorID
      ,'PHONE' AS [PhoneType]
      ,[Telephone1] AS [Telephone]
      ,0 AS [Duplicate_Phone_PWC]
      FROM		[Interface].[VendorMaster] AS IVM
      WHERE		[Telephone1] IS NOT NULL
      UNION ALL
      SELECT		
      [AccountNumberOfVendor] AS VendorID
      ,'PHONE' AS [PhoneType]
      ,[Telephone2] AS [Telephone]
      ,0 AS [Duplicate_Phone_PWC]
      FROM		[Interface].[VendorMaster] AS IVM
      WHERE		[Telephone2] IS NOT NULL
      UNION ALL
      SELECT		
      [AccountNumberOfVendor] AS VendorID
      ,'FAX' AS [PhoneType]
      ,[FaxNumber] AS [Telephone]
      ,0 AS [Duplicate_Phone_PWC]
      FROM		[Interface].[VendorMaster] AS IVM
      WHERE		[FaxNumber] IS NOT NULL
      ) VM
      JOIN		[Prepared].[VendorMaster] AS PVM
      ON			VM.VendorID = PVM.VendorID
      
      /*********************************************************************
      03. END
      **********************************************************************/
      RAISERROR('>COMPLETE PRP003 - Populate vendor contact table',0,1) WITH NOWAITUSE [z'c40ee561-6d97-44f0-b4ca-46a9db4b5b99]
      GO
      /****** Object:  StoredProcedure [Prepared].[PRP004_VendorBank]    Script Date: 19/09/2018 8:52:01 AM ******/
      SET ANSI_NULLS ON
      GO
      SET QUOTED_IDENTIFIER ON
      GO
      ALTER PROC [Prepared].[PRP004_VendorBank]
      AS
      
      /*********************************************************************
      *                           DATA ASSURANCE                           *
      **********************************************************************
      SCRIPT REFERENCE - PRP004
      SCRIPT DESCRIPTION - Populate vendor bank table
      
      UPDATES            - Version 0.1 {04/03/2016} {Russell Taylor} - {Notes}
      
      TABLE INFORMATION
      INPUT TABLE(S)
      - [Interface].[VendorMaster]
      - [Prepared].[VendorBank]  {PRP002}
      
      OUTPUT TABLE(S)
      - [Prepared].[VendorBank]
      
      SUMMARY OF SCRIPT	-	1 Create bank accounts per vendor
      
      **********************************************************************
      01. START
      **********************************************************************/
      RAISERROR('>START PRP004 - Populate vendor bank table',0,1) WITH NOWAIT
      /*********************************************************************
      02. UPDATE ENTITY INFORMATION 
      **********************************************************************/
      RAISERROR('..+Insert data into [Prepared].[VendorBank]',0,1) WITH NOWAIT
      
      TRUNCATE TABLE [Prepared].[VendorBank]
      
      INSERT INTO [Prepared].[VendorBank]
      (
      [VENDOR_KEY_PWC]
      ,[VendorID]
      ,[BSB]
      ,[BankAccount]
      ,[BankValidFrom]
      ,[BankValidTo]
      )
      
      SELECT		 PVM.[VENDOR_KEY_PWC]
      ,PVM.VendorID
      ,[BankKeys]
      ,[BankAccountNumber] 
      ,Convert(Date, IsNull([BankDetailsValidFrom],'1980-01-01'))
      ,Convert(Date, IsNull([BankDetailsValidTo],'2030-01-01'))
      FROM		[Interface].[VendorBankDetails] VBD
      JOIN		[Prepared].[VendorMaster] AS PVM
      ON			VBD.[AccountNumberOfVendor] = PVM.[VendorID]
      -- Don't include vendors that do not have a bank account
      WHERE		Isnull([BankKeys],'') <> '' 
      AND			IsNull([BankAccountNumber],'') <> ''
      
      /*********************************************************************
      03. END
      **********************************************************************/
      RAISERROR('>COMPLETE PRP004 - Populate vendor bank table',0,1) WITH NOWAITUSE [z'c40ee561-6d97-44f0-b4ca-46a9db4b5b99]
      GO
      /****** Object:  StoredProcedure [Prepared].[PRP005_VendorEntity]    Script Date: 19/09/2018 8:52:25 AM ******/
      SET ANSI_NULLS ON
      GO
      SET QUOTED_IDENTIFIER ON
      GO
      ALTER PROC [Prepared].[PRP005_VendorEntity]
      AS
      
      /*********************************************************************
      *                           DATA ASSURANCE                           *
      **********************************************************************
      SCRIPT REFERENCE - PRP005
      SCRIPT DESCRIPTION - Populate vendor entity table
      
      UPDATES            - Version 0.1 {04/03/2016} {Russell Taylor} - {Notes}
      
      TABLE INFORMATION
      INPUT TABLE(S)
      - [Interface].[VendorMaster]
      - [Prepared].[VendorBank]  {PRP002}
      
      OUTPUT TABLE(S)
      - [Prepared].[VendorBank]
      
      SUMMARY OF SCRIPT	-	1 Create bank accounts per vendor
      
      **********************************************************************
      01. START
      **********************************************************************/
      RAISERROR('>START PRP005 - Populate vendor bank table',0,1) WITH NOWAIT
      /*********************************************************************
      02. UPDATE ENTITY INFORMATION 
      **********************************************************************/
      RAISERROR('..+Insert data into [Prepared].[VendorEntity]',0,1) WITH NOWAIT
      
      TRUNCATE TABLE [Prepared].[VendorEntity]
      
      INSERT INTO [Prepared].[VendorEntity]
      (
      [VENDOR_KEY_PWC]
      ,[COMPANY_KEY_PWC]
      ,[DeletionFlag]
      ,[TermsCode]
      )
      
      SELECT		 PVM.[VENDOR_KEY_PWC]
      ,E.[COMPANY_KEY_PWC]
      ,CASE WHEN IsNull(VCC.[DeletionFlagForMasterRecord],'') = '' THEN '0' ELSE '1' END
      ,VCC.[TermsOfPaymentKey]
      FROM		[Interface].[VendorCompanyCodeLevel] VCC
      JOIN		[Prepared].[VendorMaster] AS PVM
      ON			VCC.[AccountNumberOfVendor] = PVM.[VendorID]
      JOIN		[Prepared].[Entity] AS E
      ON			VCC.[CompanyCode] = E.[EntityID]
      
      -- Don't include vendors with entity
      WHERE		Isnull([CompanyCode],'') <> '' 
      
      /*********************************************************************
      03. UPDATE descriptions
      **********************************************************************/
      RAISERROR('….+Update payment terms days [Prepared].[Journals]',0,1) WITH NOWAIT
      
      UPDATE		[Prepared].[VendorEntity]
      SET			[TermsCodeDays] = Convert(Int, PT.[DaysFromBaselineDateForPayment])
      FROM		[Prepared].[VendorEntity] AS J
      JOIN		[Interface].[PaymentTermsMaster] AS PT
      ON			J.[TermsCode] = PT.[TermsOfPaymentKey]
      ;
      
      
      /*********************************************************************
      03. END
      **********************************************************************/
      RAISERROR('>COMPLETE PRP005 - Populate vendor bank table',0,1) WITH NOWAITUSE [z'c40ee561-6d97-44f0-b4ca-46a9db4b5b99]
      GO
      /****** Object:  StoredProcedure [Prepared].[PRP006_Journal]    Script Date: 19/09/2018 8:52:51 AM ******/
      SET ANSI_NULLS ON
      GO
      SET QUOTED_IDENTIFIER ON
      GO
      ALTER PROC [Prepared].[PRP006_Journal]
      AS
      
      /*********************************************************************
      *                           DATA ASSURANCE                           *
      **********************************************************************
      SCRIPT REFERENCE - PRP006
      SCRIPT DESCRIPTION - Populate AP journals/invoices
      
      UPDATES            - Version 0.1 {04/03/2016} {Russell Taylor} - {Notes}
      
      TABLE INFORMATION
      INPUT TABLE(S)
      CORE
      - [Prepared].[Entity] {PRP001}
      - [Prepared].[VendorMaster] {PRP002}
      
      - [Interface].[JournalLine]
      - [Interface].[JournalHeader]
      
      SUPPORTING
      - [Interface].[PaymentTermsMaster]
      - [Interface].[AccountMasterDescription]
      - [Interface].[PostingKeyDescription]
      - [Interface].[DocumentTypeDescription]
      - [Interface].[TransactionCodeDescription]
      - [Interface].[UserNames]
      
      
      OUTPUT TABLE(S)
      - [Prepared].[Journal]
      
      SUMMARY OF SCRIPT	-	1 Create journal listing for all AP transacions
      
      **********************************************************************
      01. START
      **********************************************************************/
      RAISERROR('>START PRP006 - Populate AP journals/invoices',0,1) WITH NOWAIT
      
      /**********************************************************************
      02. DROP TABLE STATEMENT
      **********************************************************************/
      RAISERROR('..+Inilise script',0,1) WITH NOWAIT
      
      IF OBJECT_ID('#AccountListing') IS NOT NULL
      DROP TABLE #AccountListing
      
      /*********************************************************************
      03. INSERT DATA
      **********************************************************************/
      RAISERROR('..+Populdate journal data',0,1) WITH NOWAIT
      
      
      RAISERROR('....+Get all AP accounts [#AccountListing]',0,1) WITH NOWAIT
      -- 1: Create a listing of AP accounts impacted by an invoice or credit notes
      SELECT		DISTINCT 
      CompanyCode, 
      GLAccountID 
      INTO		[#AccountListing]
      FROM		[Interface].[JournalLine] AS JL
      LEFT JOIN	[Prepared].[Entity] AS E
      ON			JL.[CompanyCode] = E.EntityID
      WHERE		JL.PostingKeyCode in ('21','22','31','32')
      ;
      
      TRUNCATE TABLE [Prepared].[Journal]
      
      RAISERROR('....+Update [Prepared].[Journals]',0,1) WITH NOWAIT
      INSERT INTO [Prepared].[Journal]
      (
      [COMPANY_KEY_PWC]
      ,[VENDOR_KEY_PWC]
      ,[TransactionType_PWC]
      ,[TransactionSubType_PWC]
      ,[FiscalYear]
      ,[CompanyCode]
      ,[FiscalPeriod]
      ,[DocumentNumber]
      ,[DocumentDate]
      ,[PostingDate]
      ,[EntryDate]
      ,[EntryTime]
      ,[UserID]
      ,[TransactionCode]
      ,[DocumentTypeCode]
      ,[BusinessTransaction]
      ,[ReferenceKey]
      ,[PostingKey]
      ,[LineItem]
      ,[HeaderNarration]
      ,[AccountID]
      ,[SpecialGL]
      ,[ReverseFlag_PWC]
      ,[ReverseDocumentNo]
      ,[ReversalYear]
      ,[VendorID]
      ,[VendorInvoiceNumber]
      ,[AssignmentNumber]
      ,[CurrencyKeyDocument]
      ,[AmountDocument]
      ,[CurrencyKeylocal1]
      ,[AmountLocal1]
      ,[CurrencyKeylocal2]
      ,[AmountLocal2]
      ,[CurrencyKeylocal3]
      ,[AmountLocal3]
      ,[PurchaseFlag_PWC]
      ,[PurchaseNumber]
      ,[PurchaseLineItem]
      ,[TermsCode]
      ,[ClearingYear]
      ,[ClearingDocumentNumber]
      ,[ClearingPostingDate]
      ,[ClearingEntryDate]
      ,[Scope_PWC]
      ,[LanguageKey]
      )
      
      SELECT 
      [COMPANY_KEY_PWC]
      ,[VENDOR_KEY_PWC]
      ,CASE  
      WHEN JL.[PostingKeyCode] IN ('21','22','31','32') THEN 'INV'
      WHEN JL.[PostingKeyCode] IN ('25','35')          THEN 'PAY'
      ELSE 'OTH' END 
      ,CASE  
      WHEN JL.[PostingKeyCode] IN ('31','32') THEN 'IN'
      WHEN JL.[PostingKeyCode] IN ('21','22') THEN 'CN'
      WHEN JL.[PostingKeyCode] IN ('25')      THEN 'PA'
      WHEN JL.[PostingKeyCode] IN ('35')      THEN 'RP'
      ELSE 'OT' END 
      ,JH.[FiscalYear]
      ,JH.[CompanyCode]
      ,JH.[FiscalPeriod]
      ,JH.[DocumentNo]
      ,JH.[DocumentDate]
      ,JH.[PostingDate]
      ,JH.[EntryDate]
      ,JH.[EntryTime]
      ,JH.[UserCode]
      ,IsNull(JH.[TransactionCode],'No code')	   
      ,JH.[DocumentTypeCode]
      ,JH.[BusinessTransaction]
      ,JH.[ReferenceKey]
      ,JL.[PostingKeyCode]
      ,JL.[LineItem]
      ,JH.[HeaderNarration]
      ,JL.[GLAccountID] 
      ,JL.[SpecialGL]
      ,CASE WHEN JH.[ReverseDocumentNo] IS NULL THEN 0 ELSE 1 END 
      ,JH.[ReverseDocumentNo]
      ,JH.[ReversalYear]
      ,JL.[AccountNumberofVendor] 
      ,JH.[ReferenceDocumentNo] 
      ,JL.[AssignmentNumber]
      ,JH.[CurrencyKey] 
      
      -- Document values are updated to be Possitive for there respective transaction type 
      ,CASE 
      WHEN JL.[PostingKeyCode] IN ('21','22','31','32')	AND JL.[DR/CR]  = 'S' THEN (0-	JL.[AmountInDocumentCurrency])
      WHEN JL.[PostingKeyCode] IN ('21','22','31','32')	AND JL.[DR/CR]  = 'H' THEN		JL.[AmountInDocumentCurrency] 
      WHEN													JL.[DR/CR]  = 'S' THEN		JL.[AmountInDocumentCurrency] 				
      ELSE																			(0-	JL.[AmountInDocumentCurrency]) 
      END 
      
      ,JH.[LocalCurrency] 
      
      -- Local values are updated to be Possitive for there respective transaction type 
      ,CASE 
      WHEN JL.[PostingKeyCode] IN ('21','22','31','32')	AND JL.[DR/CR]  = 'S' THEN (0-	JL.[Amount])
      WHEN JL.[PostingKeyCode] IN ('21','22','31','32')	AND JL.[DR/CR]  = 'H' THEN		JL.[Amount] 
      WHEN													JL.[DR/CR]  = 'S' THEN		JL.[Amount] 				
      ELSE																			(0-	JL.[Amount]) 
      END 
      
      ,JH.[LocalCurrency2] 
      
      -- Local 2 values are updated to be Possitive for there respective transaction type 
      ,CASE 
      WHEN JL.[PostingKeyCode] IN ('21','22','31','32')	AND JL.[DR/CR]  = 'S' THEN (0-	JL.[AmountInLocalCurrency2])
      WHEN JL.[PostingKeyCode] IN ('21','22','31','32')	AND JL.[DR/CR]  = 'H' THEN		JL.[AmountInLocalCurrency2] 
      WHEN													JL.[DR/CR]  = 'S' THEN		JL.[AmountInLocalCurrency2] 				
      ELSE																			(0-	JL.[AmountInLocalCurrency2]) 
      END 
      
      ,JH.[LocalCurrency3] 
      
      -- Local 3 values are updated to be Possitive for there respective transaction type 
      ,CASE 
      WHEN JL.[PostingKeyCode] IN ('21','22','31','32')	AND JL.[DR/CR]  = 'S' THEN (0-	JL.[AmountInLocalCurrency3])
      WHEN JL.[PostingKeyCode] IN ('21','22','31','32')	AND JL.[DR/CR]  = 'H' THEN		JL.[AmountInLocalCurrency3] 
      WHEN													JL.[DR/CR]  = 'S' THEN		JL.[AmountInLocalCurrency3] 				
      ELSE																			(0-	JL.[AmountInLocalCurrency3]) 
      END 
      
      ,CASE WHEN JH.[BusinessTransaction] = 'RFBU' THEN 0 ELSE 1 END
      ,JL.[PurchasingDocumentNumber] 
      ,JL.[ItemNumberOfPurchasingDocument] 
      ,JL.[TermsOfPaymentKey]
      ,JL.[FiscalYearClearingDoc]
      ,JL.[ClearingDocumentNo]
      ,JL.[ClearingPostingDate]
      ,JL.[ClearingEntryDate]
      ,CASE WHEN JH.[PostingDate] > E.[EntityPeriodeEnd] THEN 0 ELSE 1 END
      ,E.[LanguageKey]
      FROM		[Interface].[JournalLine] AS JL	
      JOIN		[Interface].[JournalHeader] AS JH	
      ON			JL.CompanyCode = JH.CompanyCode
      AND			JL.DocumentNo = JH.DocumentNo
      AND			JL.FiscalYear = JH.FiscalYear
      JOIN		[#AccountListing] AS A
      ON			JL.GLAccountID = A.GLAccountID
      AND			JL.CompanyCode = A.CompanyCode
      JOIN		[Prepared].[Entity] AS E
      ON			JH.[CompanyCode] = E.[EntityID]
      JOIN		[Prepared].[VendorMaster] AS VM
      ON			JL.[AccountNumberofVendor] = VM.[VendorID]
      
      -- Exclude:
      -- 1) Journals not posted
      WHERE		IsNull(JH.[DocumentStatusCode],'') = ''
      -- 2) Journals posted after the review period start date
      AND			JH.[PostingDate] > = E.[EntityPeriodStart]
      
      /*********************************************************************
      03. UPDATE descriptions
      **********************************************************************/
      RAISERROR('....+Update user names [Prepared].[Journals]',0,1) WITH NOWAIT
      
      -- 1) update user name
      -- update user name
      UPDATE		[Prepared].[Journal]
      SET			[UserName] = UPPER(UN.[LastName]) + ', ' + UN.[Firstname]
      FROM		[Prepared].[Journal] AS J
      JOIN		[Interface].[UserNames] AS UN
      ON			J.[UserID] = UN.[User]
      WHERE		UN.[LastName] IS NOT NULL 
      AND			UN.[Firstname] IS NOT NULL
      ;	
      
      -- update user name
      UPDATE		[Prepared].[Journal]
      SET			[UserName] = 'BATCH, user'
      FROM		[Prepared].[Journal] AS J
      WHERE		Upper([UserID]) Like ('%BATCH%')
      AND			J.[UserName] = '(No name)'
      ;
      
      RAISERROR('....+Update transaction code descriptions [Prepared].[Journals]',0,1) WITH NOWAIT
      
      -- 2) update transaction code
      UPDATE		[Prepared].[Journal]
      SET			[TransactionCodeDescription] = IsNull(TC.[TransactionCodeDescription],'(No description)')
      FROM		[Prepared].[Journal] AS J
      JOIN		[Interface].[TransactionCodeDescription] AS TC
      ON			J.[TransactionCode] = TC.[TransactionCode]
      AND			J.[LanguageKey] = TC.[LanguageKey]
      ;
      
      RAISERROR('....+Update document type description [Prepared].[Journals]',0,1) WITH NOWAIT
      
      -- 3) update document type code
      UPDATE		[Prepared].[Journal]
      SET			[DocumentTypeDescription] = IsNull(DT.[DocumentTypeDescription],'(No description)')
      FROM		[Prepared].[Journal] AS J
      JOIN		[Interface].[DocumentTypeDescription] AS DT
      ON			J.[DocumentTypeCode] = DT.[DocumentType]
      AND			J.[LanguageKey] = DT.[LanguageKey]
      ;
      
      RAISERROR('....+Update posting key description [Prepared].[Journals]',0,1) WITH NOWAIT
      
      -- 4) update posting name
      UPDATE		[Prepared].[Journal]
      SET			[PostingKeyDescription] = IsNull(PK.[PostingKeyDescription],'(No description)')
      FROM		[Prepared].[Journal] AS J
      JOIN		[Interface].[PostingKeyDescription] AS PK
      ON			J.[PostingKey] = PK.[PostingKey]
      AND			IsNull(J.[SpecialGL],'X') = IsNull(PK.[SpecialGL],'X')
      AND			J.[LanguageKey] = PK.[LanguageKey]
      ;
      
      RAISERROR('....+Update account description [Prepared].[Journals]',0,1) WITH NOWAIT
      
      -- 5) update account name
      UPDATE		[Prepared].[Journal]
      SET			[AccountName] = IsNull(COA.[GLAccountDescription],'(No account name)')
      FROM		[Prepared].[Journal] AS J
      JOIN		[Interface].[AccountMasterDescription] AS COA
      ON			J.[AccountID] = COA.[GLAccountNumber]
      AND			J.[LanguageKey] = COA.[LanguageKey]
      JOIN		[Prepared].[Entity] AS E	
      ON			J.[CompanyCode] = E.[EntityID]
      AND			E.[ChartOfAccounts] = COA.[ChartOfAccountsCode]
      ;
      
      RAISERROR('....+Update payment terms days [Prepared].[Journals]',0,1) WITH NOWAIT
      
      -- 6) update terms days
      UPDATE		[Prepared].[Journal]
      SET			[TermsCodeDays] = Convert(Int, PT.[DaysFromBaselineDateForPayment])
      FROM		[Prepared].[Journal] AS J
      JOIN		[Interface].[PaymentTermsMaster] AS PT
      ON			J.[TermsCode] = PT.[TermsOfPaymentKey]
      ;
      
      RAISERROR('..-Populdate journal data',0,1) WITH NOWAIT
      
      -- 7) Update invoice key
      UPDATE		[Prepared].[Journal]
      SET			[JOURNAL_KEY_PWC] = JK.[INVOICE_KEY_PWC]
      ,			[INVOICE_KEY_PWC] = CASE WHEN JM.TransactionType_PWC = 'INV' THEN JK.[INVOICE_KEY_PWC] ELSE 0 END 
      
      -- 1.0: Master listing
      FROM		[Prepared].[Journal] AS JM
      
      -- 2.0: Distinct listng of journals/invoices
      JOIN		(
      SELECT		ROW_NUMBER() OVER (
      ORDER BY [CompanyCode], [FiscalPeriod], [DocumentNumber]) AS [INVOICE_KEY_PWC],
      [CompanyCode], 
      [FiscalPeriod], 
      [DocumentNumber]
      FROM		[Prepared].[Journal]
      GROUP BY 
      [CompanyCode], 
      [FiscalPeriod], 
      [DocumentNumber]
      ) AS JK
      ON			JM.[CompanyCode] = JK.[CompanyCode]
      AND			JM.[FiscalPeriod] = JK.[FiscalPeriod]
      AND			JM.[DocumentNumber] = JK.[DocumentNumber]
      ;
      
      /**********************************************************************
      03. CLOSE
      **********************************************************************/
      RAISERROR('>COMPLETE PRP006 - Populate AP journals/invoices',0,1) WITH NOWAITUSE [z'c40ee561-6d97-44f0-b4ca-46a9db4b5b99]
      GO
      /****** Object:  StoredProcedure [Prepared].[PRP007_Purchase]    Script Date: 19/09/2018 8:53:14 AM ******/
      SET ANSI_NULLS ON
      GO
      SET QUOTED_IDENTIFIER ON
      GO
      ALTER PROC [Prepared].[PRP007_Purchase]
      AS
      
      /*********************************************************************
      *                           DATA ASSURANCE                           *
      **********************************************************************
      SCRIPT REFERENCE - PRP007
      SCRIPT DESCRIPTION - Populate purchase table 
      
      UPDATES            - Version 0.1 {07/03/2016} {Fei Li} - {Notes}
      
      
      TABLE INFORMATION
      INPUT TABLE(S)
      CORE
      - [Interface].[PurchaseOrderHeader]
      - [Interface].[PurchaseOrderLines]
      
      SUPPORTING
      - [Interface].[PaymentTermsMaster]
      - [Interface].[UserNames]
      
      
      OUTPUT TABLE(S)
      - [Prepared].[Purchase]
      
      SUMMARY OF SCRIPT	-	1. Truncate table statement
      2. Insert data
      3. Update table description
      
      **********************************************************************
      01. START
      **********************************************************************/
      RAISERROR('>START PRP007 - Populate Purchase table',0,1) WITH NOWAIT
      
      
      /**********************************************************************
      02. CREAETE purchase header (with pwc key)
      **********************************************************************/
      RAISERROR('..+Insert data into [#PurchaseHeader]',0,1) WITH NOWAIT
      
      -- 1.1: Drop table
      IF OBJECT_ID('[tempdb].[dbo].[#PurchaseHeader]') IS NOT NULL
      DROP TABLE [#PurchaseHeader]
      ;
      
      SELECT		
      ROW_NUMBER() OVER (ORDER BY CompanyCode, PurchasingDocumentNumber) AS [PURCHASE_KEY_PWC]
      ,POH.PurchasingDocumentNumber
      ,POH.CompanyCode
      ,POH.PurchasingDocumentType
      ,POH.DeletionIndicator
      ,POH.Status
      ,POH.DateRecordWasCreated
      ,POH.CreatedBy
      ,POH.LastItem
      ,POH.CurrencyKey
      ,POH.VendorAccountNumber
      ,POH.PurchasingOrganization
      ,POH.PurchasingGroup
      ,POH.PurchasingDocumentDate
      ,POH.[Release status]
      ,POH.TermsOfPaymentKey
      INTO		[#PurchaseHeader]
      FROM		[Interface].[PurchaseOrderHeader] as POH
      
      
      /**********************************************************************
      03. TRUNCATE TABLE STATEMENT
      **********************************************************************/
      
      TRUNCATE TABLE [Prepared].[Purchase]
      
      /*********************************************************************
      03 INSERT DATA
      **********************************************************************/
      RAISERROR('..+Insert data into [Prepared].[Purchase]',0,1) WITH NOWAIT
      
      
      
      
      
      
      
      INSERT INTO [Prepared].[Purchase]
      (
      [PURCHASE_KEY_PWC],					
      [VENDOR_KEY_PWC],	
      [COMPANY_KEY_PWC],				
      [PurchasingDocumentNumber],
      [CompanyCode],
      [PurchasingDocumentType],
      [DeletionIndicator],
      [Status],
      [CreatedOn],
      [UserID],
      [LastItem],
      [VendorID],
      [PurchasingOrganization],
      [PurchasingGroup],
      [PurchasingDocumentDate],
      [ReleaseStatus],
      [PurchaseChangeDate],
      [ShortText],
      [MaterialNumber],
      [Plant],
      [MaterialGroup],
      [PurchaseOrderQuantity],
      [CurrencyKey],
      [NetAmountDocument],
      [GrossAmountDocument],
      [ItemNumber],
      [TermsCode],
      [Scope_PWC]
      )
      
      SELECT 
      POH.[PURCHASE_KEY_PWC]					
      ,VM.[VENDOR_KEY_PWC]	
      ,E.[COMPANY_KEY_PWC]	
      ,POH.[PurchasingDocumentNumber]
      ,POH.[CompanyCode]
      ,POH.[PurchasingDocumentType]
      ,POH.[DeletionIndicator]
      ,POH.[Status]
      ,POH.[DateRecordWasCreated]
      ,POH.[CreatedBy]
      ,POH.[LastItem]
      ,POH.[VendorAccountNumber]
      ,POH.[PurchasingOrganization]
      ,POH.[PurchasingGroup]
      ,POH.[PurchasingDocumentDate]
      ,POH.[Release status]
      ,POL.[PurchasingDocumentItemChangeDate]
      ,POL.[ShortText]
      ,POL.[MaterialNumber]
      ,POL.[Plant]
      ,POL.[MaterialGroup]
      ,POL.[PurchaseOrderQuantity]
      ,POH.[CurrencyKey]
      ,POL.[NetOrderValueInPOCurrency]
      ,POL.[GrossOrderValue]
      ,POL.[ItemNumber]
      ,IsNull(POH.[TermsOfPaymentKey],'NONE')
      ,CASE 
      WHEN POH.[PurchasingDocumentDate] Between E.[EntityPeriodStart] and E.[EntityPeriodeEnd] 
      THEN 1
      ELSE 0
      END 
      FROM		[#PurchaseHeader] AS POH
      INNER JOIN	[Interface].[PurchaseOrderLines] AS POL
      ON			POL.[PurchasingDocumentNumber] = POH.[PurchasingDocumentNumber]
      AND			POL.[CompanyCode] = POH.[CompanyCode]
      INNER JOIN	[Prepared].[Entity] AS E
      ON			POH.[Companycode] = E.[EntityID]
      LEFT JOIN	[Prepared].[VendorMaster] AS VM
      ON			POH.[VendorAccountNumber] = VM.[VendorID] 
      
      -- Exclude: Deleted or blocked PO
      WHERE		IsNull(POH.[DeletionIndicator],'') = '' 
      --If no vendor allocated to PO we don't know who the order was place with
      AND			IsNull(POH.[VendorAccountNumber],'') <> ''
      
      /*********************************************************************
      04. UPDATE descriptions
      **********************************************************************/
      RAISERROR('..+Update user name [Prepared].[Purchase]',0,1) WITH NOWAIT
      
      -- 1) update user name
      -- update user name
      UPDATE		[Prepared].[Purchase]
      SET			[UserName] = UPPER(UN.[LastName]) + ', ' + UN.[Firstname]
      FROM		[Prepared].[Purchase] AS P
      JOIN		Interface.UserNames AS UN
      ON			P.[UserID] = UN.[User]
      WHERE		UN.[LastName] IS NOT NULL 
      AND			UN.[Firstname] IS NOT NULL
      ;	
      
      -- update user name
      UPDATE		[Prepared].[Purchase]
      SET			[UserName] = 'BATCH, user'
      FROM		[Prepared].[Purchase] AS P
      WHERE		Upper([UserID]) Like ('%BATCH%')
      AND			P.[UserName] = '(No name)'
      ;
      
      RAISERROR('..+Update term days [Prepared].[Purchase]',0,1) WITH NOWAIT
      
      -- 2) update terms days
      UPDATE		[Prepared].[Purchase]
      SET			[TermsCodeDays] = Convert(Int, PT.[DaysFromBaselineDateForPayment])
      FROM		[Prepared].[Purchase] AS P
      JOIN		[Interface].[PaymentTermsMaster] AS PT
      ON			P.[TermsCode] = PT.[TermsOfPaymentKey]
      ;
      
      /**********************************************************************
      05. END
      **********************************************************************/
      RAISERROR('>COMPLETE PRP007 - Populate Purchase table',0,1) WITH NOWAITUSE [z'c40ee561-6d97-44f0-b4ca-46a9db4b5b99]
      GO
      /****** Object:  StoredProcedure [Prepared].[PRP008_PurchaseLink]    Script Date: 19/09/2018 8:53:43 AM ******/
      SET ANSI_NULLS ON
      GO
      SET QUOTED_IDENTIFIER ON
      GO
      ALTER PROC [Prepared].[PRP008_PurchaseLink]
      AS
      
      /*********************************************************************
      *                           DATA ASSURANCE                           *
      **********************************************************************
      SCRIPT REFERENCE -	 PRP08
      SCRIPT DESCRIPTION - Create link between purchase and invoice table
      
      UPDATES            - Version 0.1 {13/03/2016} {Russell Taylor} - {Notes}
      
      
      TABLE INFORMATION
      INPUT TABLE(S)
      CORE
      - [Prepared].[Journal]
      - [Prepared].[Purchase]
      - [Interface].[PurchasingDocumentHistory]
      
      
      UPATE TABLE(S)
      - [Prepared].[Journal]
      - [Prepared].[Purchase]
      
      SUMMARY OF SCRIPT	-	1. START
      2. Update Journal table 
      3. Flag matched Purchase orders
      
      **********************************************************************
      01. START
      **********************************************************************/
      RAISERROR('>START PRP008 - Update journal with PO information',0,1) WITH NOWAIT
      
      /**********************************************************************
      02. DROP TABLE STATEMENT
      **********************************************************************/
      RAISERROR('..+Initialise script',0,1) WITH NOWAIT
      
      /**********************************************************************
      03. Update Journal table [Prepared].[Journal] with Purchase number
      **********************************************************************/
      RAISERROR('..+Update Journal table [Prepared].[Journal] with Purchase number',0,1) WITH NOWAIT
      
      
      UPDATE		 J 
      SET			 [PurchaseNumber] = PDH.[PurchasingDocumentNumber]
      ,[InvoicePurchasetMatch_PWC] = 1
      ,PurchaseMatchMethod_PWC = 'Document number'	
      FROM		[Interface].[PurchasingDocumentHistory] AS PDH
      INNER JOIN	[Prepared].[Journal] AS J
      ON			PDH.[MaterialDocumentYear] = J.[FiscalYear]
      AND			PDH.[NumberOfMaterialDocument] = J.[DocumentNumber]
      AND			right(PDH.[ItemInMaterialDocument],3) = J.[LineItem]
      
      /**********************************************************************
      04. +Update Journal table [Prepared].[Journal] with Purchase information
      **********************************************************************/
      RAISERROR('..+Update Journal table [Prepared].[Journal] with Purchase information',0,1) WITH NOWAIT
      
      UPDATE		 J 
      SET			 [PURCHASE_KEY_PWC] = P.[PURCHASE_KEY_PWC]
      ,[PurchaseNumber] = P.[PurchasingDocumentNumber]
      ,[PurchaseDate] = P.[PurchasingDocumentDate]
      FROM		[Prepared].[Journal] AS J
      INNER JOIN	(
      SELECT	DISTINCT 
      [PURCHASE_KEY_PWC],
      [PurchasingDocumentNumber],
      [PurchasingDocumentDate]
      FROM	[Prepared].[Purchase]
      ) AS P
      ON			J.[PurchaseNumber] = P.[PurchasingDocumentNumber]
      
      
      /**********************************************************************
      05. Flag matched Purchase orders
      **********************************************************************/
      RAISERROR('..+Flag matched Purchase orders [Prepared].[Purchase]',0,1) WITH NOWAIT
      
      UPDATE		[Prepared].[Purchase]
      SET			[InvoicePurchasetMatch_PWC] = 1
      ,			[AmountDocument] = J.[AmountDocument]
      ,			[CurrencyKeylocal1] = J.[CurrencyKeylocal1]
      ,			[AmountLocal1] = J.[AmountLocal1]
      ,			[CurrencyKeylocal2] = J.[CurrencyKeylocal2]
      ,			[AmountLocal2] = J.[AmountLocal2]
      ,			[CurrencyKeylocal3] = J.[CurrencyKeylocal3]
      ,			[AmountLocal3] = J.[AmountLocal3]
      FROM		[Prepared].[Journal] AS J
      INNER JOIN	[Prepared].[Purchase] AS P
      ON			J.[PURCHASE_KEY_PWC] = P.[PURCHASE_KEY_PWC]
      
      /********************************************************************
      06. Remove out-of scope items
      **********************************************************************/
      RAISERROR('..+Updagte payment table [Prepared].[Purchase] delete out-of-scope items',0,1) WITH NOWAIT
      
      DELETE		[Prepared].Purchase
      -- 1) Not in-scope
      WHERE		[Scope_PWC] = 0
      -- 2) not match to an invoice
      AND			[InvoicePurchasetMatch_PWC] = 0
      
      /**********************************************************************
      05. END
      **********************************************************************/
      RAISERROR('>COMPLETE PRP008 - Update journal with PO information',0,1) WITH NOWAITUSE [z'c40ee561-6d97-44f0-b4ca-46a9db4b5b99]
      GO
      /****** Object:  StoredProcedure [Prepared].[PRP009_Payment]    Script Date: 19/09/2018 8:54:07 AM ******/
      SET ANSI_NULLS ON
      GO
      SET QUOTED_IDENTIFIER ON
      GO
      ALTER PROC [Prepared].[PRP009_Payment]
      AS
      
      /*********************************************************************
      *                           DATA ASSURANCE                           *
      **********************************************************************
      SCRIPT REFERENCE - PRP009
      SCRIPT DESCRIPTION - Populate payment table
      
      UPDATES            - Version 0.1 {04/03/2016} {Russell Taylor} - {Notes}
      
      TABLE INFORMATION
      INPUT TABLE(S)
      CORE
      - [Prepared].[Entity] {PRP001}
      - [Prepared].[VendorMaster] {PRP002}
      
      - [Interface].[PaymentHeader]
      - [Interface].[PaymentDetail]
      
      OUTPUT TABLE(S)
      - [Prepared].[Payment]
      
      SUMMARY OF SCRIPT	-	1 Create journal listing for all payment
      
      **********************************************************************
      01. START
      **********************************************************************/
      RAISERROR('>START PRP009 - Populate Payment',0,1) WITH NOWAIT
      /********************************************************************
      02. Create a distinct list of payments into [#PaymentHeader]
      **********************************************************************/
      RAISERROR('..+Create a distinct list of payments into [#PaymentHeader]',0,1) WITH NOWAIT
      
      IF OBJECT_ID('[tempdb].[dbo].[#PaymentHeader]') IS NOT NULL
      DROP TABLE [dbo].[#PaymentHeader]
      
      
      SELECT 
      ROW_NUMBER() OVER (ORDER BY 
      [RunDate]
      ,IsNull([Identification],'')
      ,IsNull([IndicatorOnlyProposalRun],'')
      ,IsNull([PaymentCompanyCode],'')
      ,IsNull([Vendor],'')
      ,IsNull([PaymentRecipient],'')
      ,[PaymentDocumentNo]) AS PAYMENT_KEY_PWC
      
      -- Link to Header
      ,[RunDate]
      ,IsNull([Identification],'') AS [Identification]
      ,IsNull([IndicatorOnlyProposalRun],'') AS [IndicatorOnlyProposalRun]
      ,IsNull([PaymentCompanyCode],'') AS [PaymentCompanyCode]
      ,IsNull([Vendor],'') AS [VendorID]
      ,IsNull([PaymentRecipient],'') AS [PaymentRecipient]
      ,[PaymentDocumentNo]
      
      -- fields to include
      ,[NameOfPayee] as [PayeeName]
      ,[BankNumberPayee] as [BSB]
      ,[BankAccountNoPayee] as [BankAccount]
      ,[PaymentMethod]
      ,[Currency]
      ,[Amount Paid] as [PaidAmountDocument]
      ,[CashDiscount] as [DiscountAmountDocument]
      ,[AmountPaidLocalCurrency] as [PaidAmountLocal1]
      ,[CashDiscountlocalCurrency] as [DiscountAmountLocal1]
      ,[Pitems] as [ItemNumber]
      ,[CountryKey]
      ,[Reference]
      ,[DueDate]
      ,[Origin]
      ,COUNT(*) AS [DuplicateCount]
      INTO [#PaymentHeader]
      FROM [Interface].[PaymentHeader]
      
      -- No transacted
      WHERE [IndicatorOnlyProposalRun] is null
      
      -- No vendor transaction
      AND		[Vendor] is not null
      
      -- Make sure the payment header record is distinct
      GROUP BY 
      [RunDate]
      ,IsNull([Identification],'') 
      ,IsNull([IndicatorOnlyProposalRun],'') 
      ,IsNull([PaymentCompanyCode],'') 
      ,IsNull([Vendor],'') 
      ,IsNull([PaymentRecipient],'') 
      ,[PaymentDocumentNo]
      ,[NameOfPayee] 
      ,[BankNumberPayee] 
      ,[BankAccountNoPayee] 
      ,[PaymentMethod]
      ,[Currency]
      ,[Amount Paid] 
      ,[CashDiscount]
      ,[AmountPaidLocalCurrency] 
      ,[CashDiscountlocalCurrency] 
      ,[Pitems] 
      ,[CountryKey]
      ,[Reference]
      ,[DueDate]
      ,[Origin]
      
      
      /********************************************************************
      03. Populates datainto [Prepared].[Payment]
      **********************************************************************/
      RAISERROR('..+Create a distinct list of payments into [Prepared].[Payment]',0,1) WITH NOWAIT
      
      TRUNCATE TABLE [Prepared].[Payment] 
      
      INSERT INTO [Prepared].[Payment]
      (
      [PAYMENT_KEY_PWC]
      ,[COMPANY_KEY_PWC]
      ,[RunDate]
      ,[VendorID]
      ,[PaymentRecipient]
      ,[PaymentCompanyCode]
      ,[PaymentDocumentNo]
      ,[CompanyCode]
      ,[DocumentNumber]
      ,[FiscalYear]
      ,[LineItem]
      ,[Reference]
      ,[AmountDocument]
      ,[AmountLocal1]
      ,[PaymentBlocked]
      ,[PayeeName]
      ,[BSB]
      ,[BankAccount]
      ,[BankFlag_PWC]
      ,[PaymentMethod]
      ,[CurrencyKeyPaid]
      ,[PaidAmountDocument]
      ,[DiscountAmountDocument]
      ,[PaidAmountLocal1]
      ,[DiscountAmountLocal1]
      ,[ItemNumber]
      ,[CountryKey]
      ,[DueDate]
      ,[Origin]
      ,[Reconciliation_Scope_PWC]
      ,[Soruce_PWC]
      )
      
      SELECT 
      PH.[PAYMENT_KEY_PWC]
      ,E.[COMPANY_KEY_PWC]
      ,PH.[RunDate]
      ,PH.[VendorID]
      ,PH.[PaymentRecipient]
      ,PH.[PaymentCompanyCode]
      ,PH.[PaymentDocumentNo]
      ,CASE WHEN IsNull(PD.[CompanyCode],'') = '' THEN 'NONE' ELSE PD.[CompanyCode] END
      ,CASE WHEN IsNull(PD.[DocumentNumber],'') = '' THEN 'NONE' ELSE PD.[DocumentNumber] END
      ,CASE WHEN IsNull(PD.[FiscalYear],'') = '' THEN 'NONE' ELSE PD.[FiscalYear] END
      ,CASE WHEN IsNull(PD.[LineItem],'') = '' THEN 'X' ELSE PD.[LineItem] END
      ,PD.[Reference]
      ,CASE WHEN [DebitCreditInd] = 'S' THEN 0-PD.[AmountInDocumentCurrency] ELSE PD.[AmountInDocumentCurrency]  END       
      ,CASE WHEN [DebitCreditInd] = 'S' THEN 0-PD.[AmountInLocalCurrency] ELSE PD.[AmountInLocalCurrency]  END 
      ,PD.[PaymentBlockLevel] 
      ,PH.[PayeeName]
      ,PH.[BSB]
      ,PH.[BankAccount]
      ,CASE WHEN IsNull([BankAccount],'') = '' THEN 0 ELSE 1 END
      ,PH.[PaymentMethod]
      ,PH.[Currency]
      ,PH.[PaidAmountDocument]
      ,PH.[DiscountAmountDocument]
      ,PH.[PaidAmountLocal1]
      ,PH.[DiscountAmountLocal1]
      ,PH.[ItemNumber]
      ,PH.[CountryKey]
      ,PH.[DueDate]
      ,PH.[Origin]
      ,CASE 
      WHEN PH.[RunDate] < E.[EntityPeriodStart] 
      THEN 0
      WHEN PH.[RunDate] > E.[EntityPeriodeEnd] 
      THEN 2
      ELSE 1
      END 
      ,'Automatic'
      FROM		[Interface].[PaymentDetail] AS PD
      INNER JOIN  [#PaymentHeader] AS PH
      ON			PH.[RunDate] = PD.[RunDate]
      AND			PH.[Identification] = IsNull(PD.[Identification],'') 
      AND			PH.[IndicatorOnlyProposalRun] = IsNull(PD.[IndicatorOnlyProposalRun],'')
      AND			PH.[PaymentCompanyCode] = IsNull(PD.[PaymentCompanyCode],'')
      AND			PH.[VendorID] = IsNull(PD.[Vendor],'')
      AND			PH.[PaymentRecipient] = IsNull(PD.[PaymentRecipient],'')
      AND			PH.[PaymentDocumentNo]  = IsNull(PD.[PaymentDocumentNo],'')
      INNER JOIN  [Prepared].[Entity] AS E
      ON			E.[EntityID] = PD.[CompanyCode]
      
      -- Exlcude 
      -- 1: paymentS without a document number - this means the payment is not related to an invoice (i.e. HR payments)
      WHERE		IsNull(PD.[DocumentNumber],'') <> '' 
      -- 2: HR PAYMENTS WHICH DO NOT RELATE TO AP
      AND			IsNull(PH.[Origin],'') NOT LIKE '%HR%'
      -- 3: HR PAYMENTS WHICH DO NOT RELATE TO AP
      AND			IsNull(PH.[VendorID],'') <> ''
      
      /*********************************************************************
      04. Update [Prepared].[Payment] with payment header vs detail check
      **********************************************************************/
      RAISERROR('..+Update [Prepared].[Payment] with vendor key',0,1) WITH NOWAIT
      
      UPDATE		[Prepared].[Payment]
      SET			[VENDOR_KEY_PWC] = VM.[VENDOR_KEY_PWC]
      
      -- 1.0: Payment prepared table to update (PM - Payment Master)
      FROM		[Prepared].[Payment] AS PM
      
      -- 2.0: Payment reconciliation - calculate (PR - Payment Reconciliation)
      LEFT JOIN	[Prepared].[VendorMaster] AS VM
      ON			PM.[VendorID] = VM.[VendorID]
      
      
      /*********************************************************************
      04. Update [Prepared].[Payment] with payment header vs detail check
      **********************************************************************/
      RAISERROR('..+Update [Prepared].[Payment] with payment header vs detail check',0,1) WITH NOWAIT
      
      UPDATE		[Prepared].[Payment]
      SET			[HeaderDetailMatch_PWC] = 1,
      [HeaderDetaildeiff_PWC] = PR.PaymentDifference
      
      -- 1.0: Payment prepared table to update (PM - Payment Master)
      FROM		[Prepared].[Payment] AS PM
      
      -- 2.0: Payment reconciliation - calculate (PR - Payment Reconciliation)
      JOIN		(
      SELECT		[PAYMENT_KEY_PWC],
      
      -- 2.2: amount[amount record in system] + paid[paid amount to bank] + discount[discount applied at payment] - note: paid and discounts are opposite signs
      amount + paid + discount AS PaymentDifference 
      FROM		(
      
      -- 2.3: Calculate total amount[Detail], paid[Header] and disconut[Header]
      SELECT 
      [PAYMENT_KEY_PWC]
      ,Sum([AmountLocal1])			AS amount		-- detail
      ,Max([PaidAmountLocal1])		AS paid			-- header
      ,Max([DiscountAmountLocal1])	AS discount		-- header
      FROM [Prepared].[Payment] 
      GROUP BY 
      [PAYMENT_KEY_PWC]
      ) AS P
      ) AS PR 
      ON		PM.[PAYMENT_KEY_PWC] = PR.[PAYMENT_KEY_PWC]
      
      /*********************************************************************
      04. END
      **********************************************************************/
      RAISERROR('>COMPETE PRP009 - Populate Payment',0,1) WITH NOWAITUSE [z'c40ee561-6d97-44f0-b4ca-46a9db4b5b99]
      GO
      /****** Object:  StoredProcedure [Prepared].[PRP010_PaymentReconciliation]    Script Date: 19/09/2018 8:54:48 AM ******/
      SET ANSI_NULLS ON
      GO
      SET QUOTED_IDENTIFIER ON
      GO
      ALTER PROC [Prepared].[PRP010_PaymentReconciliation]
      as
      
      /*********************************************************************
      *                           DATA ASSURANCE                           *
      **********************************************************************
      SCRIPT REFERENCE - PRP010
      SCRIPT DESCRIPTION - Create link between payment and invoice table
      
      UPDATES            - Version 1.0 {04/03/2016} {Russell Taylor} - {Notes}
      - Version 1.1 {05/03/2018} {Justin Moy} - {Set JOURNAL_KEY_PWC and INVOICE_KEY_PWC to be null
      Removed these journals from Payment after the match
      Match is now also done over company code
      Search for @@JM to see changes}
      
      TABLE INFORMATION
      INPUT TABLE(S)
      CORE
      - [Prepared].[Journal] {PRP005}
      - [Prepared].[Payment] {PRP009}
      
      - [Interface].[PaymentHeader]
      - [Interface].[PaymentDetail]
      
      OUTPUT TABLE(S)
      - NONE
      
      SUMMARY OF SCRIPT	-	1 Reconcilie journal to payments
      
      **********************************************************************
      01. START
      **********************************************************************/
      RAISERROR('>START PRP010 - Reconciliation',0,1) WITH NOWAIT
      /********************************************************************
      02. Create a distinct list of journal payments into [#JournalPayments]
      **********************************************************************/
      RAISERROR('..+Create a list of journal payments [#JournalPayments]',0,1) WITH NOWAIT
      
      IF OBJECT_ID('[tempdb].[dbo].[#JournalPayments]') IS NOT NULL
      DROP TABLE [#JournalPayments]
      
      SELECT		
      [INVOICE_KEY_PWC],
      [JOURNAL_KEY_PWC],
      [VENDOR_KEY_PWC],
      [VendorId],
      Sum([AmountLocal1]) AS [AmountLocal1],
      [FiscalYear],
      [CompanyCode],
      [ClearingDocumentNumber],
      [ClearingPostingDate],
      [ClearingEntryDate],
      [ReferenceKey],
      [DocumentTypeDescription],
      Max([CurrencyKeylocal2])  AS [CurrencyKeylocal2],
      Sum([AmountLocal2]) AS [AmountLocal2],
      Max([CurrencyKeylocal3]) AS [CurrencyKeylocal3],
      Sum([AmountLocal3]) AS [AmountLocal3],
      Max([EntryDate]) AS [EntryDate],
      Max([EntryTime]) AS [EntryTime],
      Max([UserID]) AS [UserID],
      Max([UserName]) AS [UserName]
      INTO		[#JournalPayments]
      FROM		[Prepared].[Journal]
      WHERE		[TransactionType_PWC] = 'PAY'
      GROUP BY			
      [INVOICE_KEY_PWC],
      [JOURNAL_KEY_PWC],
      [VENDOR_KEY_PWC],
      [VendorId],
      [FiscalYear],
      [CompanyCode],
      [ClearingDocumentNumber],
      [ClearingPostingDate],
      [ClearingEntryDate],
      [ReferenceKey],
      [DocumentTypeDescription]
      
      
      /********************************************************************
      02. Create a distinct list of paid payment into [#JournalPayments]
      **********************************************************************/
      RAISERROR('..+Create a list of paid payments [#PaidPayments]',0,1) WITH NOWAIT
      
      IF OBJECT_ID('[tempdb].[dbo].[#PaidPayments]') IS NOT NULL
      DROP TABLE [#PaidPayments]
      
      SELECT		
      [PAYMENT_KEY_PWC],
      [VENDOR_KEY_PWC],
      [VendorId],
      Sum([AmountLocal1]) AS [AmountLocal1],
      [PaymentCompanyCode],
      [PaymentDocumentNo],
      [RunDate],
      [CompanyCode],
      [Scope_PWC]
      INTO		[#PaidPayments]
      FROM		[Prepared].[Payment]
      GROUP BY 
      [PAYMENT_KEY_PWC],
      [VENDOR_KEY_PWC],
      [VendorId],
      [PaymentCompanyCode],
      [PaymentDocumentNo],
      [RunDate],
      [CompanyCode],
      [Scope_PWC]
      
      
      
      
      /********************************************************************
      03. Run payment to journal match method 1 - using clearing data
      **********************************************************************/
      RAISERROR('..+Run payment to journal match method 1 [#MatchPayments1] - using clearing data',0,1) WITH NOWAIT
      
      IF OBJECT_ID('[tempdb].[dbo].[#MatchPayments1]') IS NOT NULL
      DROP TABLE [#MatchPayments1]
      
      SELECT		J.[VENDOR_KEY_PWC],
      P.[PAYMENT_KEY_PWC],
      J.[JOURNAL_KEY_PWC],
      P.[RunDate],
      J.[CurrencyKeylocal2],
      J.[AmountLocal2],
      J.[CurrencyKeylocal3],
      J.[AmountLocal3],
      J.[EntryDate],
      J.[EntryTime],
      J.[UserID],
      J.[UserName],
      J.companycode --@@JM
      INTO		[#MatchPayments1]
      FROM		[#JournalPayments] J
      JOIN		[#PaidPayments] P
      ON			P.[VENDOR_KEY_PWC] = J.[VENDOR_KEY_PWC] 
      AND			P.[AmountLocal1] = J.[AmountLocal1] 
      AND			P.[PaymentDocumentNo] = J.[ClearingDocumentNumber]
      AND			P.[RunDate] Between J.[ClearingEntryDate] and J.[ClearingPostingDate]
      AND			J.companycode = P.companycode --@@JM
      
      /********************************************************************
      04. Run payment to journal match method 2 - using referene key data
      **********************************************************************/
      RAISERROR('..+Run payment to journal match method 1 [#MatchPayments2] - using referene key data',0,1) WITH NOWAIT
      
      IF OBJECT_ID('[tempdb].[dbo].[#MatchPayments2]') IS NOT NULL
      DROP TABLE [#MatchPayments2]
      
      SELECT		J.[VENDOR_KEY_PWC],
      P.[PAYMENT_KEY_PWC],
      J.[JOURNAL_KEY_PWC],
      P.[RunDate],
      J.[CurrencyKeylocal2],
      J.[AmountLocal2],
      J.[CurrencyKeylocal3],
      J.[AmountLocal3],
      J.[EntryDate],
      J.[EntryTime],
      J.[UserID],
      J.[UserName],
      J.companycode --@@JM
      INTO		[#MatchPayments2]
      FROM		[#JournalPayments] J
      JOIN		[#PaidPayments] P
      ON			P.[VENDOR_KEY_PWC] = J.[VENDOR_KEY_PWC] 
      AND			P.[AmountLocal1] = J.[AmountLocal1] 
      AND			P.[PaymentDocumentNo] = Left(J.[ReferenceKey],10)
      AND			P.[RunDate] Between J.[ClearingEntryDate] and J.[ClearingPostingDate]
      AND			J.companycode = P.companycode --@@JM
      
      
      /********************************************************************
      04. Run payment to journal match method 3 - using referene key data (NOT AMOUNT)
      **********************************************************************/
      RAISERROR('..+Run payment to journal match method 1 [#MatchPayments3] - using referene key data',0,1) WITH NOWAIT
      
      IF OBJECT_ID('[tempdb].[dbo].[#MatchPayments3]') IS NOT NULL
      DROP TABLE [#MatchPayments3]
      
      SELECT		J.[VENDOR_KEY_PWC],
      P.[PAYMENT_KEY_PWC],
      J.[JOURNAL_KEY_PWC],
      P.[RunDate],
      J.[CurrencyKeylocal2],
      J.[AmountLocal2],
      J.[CurrencyKeylocal3],
      J.[AmountLocal3],
      J.[EntryDate],
      J.[EntryTime],
      J.[UserID],
      J.[UserName],
      J.companycode --@@JM
      INTO		[#MatchPayments3]
      FROM		[#JournalPayments] J
      JOIN		[#PaidPayments] P
      ON			P.[VENDOR_KEY_PWC] = J.[VENDOR_KEY_PWC] 
      AND			P.[PaymentDocumentNo] = Left(J.[ReferenceKey],10)
      AND			P.[RunDate] Between J.[ClearingEntryDate] and J.[ClearingPostingDate]
      AND			J.companycode = P.companycode --@@JM
      
      
      /********************************************************************
      04. Run invoices to payment match method 1 - document number
      **********************************************************************/
      RAISERROR('..+Run invoices to payment match method 1 [#MatchInvoices2] - using document number',0,1) WITH NOWAIT
      
      IF OBJECT_ID('[tempdb].[dbo].[#MatchInvoices1]') IS NOT NULL
      DROP TABLE	[#MatchInvoices1]
      
      SELECT		J.[VENDOR_KEY_PWC],
      P.[PAYMENT_KEY_PWC],
      J.[JOURNAL_KEY_PWC],
      J.[INVOICE_KEY_PWC],
      P.[CompanyCode],
      P.[DocumentNumber],
      P.[FiscalYear], 
      P.[LineItem],
      P.[Rundate],
      J.[CurrencyKeylocal2],
      J.[AmountLocal2],
      J.[CurrencyKeylocal3],
      J.[AmountLocal3],
      J.[EntryDate],
      J.[EntryTime],
      J.[UserID],
      J.[UserName]
      INTO		[#MatchInvoices1]
      FROM		[Prepared].[Payment] AS P
      JOIN		[Prepared].[Journal] AS J
      ON			P.[CompanyCode] = J.[CompanyCode]
      AND			P.[DocumentNumber] = J.[DocumentNumber]
      AND			P.[FiscalYear] = J.[FiscalYear]
      AND			P.[LineItem] = J.[LineItem]
      AND			J.companycode = P.companycode --@@JM
      
      /********************************************************************
      05. Update invoices table with match payment data 
      **********************************************************************/
      RAISERROR('..+Updagte journal table [Prepared].[Journal] with matched payment information',0,1) WITH NOWAIT
      
      -- Clear journal fieild
      UPDATE		[Prepared].[Journal]
      SET			[JouralPaymentMatch_PWC] = 0
      ,			[PaymentMatchMethod_PWC] = 'No match'
      ,			[PaymentDate] = NULL
      ,			[PAYMENT_KEY_PWC] = 0
      ,			[JouralPaymentNote_PWC] = 'Exception'
      
      -- Update Journals
      UPDATE		[Prepared].[Journal]
      SET			[JouralPaymentMatch_PWC] = 1
      ,			[PaymentMatchMethod_PWC] = 'Vendor, Clearing doc and rundate'
      ,			[PaymentDate] = M.[RunDate]
      ,			[PAYMENT_KEY_PWC] = M.[PAYMENT_KEY_PWC]
      FROM		[Prepared].[Journal] AS J
      JOIN		[#MatchPayments1] AS M
      ON			M.[JOURNAL_KEY_PWC] = J.[JOURNAL_KEY_PWC] AND J.companycode = M.companycode --@@JM
      WHERE		[JouralPaymentMatch_PWC] = 0
      ;
      
      -- Update Journals
      UPDATE		[Prepared].[Journal]
      SET			[JouralPaymentMatch_PWC] = 1
      ,			[PaymentMatchMethod_PWC] = 'Vendor, Reference key and rundate'
      ,			[PaymentDate] = M.[RunDate]
      ,			[PAYMENT_KEY_PWC] = M.[PAYMENT_KEY_PWC]
      FROM		[Prepared].[Journal] AS J
      JOIN		[#MatchPayments2] AS M
      ON			M.[JOURNAL_KEY_PWC] = J.[JOURNAL_KEY_PWC] AND J.companycode = M.companycode --@@JM
      WHERE		[JouralPaymentMatch_PWC] = 0
      ;
      
      -- Update Journals
      UPDATE		[Prepared].[Journal]
      SET			[JouralPaymentMatch_PWC] = 1
      ,			[PaymentMatchMethod_PWC] = 'Vendor, Reference key and rundate (NOT AMOUNT)'
      ,			[PaymentDate] = M.[RunDate]
      ,			[PAYMENT_KEY_PWC] = M.[PAYMENT_KEY_PWC]
      FROM		[Prepared].[Journal] AS J
      JOIN		[#MatchPayments3] AS M
      ON			M.[JOURNAL_KEY_PWC] = J.[JOURNAL_KEY_PWC] AND J.companycode = M.companycode --@@JM
      WHERE		[JouralPaymentMatch_PWC] = 0
      ;
      
      
      -- Reversals that have zero impact and no out going payment
      UPDATE		[Prepared].[Journal]
      SET			[JouralPaymentMatch_PWC] = 1
      ,			[PaymentMatchMethod_PWC] = 'Reversal, zero impact'
      ,			[PAYMENT_KEY_PWC] = 0
      FROM		[Prepared].[Journal] AS J
      JOIN		[#JournalPayments] AS M
      ON			M.[JOURNAL_KEY_PWC] = J.[JOURNAL_KEY_PWC] AND J.companycode = M.companycode --@@JM
      WHERE		M.[AmountLocal1] = 0
      ;
      
      
      -- Update match note
      UPDATE		[Prepared].[Journal]
      SET			[JouralPaymentNote_PWC] = CASE 
      WHEN [Scope_PWC] = 0						THEN 'Out-of scope' 
      WHEN [TransactionType_PWC] = 'INV'			THEN 'Invoice transaction'
      WHEN [TransactionType_PWC] = 'OTH'			THEN 'Other type of transaction'
      WHEN [PaymentMatchMethod_PWC] like '%NOT%'	THEN 'Match - not amount'
      WHEN [JouralPaymentMatch_PWC] = 1			THEN 'Match'
      WHEN [TransactionCode] = 'FBZ2'				THEN 'Manual payment'
      ELSE 'Exception' END
      
      -- Update Invoice Lines
      UPDATE		[Prepared].[Journal]
      SET			[PAYMENT_KEY_PWC] = M.[PAYMENT_KEY_PWC]
      ,			[InvoicePaymentMatch_PWC] = 1
      ,			[PaymentMatchMethod_PWC] = 'Document number'
      ,			[PaymentDate] = M.[RunDate]
      FROM		[Prepared].[Journal] AS J
      JOIN		[#MatchInvoices1] AS M
      ON			M.[JOURNAL_KEY_PWC] = J.[JOURNAL_KEY_PWC]  AND J.companycode = M.companycode --@@JM
      
      /********************************************************************
      06. Update payment table with match payment data
      **********************************************************************/
      RAISERROR('..+Updagte payment table [Prepared].[Payment] with matched invoice information',0,1) WITH NOWAIT
      
      UPDATE		[Prepared].[Payment]
      SET			[INVOICE_KEY_PWC] = NULL --@@JM
      ,			[JOURNAL_KEY_PWC] = NULL --@@JM
      ,			[JouralPaymentMatch_PWC] = 0
      ,			[JouralPaymentNote_PWC] = 'Exception'
      ;
      -- Update Payment Lines
      UPDATE		[Prepared].[Payment]
      SET			[JOURNAL_KEY_PWC] = M.[JOURNAL_KEY_PWC]
      ,			[JouralPaymentMatch_PWC] = 1
      ,			[CurrencyKeylocal2] = M.[CurrencyKeylocal2]
      ,			[AmountLocal2] = M.[AmountLocal2]
      ,			[CurrencyKeylocal3] = M.[CurrencyKeylocal3]
      ,			[AmountLocal3] = M.[AmountLocal3]
      ,			[EntryDate] = M.[EntryDate]
      ,			[EntryTime] = M.[EntryTime]
      ,			[UserID] = M.[UserID]
      ,			[UserName] = M.[UserName] 
      FROM		[Prepared].[Payment] AS P
      JOIN		[#MatchPayments1] AS M
      ON			M.[PAYMENT_KEY_PWC] = P.[PAYMENT_KEY_PWC]  AND P.companycode = M.companycode --@@JM
      WHERE		[JouralPaymentMatch_PWC] = 0
      ;
      -- Update Payment Lines
      UPDATE		[Prepared].[Payment]
      SET			[JOURNAL_KEY_PWC] = M.[JOURNAL_KEY_PWC]
      ,			[JouralPaymentMatch_PWC] = 1
      ,			[CurrencyKeylocal2] = M.[CurrencyKeylocal2]
      ,			[AmountLocal2] = M.[AmountLocal2]
      ,			[CurrencyKeylocal3] = M.[CurrencyKeylocal3]
      ,			[AmountLocal3] = M.[AmountLocal3]
      ,			[EntryDate] = M.[EntryDate]
      ,			[EntryTime] = M.[EntryTime]
      ,			[UserID] = M.[UserID]
      ,			[UserName] = M.[UserName] 
      FROM		[Prepared].[Payment] AS P
      JOIN		[#MatchPayments2] AS M
      ON			M.[PAYMENT_KEY_PWC] = P.[PAYMENT_KEY_PWC]  AND P.companycode = M.companycode --@@JM
      WHERE		[JouralPaymentMatch_PWC] = 0
      ;
      -- Update Payment Lines
      UPDATE		[Prepared].[Payment]
      SET			[JOURNAL_KEY_PWC] = M.[JOURNAL_KEY_PWC]
      ,			[JouralPaymentMatch_PWC] = 1
      ,			[JouralPaymentNote_PWC] = 'Match - not amount'
      ,			[CurrencyKeylocal2] = M.[CurrencyKeylocal2]
      ,			[AmountLocal2] = M.[AmountLocal2]
      ,			[CurrencyKeylocal3] = M.[CurrencyKeylocal3]
      ,			[AmountLocal3] = M.[AmountLocal3]
      ,			[EntryDate] = M.[EntryDate]
      ,			[EntryTime] = M.[EntryTime]
      ,			[UserID] = M.[UserID]
      ,			[UserName] = M.[UserName] 
      FROM		[Prepared].[Payment] AS P
      JOIN		[#MatchPayments3] AS M
      ON			M.[PAYMENT_KEY_PWC] = P.[PAYMENT_KEY_PWC]  AND P.companycode = M.companycode --@@JM
      WHERE		[JouralPaymentMatch_PWC] = 0
      ;
      -- Update match note
      UPDATE		[Prepared].[Payment]
      SET			[JouralPaymentNote_PWC] = CASE 
      WHEN [Reconciliation_Scope_PWC] <> 1		THEN 'Out-of scope' 
      WHEN [JouralPaymentNote_PWC] = 'Match - not amount' THEN 'Match - not amount'
      WHEN [JouralPaymentMatch_PWC] = 1			THEN 'Match'
      ELSE 'Exception' END
      ;
      -- Update Payment Lines
      UPDATE		[Prepared].[Payment]
      SET			[INVOICE_KEY_PWC] = M.[INVOICE_KEY_PWC]
      ,			[InvoicePaymentMatch_PWC] = 1
      FROM		[Prepared].[Payment] AS P
      JOIN		[#MatchInvoices1] AS M
      ON			M.[CompanyCode] = P.[CompanyCode]
      AND			M.[DocumentNumber] = P.[DocumentNumber]  
      AND			M.[FiscalYear] = P.[FiscalYear] 
      AND			M.[LineItem] = P.[LineItem]
      AND		    P.companycode = M.companycode --@@JM
      
      
      /********************************************************************
      07. Remove out-of scope items
      **********************************************************************/
      RAISERROR('..+Updagte payment table [Prepared].[Payment] delete out of scope items',0,1) WITH NOWAIT
      
      DELETE		[Prepared].[Payment]
      -- Remove payments not match a invoice or GL payment line and transacted before the start of the review period.
      WHERE		[JOURNAL_KEY_PWC] IS NULL --@@JM
      AND			[INVOICE_KEY_PWC] IS NULL --@@JM
      AND			[Reconciliation_Scope_PWC] = 0
      
      /********************************************************************
      08. Update payment scope based on reconciliation result
      **********************************************************************/
      RAISERROR('..+Updagte payment table [Prepared].[Payment] with new scope range',0,1) WITH NOWAIT
      
      -- Update Payment Lines
      UPDATE		[Prepared].[Payment]
      SET			[Scope_PWC] = 0
      
      -- Update Payment Lines
      UPDATE		[Prepared].[Payment]
      SET			[Scope_PWC] = 1
      FROM		[Prepared].[Payment]
      WHERE		[Reconciliation_Scope_PWC] = 1
      
      -- Update Payment Lines
      UPDATE		[Prepared].[Payment]
      SET			[Scope_PWC] = 1
      FROM		[Prepared].[Payment] AS P
      JOIN		[Prepared].[Journal] AS J
      ON			P.[PAYMENT_KEY_PWC] = J.[PAYMENT_KEY_PWC] AND P.companycode = J.companycode
      WHERE		P.[Scope_PWC] = 0
      AND			J.[Scope_PWC] = 1
      
      /**********************************************************************
      09. END
      **********************************************************************/
      RAISERROR('>COMPLETE PRP010 - Reconciliation',0,1) WITH NOWAITUSE [z'c40ee561-6d97-44f0-b4ca-46a9db4b5b99]
      GO
      /****** Object:  StoredProcedure [Prepared].[PRP011_PaymentManual]    Script Date: 19/09/2018 8:55:11 AM ******/
      SET ANSI_NULLS ON
      GO
      SET QUOTED_IDENTIFIER ON
      GO
      ALTER PROC [Prepared].[PRP011_PaymentManual]
      AS
      
      /*********************************************************************
      *                           DATA ASSURANCE                           *
      **********************************************************************
      SCRIPT REFERENCE - PRP011
      SCRIPT DESCRIPTION - Populate manual payments
      
      UPDATES            - Version 0.1 {14/03/2016} {Russell Taylor} - {Notes}
      - Version 0.2 {05/03/2018} {Justin Moy} - {Added join on company code
      Search for @@JM}
      
      TABLE INFORMATION
      INPUT TABLE(S)
      CORE
      - [Prepared].[Entity] {PRP001}
      - [Prepared].[VendorMaster] {PRP002}
      - [Prepared].[Journal] {PRP005}
      
      OUTPUT TABLE(S)
      - [Prepared].[Payment]
      
      SUMMARY OF SCRIPT	-	1. List of manual payments
      2. List of invoces 
      3. add matched manual payment to invoice to the payment table 
      
      **********************************************************************
      01. START
      **********************************************************************/
      RAISERROR('>START PRP011 - Populate manual payments',0,1) WITH NOWAIT
      
      /********************************************************************
      02. Delete all manaul payments from [Prepared].[Payment]
      **********************************************************************/
      RAISERROR('..+Delete all manaul payments from [Prepared].[Payment]',0,1) WITH NOWAIT
      
      DELETE		[Prepared].[Payment]
      WHERE		[Soruce_PWC] = 'Manual'
      
      /********************************************************************
      03. Create a distinct list of manual payments into [#ManualPayments]
      **********************************************************************/
      RAISERROR('..+Create a distinct list of manual payments into [#ManualPayments]',0,1) WITH NOWAIT
      
      IF OBJECT_ID('[tempdb].[dbo].[#ManualPayments]') IS NOT NULL
      DROP TABLE [dbo].[#ManualPayments]
      
      SELECT	
      [JOURNAL_KEY_PWC]
      ,[EntryDate] AS [RunDate]
      ,[ClearingYear]
      ,[ClearingDocumentNumber]
      ,[ClearingEntryDate] 
      ,[CompanyCode] AS [PaymentCompanyCode]
      ,[DocumentNumber] AS [PaymentDocumentNo]
      ,[EntryDate] AS [DueDate]
      ,[Scope_PWC]
      ,[HeaderNarration]
      ,[AmountLocal1]
      INTO		[#ManualPayments]
      FROM		[Prepared].[Journal]
      -- Outgoing payment transactions
      WHERE		[TransactionSubType_PWC] = 'PA'
      -- Only manualy process payments - identified through transaction code FBZ2
      AND			[TransactionCode] = 'FBZ2'
      
      /********************************************************************
      04. Create a distinct list of invoices into [#Invoices]
      **********************************************************************/
      RAISERROR('..+Create a distinct list of invoices into [#Invoices]',0,1) WITH NOWAIT
      
      IF OBJECT_ID('[tempdb].[dbo].[#Invoices]') IS NOT NULL
      DROP TABLE [dbo].[#Invoices]
      
      SELECT	
      [INVOICE_KEY_PWC]
      ,[COMPANY_KEY_PWC]
      ,[VENDOR_KEY_PWC]
      ,[VendorID]
      ,[CompanyCode]
      ,[DocumentNumber]
      ,[FiscalYear]
      ,[LineItem]
      ,[CurrencyKeyDocument]
      ,[AmountDocument] AS [AmountDocument]
      ,[CurrencyKeylocal1] 
      ,[AmountLocal1] AS [AmountLocal1]
      ,[CurrencyKeylocal2]
      ,[AmountLocal2] AS [AmountLocal2]
      ,[CurrencyKeylocal3] 
      ,[AmountLocal3] AS [AmountLocal3]
      ,[CurrencyKeyDocument] AS [CurrencyKeyPaid]
      ,[AmountDocument] AS [PaidAmountDocument]
      ,[AmountLocal1] AS [PaidAmountLocal1]
      ,[EntryDate]
      ,[EntryTime]
      ,[UserID]
      ,[UserName]
      ,[ClearingYear] 
      ,[ClearingDocumentNumber] 
      ,[ClearingEntryDate] 
      INTO		[#Invoices]
      FROM		[Prepared].[Journal]
      -- Invoice transactions
      WHERE		[TransactionSubType_PWC] = 'IN'
      
      
      
      /********************************************************************
      05. Get last payment record ID - PAYMENT_KEY_PWC
      **********************************************************************/
      RAISERROR('..+Get last payment record ID - PAYMENT_KEY_PWC',0,1) WITH NOWAIT
      
      DECLARE @LAST_PAYMENT_KEY_PWC BIGINT
      
      -- Get last record id 
      SET @LAST_PAYMENT_KEY_PWC = (SELECT Max(PAYMENT_KEY_PWC) FROM [Prepared].[Payment])
      
      -- If no payment transaction then convert the null returned value to 0
      SET @LAST_PAYMENT_KEY_PWC = CASE WHEN @LAST_PAYMENT_KEY_PWC IS NULL THEN 0 ELSE @LAST_PAYMENT_KEY_PWC END
      
      /********************************************************************
      06. Popultate matched manual payment into the payment table [Prepared].[Payment]
      **********************************************************************/
      RAISERROR('..+Popultate matched manual payment into the payment table [Prepared].[Payment]',0,1) WITH NOWAIT
      
      INSERT INTO [Prepared].[Payment]
      (		       
      [PAYMENT_KEY_PWC]
      ,[VENDOR_KEY_PWC]
      ,[JOURNAL_KEY_PWC]
      ,[INVOICE_KEY_PWC]
      ,[COMPANY_KEY_PWC]
      ,[RunDate]
      ,[VendorID]
      ,[PaymentRecipient]
      ,[PaymentCompanyCode]
      ,[PaymentDocumentNo]
      ,[CompanyCode]
      ,[DocumentNumber]
      ,[FiscalYear]
      ,[LineItem]
      ,[Reference]
      ,[CurrencyKeyDocument]
      ,[AmountDocument] 
      ,[CurrencyKeylocal1] 
      ,[AmountLocal1]
      ,[CurrencyKeylocal2]
      ,[AmountLocal2] 
      ,[CurrencyKeylocal3] 
      ,[AmountLocal3] 
      ,[EntryDate]
      ,[EntryTime]
      ,[UserID] 
      ,[UserName] 
      ,[BankFlag_PWC]
      ,[CurrencyKeyPaid]
      ,[PaidAmountDocument]
      ,[ItemNumber]
      ,[PaidAmountLocal1]
      ,[DueDate]
      ,[Reconciliation_Scope_PWC]
      ,[HeaderDetailMatch_PWC]
      ,[HeaderDetaildeiff_PWC]
      ,[JouralPaymentMatch_PWC]
      ,[InvoicePaymentMatch_PWC]
      ,[JouralPaymentNote_PWC]
      ,[Soruce_PWC]
      ,[Scope_PWC]
      )
      
      SELECT		       
      @LAST_PAYMENT_KEY_PWC + ROW_NUMBER() OVER (ORDER BY [JOURNAL_KEY_PWC])
      ,I.[VENDOR_KEY_PWC]
      ,MP.[JOURNAL_KEY_PWC]
      ,I.[INVOICE_KEY_PWC]
      ,I.[COMPANY_KEY_PWC]
      ,MP.[RunDate]
      ,I.[VendorID]
      ,Isnull(MP.[HeaderNarration],'(No information)')
      ,MP.[PaymentCompanyCode]
      ,MP.[PaymentDocumentNo]
      ,I.[CompanyCode]
      ,I.[DocumentNumber]
      ,I.[FiscalYear]
      ,I.[LineItem]
      ,Isnull(MP.[HeaderNarration],'(No information)')
      ,I.[CurrencyKeyDocument]
      ,I.[AmountDocument] 
      ,I.[CurrencyKeylocal1] 
      ,I.[AmountLocal1]
      ,I.[CurrencyKeylocal2]
      ,I.[AmountLocal2] 
      ,I.[CurrencyKeylocal3] 
      ,I.[AmountLocal3] 
      ,I.[EntryDate]
      ,I.[EntryTime]
      ,I.[UserID]
      ,I.[UserName]
      ,0 AS [BankFlag_PWC]
      ,I.[CurrencyKeyPaid]
      ,I.[PaidAmountDocument]
      ,1
      ,I.[PaidAmountLocal1]
      ,MP.[DueDate]
      ,CASE WHEN MP.[Scope_PWC] = 0 THEN 2 ELSE 1 END
      ,1
      ,0.0
      ,1
      ,1
      ,'Match - manual'
      ,'Manual'
      ,MP.[Scope_PWC]
      FROM			[#Invoices] AS I
      INNER JOIN		[#ManualPayments] AS MP
      ON				I.[ClearingYear] = MP.[ClearingYear]
      AND				I.[ClearingDocumentNumber] = MP.[ClearingDocumentNumber]
      AND				I.[ClearingEntryDate] = MP.[ClearingEntryDate] 
      AND				I.[AmountLocal1] = MP.[AmountLocal1]
      AND				I.CompanyCode = MP.PaymentCompanyCode --@@JM
      
      /********************************************************************
      07. Update journal table [Prepared].[Journal] with payment id 
      **********************************************************************/
      RAISERROR('..+Update journal table [Prepared].[Journal] with payment id for payments',0,1) WITH NOWAIT
      
      UPDATE			[Prepared].[Journal]
      SET				[PAYMENT_KEY_PWC] = P.[PAYMENT_KEY_PWC]
      ,				[JouralPaymentNote_PWC] = 'Match - manual'
      FROM			[Prepared].[Journal] AS J
      INNER JOIN		(
      SELECT			DISTINCT
      [CompanyCode], --@@JM
      [JOURNAL_KEY_PWC],
      [PAYMENT_KEY_PWC],
      [INVOICE_KEY_PWC],
      [AmountLocal1]
      FROM			[Prepared].[Payment]	
      WHERE			[Soruce_PWC] = 'Manual'
      ) AS P
      ON				J.[JOURNAL_KEY_PWC] = P.[JOURNAL_KEY_PWC]
      AND				J.[AmountLocal1] = P.[AmountLocal1]
      AND				J.CompanyCode = P.[CompanyCode] --@@JM
      
      
      ----This appears to be duplicated from above @@JM
      --RAISERROR('..+Update journal table [Prepared].[Journal] with payment id for invoices',0,1) WITH NOWAIT
      
      --UPDATE			[Prepared].[Journal]
      --SET				[PAYMENT_KEY_PWC] = P.[PAYMENT_KEY_PWC]
      --FROM			[Prepared].[Journal] AS J
      --INNER JOIN		(
      --				SELECT			DISTINCT 
      --								[JOURNAL_KEY_PWC],
      --								[PAYMENT_KEY_PWC],
      --								[INVOICE_KEY_PWC],
      --								[AmountLocal1]
      --				FROM			[Prepared].[Payment]	
      --				WHERE			[Soruce_PWC] = 'Manual'
      --				) AS P
      --ON				J.[INVOICE_KEY_PWC] = P.[INVOICE_KEY_PWC]
      --AND				J.[AmountLocal1] = P.[AmountLocal1]
      
      
      /*********************************************************************
      08. END
      **********************************************************************/
      RAISERROR('>START PRP011 - Populate manual payments',0,1) WITH NOWAITUSE [z'c40ee561-6d97-44f0-b4ca-46a9db4b5b99]
      GO
      /****** Object:  StoredProcedure [Manage].[MAN001]    Script Date: 19/09/2018 8:56:48 AM ******/
      SET ANSI_NULLS ON
      GO
      SET QUOTED_IDENTIFIER ON
      GO
      ALTER PROC [Manage].[MAN001]
      AS
      
      /*********************************************************************
      *                           DATA ASSURANCE                           *
      **********************************************************************
      SCRIPT REFERENCE - MAN001
      SCRIPT DESCRIPTION -Populate log with scripts to process
      
      UPDATES            - Version 0.1 {04/03/2016} {Russell Taylor} - {Notes}
      
      
      TABLE INFORMATION
      INPUT TABLE(S)
      - [Store].[Process]
      
      OUTPUT TABLE(S)
      - [Manage].[Log]
      
      SUMMARY OF SCRIPT	-	1 Populdate management log 
      
      **********************************************************************
      01. START
      **********************************************************************/
      RAISERROR('>START MAN001 - Populate log',0,1) WITH NOWAIT
      
      /**********************************************************************
      02. Insert data into [Manage].[Log]
      **********************************************************************/
      RAISERROR('..+Insert data into [Manage].[Log]',0,1) WITH NOWAIT
      
      TRUNCATE TABLE [Manage].[Log]
      
      INSERT INTO [Manage].[Log]
      (
      [ScriptSequence]
      ,[ScriptTypeName]
      ,[ScriptReference]
      ,[ScriptName]
      ,[ScriptNarration]
      )
      SELECT 
      [ScriptSequence]
      ,[ScriptTypeName]
      ,[ScriptReference]
      ,[ScriptName]
      ,[ScriptNarration]
      FROM[Store].[Process]
      WHERE [ScriptReference] not in ('SET001','MAN003')
      
      
      /**********************************************************************
      03. Update log with proc name [Manage].[Log] 
      **********************************************************************/
      RAISERROR('..+Update log with proc name [Manage].[Log]',0,1) WITH NOWAIT
      
      UPDATE		[Manage].[Log]
      SET			[SystemScriptName] = '[' + sc.name + '].[' + obj.name + ']'
      FROM		[Manage].[Log] AS L
      JOIN		[sys].[objects] AS obj
      ON			left([obj].[name],6) = L.[ScriptReference]
      JOIN		[sys].[schemas] AS sc
      ON			[sc].[schema_id] = obj.[schema_id]  
      
      /*********************************************************************
      04. END
      **********************************************************************/
      RAISERROR('>COMPLETE PRP001 - Populate log',0,1) WITH NOWAITUSE [z'c40ee561-6d97-44f0-b4ca-46a9db4b5b99]
      GO
      /****** Object:  StoredProcedure [Result].[TST001]    Script Date: 19/09/2018 8:57:53 AM ******/
      SET ANSI_NULLS ON
      GO
      SET QUOTED_IDENTIFIER ON
      GO
      ALTER PROC [Result].[TST001]
      AS
      
      /*********************************************************************
      *                           DATA ASSURANCE                           *
      **********************************************************************
      SCRIPT REFERENCE   - TST001
      SCRIPT DESCRIPTION - Payment test: Payments outside business hours
      
      UPDATES            - Version 1.0 {15/03/2016} {Melissa Cole,Fei Li} 
      TABLE INFORMATION
      INPUT TABLE(S)
      - [Prepared].[Payment]
      
      OUTPUT TABLE(S)
      - [Result].[TestTResult]
      
      SUMMARY OF SCRIPT -	01. START
      - 02. DELETE TEST RESULT IF EXISTS
      - 03. UPDATE TEST RESULT
      - 04. END
      
      **********************************************************************
      01. START
      **********************************************************************/
      RAISERROR('>START <TST001> - Payments outside business hours',0,1) WITH NOWAIT
      
      /**********************************************************************
      02. DELETE TEST REUSLT IF EXISTS
      **********************************************************************/
      RAISERROR('..+Delete test result TST001',0,1) WITH NOWAIT
      
      DELETE FROM [Result].[TestTResult]
      WHERE	[TestID]='TST001' 
      
      
      DECLARE		@StartTime AS INT
      DECLARE		@EndTime AS INT
      
      SET			@StartTime = (SELECT Value FROM Store.Setting WHERE [Key]='1: Business starting hour')
      SET			@EndTime = (SELECT Value FROM Store.Setting WHERE [Key]='2: Business finishing hour')
      
      /*********************************************************************
      03. UPDATE TEST RESULT
      **********************************************************************/
      RAISERROR('..+Update results table [Result].[TestTResult]>',0,1) WITH NOWAIT
      
      INSERT INTO [Result].[TestTResult]
      (
      [KEY_PWC],
      [Type],
      [VENDOR_KEY_PWC],
      [COMPANY_KEY_PWC],
      [TestID],
      [DimensionText],
      [DimensionUnit]
      )
      SELECT
      [PAYMENT_LINE_PWC],
      'Payment',
      [VENDOR_KEY_PWC],
      0,	
      'TST001',
      CASE		
      WHEN	IsNull(EntryTime,'') = '' 
      THEN	'Standard' 
      WHEN	[BIA].[WeekdayName](RunDate) IN ('Saturday', 'Sunday') 
      THEN	'Weekend'
      WHEN	DATEPART(hh, EntryTime) Between @StartTime and @EndTime
      THEN	'Standard'
      ELSE	'Out-of hour'
      END,
      'Occurance'			
      FROM		[Prepared].[Payment]
      WHERE		[Scope_PWC] = 1
      AND			CASE		
      WHEN	IsNull(EntryTime,'') = '' 
      THEN	'Standard' 
      WHEN	[BIA].[WeekdayName](RunDate) IN ('Saturday', 'Sunday') 
      THEN	'Weekend'
      WHEN	DATEPART(hh, EntryTime) Between @StartTime and @EndTime
      THEN	'Standard'
      ELSE	'Out-of hour'
      END <> 'Standard'
      
      
      /**********************************************************************
      04. END
      **********************************************************************/
      RAISERROR('>COMPLETE <TST001> - <Payments outside business hours ',0,1) WITH NOWAIT
      
      USE [z'c40ee561-6d97-44f0-b4ca-46a9db4b5b99]
      GO
      /****** Object:  StoredProcedure [Result].[TST002]    Script Date: 19/09/2018 8:58:59 AM ******/
      SET ANSI_NULLS ON
      GO
      SET QUOTED_IDENTIFIER ON
      GO
      ALTER PROC [Result].[TST002]
      AS
      
      /*********************************************************************
      *                           DATA ASSURANCE                           *
      **********************************************************************
      SCRIPT REFERENCE   - TST002
      SCRIPT DESCRIPTION - Vendor test: Duplicate vendor bank account 
      
      UPDATES            - Version 1.0 {23/03/2016} {Russell Taylor} 
      - Version 2.0 {15/07/2016} {Fei Li} {Filter result on paid vendors}
      
      TABLE INFORMATION
      INPUT TABLE(S)
      - [Prepared].[VendorMaseter]						
      - [Prepared].[VendorBank]						
      - [Prepared].[VendorContact]						
      
      OUTPUT TABLE(S)
      - [Result].[TestTResult]
      
      SUMMARY OF SCRIPT -	01. START
      - 02. DELETE TEST REUSLT IF EXISTS
      - 03.	UPDATE TEST RESULT
      - 04. END
      
      **********************************************************************
      01. START
      **********************************************************************/
      RAISERROR('>START <TST002> - Duplicate bank account',0,1) WITH NOWAIT
      
      /**********************************************************************
      02. DELETE TEST REUSLT IF EXISTS
      **********************************************************************/
      RAISERROR('..+Delete test result TST002',0,1) WITH NOWAIT
      
      DELETE FROM [Result].[TestTResult]
      WHERE	[TestID]='TST002' 
      
      /**********************************************************************
      03. CREATE TEMPORARY TABLE
      **********************************************************************/
      RAISERROR('..+Create temporary table [#PaidVendors]',0,1) WITH NOWAIT
      
      IF OBJECT_ID('[tempdb].[dbo].[#PaidVendors]') IS NOT NULL
      DROP TABLE [#PaidVendors]
      
      SELECT			DISTINCT 
      [VENDOR_KEY_PWC]
      INTO			[#PaidVendors]
      FROM			[Prepared].[Payment]
      WHERE			[SCOPE_PWC]=1
      GROUP BY		[VENDOR_KEY_PWC]
      HAVING			Sum([AmountDocument])>0
      
      /*********************************************************************
      04. Update vendor table [Prepared].[VendorBank] with duplicate bank id
      **********************************************************************/
      RAISERROR('..+Update vendor table [Prepared].[VendorBank] with duplicate bank id',0,1) WITH NOWAIT
      
      UPDATE		[Prepared].[VendorBank]
      SET			[Duplicate_Bank_PWC] = D.[Bank_Duplicate_ID]
      FROM		[Prepared].[VendorBank] AS VB
      INNER JOIN	(
      SELECT		Row_Number() Over (Order by BIA.ExtractNumbers([BSB])) as [Bank_Duplicate_ID],
      BIA.ExtractNumbers([BSB]) AS CleanBSB, 
      BIA.ExtractNumbers([BankAccount]) AS CleanAccount		
      FROM		[Prepared].[VendorBank] V
      INNER JOIN	[#PaidVendors]	P
      ON			V.[VENDOR_KEY_PWC]=P.[VENDOR_KEY_PWC]
      WHERE		BIA.ExtractNumbers([BSB]) IS NOT NULL
      GROUP BY	BIA.ExtractNumbers([BSB]), BIA.ExtractNumbers([BankAccount])
      HAVING		Count(*) > 1
      ) AS D
      ON		BIA.ExtractNumbers(VB.[BSB]) = D.CleanBSB
      AND		BIA.ExtractNumbers(VB.[BankAccount]) = D.CleanAccount
      
      
      /*********************************************************************
      05. Update vendor table [Prepared].[VendorContact] with duplicate contact id
      **********************************************************************/
      RAISERROR('..+Update vendor table [Prepared].[VendorContact] with duplicate contact id',0,1) WITH NOWAIT
      
      UPDATE		[Prepared].[VendorContact]
      SET			[Duplicate_Contact_PWC] = D.[Contact_Duplicate_ID]
      FROM		[Prepared].[VendorContact] AS VC
      INNER JOIN	(
      SELECT		Row_Number() Over (Order by BIA.ExtractNumbers([ContactNumber])) as [Contact_Duplicate_ID],
      BIA.ExtractNumbers([ContactNumber]) AS CleanContact
      FROM		[Prepared].[VendorContact]
      WHERE		BIA.ExtractNumbers([ContactNumber]) IS NOT NULL
      AND			Convert(decimal(28,0),BIA.ExtractNumbers([ContactNumber])) <> 0
      GROUP BY	BIA.ExtractNumbers([ContactNumber]) 
      HAVING		Count(*) > 1
      ) AS D
      ON		BIA.ExtractNumbers(VC.[ContactNumber]) = D.CleanContact
      
      
      /*********************************************************************
      06. Update vendor table [Prepared].[VendorMaster] with duplicate ABN id
      **********************************************************************/
      RAISERROR('..+Update vendor table [Prepared].[VendorMaster] with duplicate ABN id',0,1) WITH NOWAIT
      
      UPDATE		[Prepared].[VendorMaster]
      SET			[Duplicate_ABN_PWC] = D.[ABN_Duplicate_ID]
      FROM		[Prepared].[VendorMaster] AS VM
      INNER JOIN	(
      SELECT		Row_Number() Over (Order by BIA.ExtractNumbers([ABN])) as [ABN_Duplicate_ID],
      BIA.ExtractNumbers([ABN]) AS CleanABN
      FROM		[Prepared].[VendorMaster]
      WHERE		BIA.ExtractNumbers([ABN]) IS NOT NULL
      AND			Convert(decimal(28,0),BIA.ExtractNumbers([ABN])) <> 0
      GROUP BY	BIA.ExtractNumbers([ABN]) 
      HAVING		Count(*) > 1
      ) AS D
      ON		BIA.ExtractNumbers(VM.[ABN]) = D.CleanABN
      
      
      /*********************************************************************
      07. UPDATE TEST RESULT
      **********************************************************************/
      RAISERROR('..+Update results table [Result].[TestResult]>',0,1) WITH NOWAIT
      
      INSERT INTO [Result].[TestTResult]
      (
      [KEY_PWC],
      [Type],
      [VENDOR_KEY_PWC],
      [COMPANY_KEY_PWC],
      [TestID],
      [DimensionText],
      [DimensionUnit]
      )
      SELECT		DISTINCT
      J.[VENDOR_KEY_PWC],
      'Vendor',
      J.[VENDOR_KEY_PWC],
      0,
      'TST002',
      'Duplicate',
      'Duplicate'	
      FROM		[Prepared].[VendorBank] AS J 
      WHERE		[Duplicate_Bank_PWC] IS NOT NULL
      
      /**********************************************************************
      08. END
      **********************************************************************/
      RAISERROR('>COMPLETE <TST002> - Duplicate bank accountdate',0,1) WITH NOWAITUSE [z'c40ee561-6d97-44f0-b4ca-46a9db4b5b99]
      GO
      /****** Object:  StoredProcedure [Result].[TST003]    Script Date: 19/09/2018 8:59:20 AM ******/
      SET ANSI_NULLS ON
      GO
      SET QUOTED_IDENTIFIER ON
      GO
      ALTER PROC [Result].[TST003]
      AS
      
      /*********************************************************************
      *                           DATA ASSURANCE                           *
      **********************************************************************
      SCRIPT REFERENCE - TST003
      SCRIPT DESCRIPTION - Invoice test: Vendors with a single invoice
      
      UPDATES            - Version 1.0 {29/03/2016} {Russell Taylor} 
      
      TABLE INFORMATION
      INPUT TABLE(S)
      - [Prepared].[Journal]
      
      OUTPUT TABLE(S)
      - [Result].[TestResult]
      
      SUMMARY OF SCRIPT -	01. <Steps of the scripts>
      
      **********************************************************************
      01. START
      **********************************************************************/
      RAISERROR('>START TST003 - Vendors with a single invoice',0,1) WITH NOWAIT
      
      DELETE		[Result].[TestTResult]
      WHERE		[TestID] = 'TST003'
      
      /*********************************************************************
      02. Update ressults table [Result].[TestResult]
      **********************************************************************/
      RAISERROR('..+Update ressults table [Result].[TestResult]',0,1) WITH NOWAIT
      
      INSERT INTO [Result].[TestTResult]
      (
      [KEY_PWC]-- Must be the Link key [######_KEY_PWC] (i.e, INVOICE_KEY_PWC) 
      ,			[Type] -- Must be one of the following 'Invoice', 'Payment', 'Vendor', 'Purchase', 'Other'
      ,			[VENDOR_KEY_PWC] -- Client vendor ID		
      ,			[COMPANY_KEY_PWC]-- Client company code
      ,			[TestID] -- Must be the Test related to the Store Proc and Test in CAF
      ,			[DimensionText]
      ,			[DimensionUnit]
      )
      
      SELECT		
      [JOURNAL_LINE_PWC]
      ,			'Invoice'
      ,			[VENDOR_KEY_PWC]
      ,			0
      ,			'TST003'	
      ,			'Single invoice'
      ,			'Single invoice'
      FROM		(
      SELECT		
      [VENDOR_KEY_PWC],
      [JOURNAL_LINE_PWC],
      COUNT(*) OVER (	PARTITION BY [VENDOR_KEY_PWC]
      ORDER BY [VENDOR_KEY_PWC]) AS InvoicesPerVendor
      FROM		[Prepared].[Journal]
      WHERE		[TransactionSubType_PWC] = 'IN'
      AND			[Scope_PWC] = 1
      ) AS A  
      WHERE		[InvoicesPerVendor] = 1
      
      /**********************************************************************
      03. END
      **********************************************************************/
      RAISERROR('>COMPLETE TST003 - Vendors with a single invoice',0,1) WITH NOWAITUSE [z'c40ee561-6d97-44f0-b4ca-46a9db4b5b99]
      GO
      /****** Object:  StoredProcedure [Result].[TST004]    Script Date: 19/09/2018 8:59:39 AM ******/
      SET ANSI_NULLS ON
      GO
      SET QUOTED_IDENTIFIER ON
      GO
      ALTER PROC [Result].[TST004]
      AS
      
      /*********************************************************************
      *                           DATA ASSURANCE                           *
      **********************************************************************
      SCRIPT REFERENCE   - TST004
      SCRIPT DESCRIPTION - Payment test: Payments to bank accounts not existing in the vendor master 
      
      UPDATES            - Version 1.0 {11/03/2016} {Fei A Li} 
      
      TABLE INFORMATION
      INPUT TABLE(S)
      - [Prepared].[Payment]
      - [Prepared].[VendorBank]
      
      OUTPUT TABLE(S)
      - [Result].[TestResult]
      
      SUMMARY OF SCRIPT -	01. START
      - 02. DELETE TEST REUSLT IF EXISTS
      - 03. UPDATE TEST RESULT
      - 04. END
      
      **********************************************************************
      01. START
      **********************************************************************/
      RAISERROR('>START <TST004> - Testing payments to bank accounts not in supplier master',0,1) WITH NOWAIT
      
      /**********************************************************************
      02. DELETE TEST REUSLT IF EXISTS
      **********************************************************************/
      
      RAISERROR('..+Delete test result TST004',0,1) WITH NOWAIT
      
      DELETE FROM [Result].[TestTResult]
      WHERE [TestID]='TST004' 
      
      /*********************************************************************
      03. UPDATE TEST RESULT
      **********************************************************************/
      RAISERROR('..+Update results table [Result].[TestResult]',0,1) WITH NOWAIT
      
      INSERT INTO [Result].[TestTResult]
      (
      [KEY_PWC],
      [Type],
      [VENDOR_KEY_PWC],
      [COMPANY_KEY_PWC],
      [TestID],
      [DimensionText],
      [DimensionUnit]
      )
      
      SELECT		DISTINCT 
      PA.[PAYMENT_LINE_PWC],
      'Payment',
      PA.[VENDOR_KEY_PWC],
      0,	
      'TST004',
      CASE 
      WHEN IsNull(VB.[BankAccount],'') = '' THEN 'No bank in master'
      ELSE 'BSB:' + VB.[BSB] + ' Acc:' + VB.[BankAccount]
      END,
      'Bank account of vendor'
      FROM		[Prepared].[Payment] AS PA
      LEFT JOIN	[Prepared].[VendorBank] AS VB
      ON			PA.[BSB]=VB.[BSB] 
      AND		PA.[BankAccount]=VB.[BankAccount]
      AND		PA.[VENDOR_KEY_PWC]=VB.[VENDOR_KEY_PWC]
      WHERE		PA.Scope_PWC = 1
      AND		VB.VENDOR_KEY_PWC IS NULL	
      AND		PA.[BankAccount] IS NOT NULL
      
      
      
      /**********************************************************************
      04. END
      **********************************************************************/
      RAISERROR('>COMPLETE <TST004> - Payments to bank accounts not in supplier master',0,1) WITH NOWAITUSE [z'c40ee561-6d97-44f0-b4ca-46a9db4b5b99]
      GO
      /****** Object:  StoredProcedure [Result].[TST005]    Script Date: 19/09/2018 8:59:56 AM ******/
      SET ANSI_NULLS ON
      GO
      SET QUOTED_IDENTIFIER ON
      GO
      ALTER PROC [Result].[TST005]
      AS
      
      /*********************************************************************
      *                           DATA ASSURANCE                           *
      **********************************************************************
      SCRIPT REFERENCE   - TST005
      SCRIPT DESCRIPTION - Payment teset: Payments to blocked vendors
      
      UPDATES            - Version 1.0 {15/03/2016} {Fei A Li} 
      
      TABLE INFORMATION
      INPUT TABLE(S)
      - [Prepared].[Payment]
      - [Prepared].[VendorMaster]
      
      OUTPUT TABLE(S)
      - [Result].[TestResult]
      
      SUMMARY OF SCRIPT -	01. START
      - 02. DELETE TEST REUSLT IF EXISTS
      - 03. UPDATE TEST RESULT
      - 04. END
      
      **********************************************************************
      01. START
      **********************************************************************/
      RAISERROR('>START <TST005> - Testing payments to blocked vendors',0,1) WITH NOWAIT
      
      /**********************************************************************
      02. DELETE TEST REUSLT IF EXISTS
      **********************************************************************/
      
      RAISERROR('..+Delete test result TST005',0,1) WITH NOWAIT
      
      DELETE FROM [Result].[TestTResult]
      WHERE [TestID]='TST005' 
      
      /*********************************************************************
      03. UPDATE TEST RESULT
      **********************************************************************/
      RAISERROR('..+Update results table [Result].[TestResult]',0,1) WITH NOWAIT
      
      INSERT INTO		[Result].[TestTResult]
      (
      [KEY_PWC],
      [Type],
      [VENDOR_KEY_PWC],
      [COMPANY_KEY_PWC],
      [TestID],
      [DimensionText],
      [DimensionUnit]
      )
      
      SELECT			DISTINCT 
      PA.[PAYMENT_LINE_PWC],
      'Payment',
      PA.[VENDOR_KEY_PWC],
      0,	
      'TST005',
      CASE
      WHEN VE.[CentralPostingBlock]='X' THEN 'Central posting block'
      WHEN VE.[CentralPurchasingBlock]='X' THEN 'Central purchase block'
      WHEN VE.[CentralDeletionFlag]='X' THEN 'Central delete block'
      ELSE 'Not blocked'
      END,
      'Blocked status'
      FROM			[Prepared].[Payment]		PA
      LEFT JOIN		[Prepared].[VendorMaster]	VE
      ON				PA.[VENDOR_KEY_PWC]=VE.[VENDOR_KEY_PWC]
      WHERE			PA.[Scope_PWC] = 1
      AND				CASE 
      WHEN VE.[CentralPostingBlock]='X' THEN 'Central posting block'
      WHEN VE.[CentralPurchasingBlock]='X' THEN 'Central purchase block'
      WHEN VE.[CentralDeletionFlag]='X' THEN 'Central delete block'
      ELSE 'Not blocked'
      END <> 'Not blocked'
      
      /**********************************************************************
      04. END
      **********************************************************************/
      RAISERROR('>COMPLETE <TST005> - Payments to blocked vendors',0,1) WITH NOWAITUSE [z'c40ee561-6d97-44f0-b4ca-46a9db4b5b99]
      GO
      /****** Object:  StoredProcedure [Result].[TST006]    Script Date: 19/09/2018 9:00:12 AM ******/
      SET ANSI_NULLS ON
      GO
      SET QUOTED_IDENTIFIER ON
      GO
      ALTER PROC [Result].[TST006]
      AS
      
      /*********************************************************************
      *                           DATA ASSURANCE                           *
      **********************************************************************
      SCRIPT REFERENCE   - TST006
      SCRIPT DESCRIPTION - Payments test: Payments made before invoice
      
      UPDATES            - Version 1.0 {15/03/2016} {Fei A Li} 
      
      TABLE INFORMATION
      INPUT TABLE(S)
      - [Prepared].[Payment]
      - [Prepared].[Journal]	
      
      OUTPUT TABLE(S)
      - [Result].[TestResult]
      
      SUMMARY OF SCRIPT -	01. START
      - 02. DELETE TEST REUSLT IF EXISTS
      - 03. UPDATE TEST RESULT
      - 04. END
      
      **********************************************************************
      01. START
      **********************************************************************/
      RAISERROR('>START TST006 - Testing payments made before invoice',0,1) WITH NOWAIT
      
      /**********************************************************************
      02. DELETE TEST REUSLT IF EXISTS
      **********************************************************************/
      
      RAISERROR('..+Delete test result TST006',0,1) WITH NOWAIT
      
      DELETE FROM [Result].[TestTResult]
      WHERE	[TestID]='TST006' 
      
      /*********************************************************************
      03. UPDATE TEST RESULT
      **********************************************************************/
      RAISERROR('..+Update results table [Result].[TestResult]>',0,1) WITH NOWAIT
      
      INSERT INTO [Result].[TestTResult]
      (
      [KEY_PWC],
      [Type],
      [VENDOR_KEY_PWC],
      [COMPANY_KEY_PWC],
      [TestID],
      [DimensionText],
      [DimensionUnit],
      [ExceptionFlag]
      )
      
      SELECT		DISTINCT 
      P.[PAYMENT_LINE_PWC],
      'Payment',
      P.[VENDOR_KEY_PWC],
      0,	
      'TST006',
      Convert(NVARCHAR(30), Datediff(Day, P.[Rundate], J.[DocumentDate])),
      'Days',
      CASE WHEN Datediff(Day, P.[Rundate], J.[DocumentDate]) > 0 THEN 1 ELSE 0 END
      FROM		(
      SELECT	
      [PAYMENT_LINE_PWC],
      [INVOICE_KEY_PWC],
      [VENDOR_KEY_PWC],
      [Rundate]
      FROM	[Prepared].[Payment]
      WHERE	[InvoicePaymentMatch_PWC] = 1
      AND		[SCOPE_PWC]=1
      ) AS P
      JOIN		(
      SELECT	
      [INVOICE_KEY_PWC],
      [DocumentDate]
      FROM	[Prepared].[Journal] 
      WHERE	[InvoicePaymentMatch_PWC] = 1
      AND		[SCOPE_PWC]=1
      ) AS	J
      ON			P.[INVOICE_KEY_PWC] = J.[INVOICE_KEY_PWC]
      
      /**********************************************************************
      04. END
      **********************************************************************/
      RAISERROR('>COMPLETE TST006 - Payments made before invoice',0,1) WITH NOWAITUSE [z'c40ee561-6d97-44f0-b4ca-46a9db4b5b99]
      GO
      /****** Object:  StoredProcedure [Result].[TST007]    Script Date: 19/09/2018 9:00:30 AM ******/
      SET ANSI_NULLS ON
      GO
      SET QUOTED_IDENTIFIER ON
      GO
      ALTER PROC [Result].[TST007]
      AS
      
      /*********************************************************************
      *                           DATA ASSURANCE                           *
      **********************************************************************
      SCRIPT REFERENCE   - TST007
      SCRIPT DESCRIPTION - Invocie test: Invocie date greater than entry date
      
      UPDATES            - Version 1.0 {23/03/2016} {Russell Taylor} 
      - Version 1.1 {15/08/2016} {Fei Li} {Update DateDiff(Day,J.[DocumentDate],J.[EntryDate]) -> DateDiff(Day,J.[EntryDate],J.[DocumentDate])}
      
      TABLE INFORMATION
      INPUT TABLE(S)
      - [Prepared].[Journal]						
      OUTPUT TABLE(S)
      - [Result].[TestTResult]
      
      SUMMARY OF SCRIPT -	01. START
      - 02. DELETE TEST REUSLT IF EXISTS
      - 03.	UPDATE TEST RESULT
      - 04. END
      
      **********************************************************************
      01. START
      **********************************************************************/
      RAISERROR('>START <TST007> - Invocie date vs entry date',0,1) WITH NOWAIT
      
      /**********************************************************************
      02. DELETE TEST REUSLT IF EXISTS
      **********************************************************************/
      
      RAISERROR('..+Delete test result TST007',0,1) WITH NOWAIT
      
      DELETE FROM [Result].[TestTResult]
      WHERE	[TestID]='TST007' 
      
      /*********************************************************************
      03. UPDATE TEST RESULT
      **********************************************************************/
      RAISERROR('..+Update results table [Result].[TestResult]>',0,1) WITH NOWAIT
      
      INSERT INTO [Result].[TestTResult]
      (
      [KEY_PWC],
      [Type],
      [VENDOR_KEY_PWC],
      [COMPANY_KEY_PWC],
      [TestID],
      [DimensionText],
      [DimensionUnit],
      [ExceptionFlag]
      )
      
      SELECT		J.[JOURNAL_LINE_PWC],
      'Invoice',
      J.[VENDOR_KEY_PWC],
      0,
      'TST007',
      Convert(NVARCHAR(30), DateDiff(Day, J.[EntryDate],J.[DocumentDate])),
      'Days',
      CASE WHEN DateDiff(Day,J.[EntryDate],J.[DocumentDate]) > 0 THEN 1 ELSE 0 END 
      FROM		[Prepared].[Journal]  AS J
      WHERE		[Scope_PWC] = 1
      AND			[TransactionType_PWC] = 'INV'
      
      /**********************************************************************
      04. END
      **********************************************************************/
      RAISERROR('>COMPLETE <TST007> - Invocie date vs entry date',0,1) WITH NOWAITUSE [z'c40ee561-6d97-44f0-b4ca-46a9db4b5b99]
      GO
      /****** Object:  StoredProcedure [Result].[TST008]    Script Date: 19/09/2018 9:01:23 AM ******/
      SET ANSI_NULLS ON
      GO
      SET QUOTED_IDENTIFIER ON
      GO
      ALTER PROC [Result].[TST008]
      AS
      
      /*********************************************************************
      *                           DATA ASSURANCE                           *
      **********************************************************************
      SCRIPT REFERENCE   - TST008
      SCRIPT DESCRIPTION - Invoice test: One-time vendor invoice
      
      UPDATES            - Version 1.0 {15/03/2016} {Fei A Li} 
      
      TABLE INFORMATION
      INPUT TABLE(S)
      - [Prepared].[VendorMaster]
      - [Prepared].[Journal]	
      
      OUTPUT TABLE(S)
      - [Result].[TestTResult]
      
      SUMMARY OF SCRIPT -	01. START
      - 02. DELETE TEST REUSLT IF EXISTS
      - 03. UPDATE TEST RESULT
      - 04. END
      
      **********************************************************************
      01. START
      **********************************************************************/
      RAISERROR('>START <TST008> - Testing One-time Vendor invoice',0,1) WITH NOWAIT
      /**********************************************************************
      02. DELETE TEST REUSLT IF EXISTS
      **********************************************************************/
      
      RAISERROR('..+Delete test result TST008',0,1) WITH NOWAIT
      
      DELETE FROM [Result].[TestTResult]
      WHERE	[TestID]='TST008' 
      
      /*********************************************************************
      03. UPDATE TEST RESULT
      **********************************************************************/
      RAISERROR('..+Update results table [Result].[TestResult]',0,1) WITH NOWAIT
      
      INSERT INTO [Result].[TestTResult]
      (
      [KEY_PWC],
      [Type],
      [VENDOR_KEY_PWC],
      [COMPANY_KEY_PWC],
      [TestID],
      [DimensionText],
      [DimensionUnit]
      )
      
      SELECT		DISTINCT 
      J.[JOURNAL_LINE_PWC],
      'Invoice',
      J.[VENDOR_KEY_PWC],
      0,	
      'TST008',
      'One-time',
      'Vendor'
      FROM		[Prepared].[Journal] AS J
      JOIN		[Prepared].[VendorMaster] AS VM 
      ON			J.[VENDOR_KEY_PWC]=VM.[VENDOR_KEY_PWC]
      --In-scope
      WHERE		J.[SCOPE_PWC]=1
      --Vendor flag as one-time 
      AND			VM.[OneTimeFlag]='X'
      --Include invoice posting outside review period 
      AND			J.[TransactionType_PWC]='INV'
      
      /**********************************************************************
      04. END
      **********************************************************************/
      RAISERROR('>COMPLETE <TST008> - One-time Vendor invoice',0,1) WITH NOWAITUSE [z'c40ee561-6d97-44f0-b4ca-46a9db4b5b99]
      GO
      /****** Object:  StoredProcedure [Result].[TST009]    Script Date: 19/09/2018 9:01:35 AM ******/
      SET ANSI_NULLS ON
      GO
      SET QUOTED_IDENTIFIER ON
      GO
      ALTER PROC [Result].[TST009]
      AS
      
      /*********************************************************************
      *                           DATA ASSURANCE                           *
      **********************************************************************
      SCRIPT REFERENCE   - TST009
      SCRIPT DESCRIPTION - Payment test: One-time vendor payments
      
      UPDATES            - Version 1.0 {15/03/2016} {Fei A Li} 
      
      TABLE INFORMATION
      INPUT TABLE(S)
      - [Prepared].[VendorMaster]
      - [Prepared].[Payment]	
      
      OUTPUT TABLE(S)
      - [Result].[TestTResult]
      
      SUMMARY OF SCRIPT -	01. START
      - 02. DELETE TEST REUSLT IF EXISTS
      - 03. UPDATE TEST RESULT
      - 04. END
      
      **********************************************************************
      01. START
      **********************************************************************/
      RAISERROR('>START <TST009> - Testing One-time Vendor payments',0,1) WITH NOWAIT
      
      /**********************************************************************
      02. DELETE TEST REUSLT IF EXISTS
      **********************************************************************/
      
      RAISERROR('..+Delete test result TST009',0,1) WITH NOWAIT
      
      DELETE FROM [Result].[TestTResult]
      WHERE [TestID]='TST009' 
      
      /*********************************************************************
      03. UPDATE TEST RESULT
      **********************************************************************/
      RAISERROR('..+Update results table [Result].[TestResult]>',0,1) WITH NOWAIT
      
      INSERT INTO [Result].[TestTResult]
      (
      [KEY_PWC],
      [Type],
      [VENDOR_KEY_PWC],
      [COMPANY_KEY_PWC],
      [TestID],
      [DimensionText],
      [DimensionUnit]
      )
      
      SELECT		DISTINCT 
      P.[PAYMENT_LINE_PWC],
      'Payment',
      P.[VENDOR_KEY_PWC],
      0,	
      'TST009',
      'One-time',
      'Vendor'
      FROM		[Prepared].[Payment] P
      JOIN		[Prepared].[VendorMaster] VM 
      ON			P.[VENDOR_KEY_PWC]=VM.[VENDOR_KEY_PWC]
      --In-scope
      WHERE		P.[SCOPE_PWC]=1
      --Vendor flag as one-time 
      AND			VM.[OneTimeFlag]='X'
      
      /**********************************************************************
      04. END
      **********************************************************************/
      RAISERROR('>COMPLETE <TST009> - One-time Vendor payments',0,1) WITH NOWAITUSE [z'c40ee561-6d97-44f0-b4ca-46a9db4b5b99]
      GO
      /****** Object:  StoredProcedure [Result].[TST010]    Script Date: 19/09/2018 9:01:51 AM ******/
      SET ANSI_NULLS ON
      GO
      SET QUOTED_IDENTIFIER ON
      GO
      ALTER PROC [Result].[TST010]
      AS
      
      /*********************************************************************
      *                           DATA ASSURANCE                           *
      **********************************************************************
      SCRIPT REFERENCE   - TST010
      SCRIPT DESCRIPTION - Invoice test: Duplicate invoices
      
      UPDATES            - Version 1.0 {15/03/2016} {Russell Taylor} 
      
      TABLE INFORMATION
      INPUT TABLE(S)
      - [Prepared].[VendorMaster]
      - [Prepared].[Payment]	
      
      OUTPUT TABLE(S)
      - [Result].[TestTResult]
      
      SUMMARY OF SCRIPT -	01. START
      - 02. DELETE TEST REUSLT IF EXISTS
      - 03. UPDATE TEST RESULT
      - 04. END
      
      **********************************************************************
      01. START
      **********************************************************************/
      RAISERROR('>START <TST010> - Testing Duplicate invoices',0,1) WITH NOWAIT
      
      /**********************************************************************
      02. DELETE TEST REUSLT IF EXISTS
      **********************************************************************/
      RAISERROR('..+Delete test result TST010',0,1) WITH NOWAIT
      
      DELETE FROM [Result].[TestTResult]
      WHERE [TestID]='TST010' 
      
      
      /**********************************************************************
      03. Create credit notes list into [#CreditNotes]
      **********************************************************************/
      RAISERROR('..+Create credit notes list into [#CreditNotes]',0,1) WITH NOWAIT
      
      IF OBJECT_ID('[tempdb].[dbo].[#CreditNotes]') IS NOT NULL
      DROP TABLE [#CreditNotes]
      
      SELECT
      [COMPANY_KEY_PWC],
      [VENDOR_KEY_PWC],
      [ClearingDocumentNumber],
      Abs([AmountDocument]) AS AbsAmount,
      SUM(Iif([TransactionSubType_PWC] = 'IN', 1, 0)) AS [CountInvoices], 
      SUM(Iif([TransactionSubType_PWC] = 'CN', 1, 0)) AS [CountCreditNoes] 
      INTO		[#CreditNotes]
      FROM		[Prepared].[Journal] AS J
      WHERE		[Scope_PWC] = 1
      AND			[TransactionType_PWC] = 'INV'
      GROUP BY
      [COMPANY_KEY_PWC],
      [VENDOR_KEY_PWC],
      [ClearingDocumentNumber],
      Abs([AmountDocument]) 
      
      /**********************************************************************
      04. Create invoice list into [#CreditNotes]
      **********************************************************************/
      RAISERROR('..+Create invoice list into [#Invoices]',0,1) WITH NOWAIT
      
      IF OBJECT_ID('[tempdb].[dbo].[#Invoices]') IS NOT NULL
      DROP TABLE [#Invoices]
      
      SELECT
      [JOURNAL_LINE_PWC],
      [COMPANY_KEY_PWC],
      [VENDOR_KEY_PWC],
      [ClearingDocumentNumber],
      [VendorInvoiceNumber],
      [TransactionSubType_PWC],
      [DocumentDate],
      [AmountDocument],
      [CurrencyKeyDocument],
      Abs([AmountDocument]) AS AbsAmount
      INTO		[#Invoices]
      FROM		[Prepared].[Journal] AS J
      WHERE		[Scope_PWC] = 1
      AND			[TransactionType_PWC] = 'INV'
      
      /**********************************************************************
      05. Create invoice match off with credit notes into [#InvoicesCreditNote]
      **********************************************************************/
      RAISERROR('..+Create invoice match off with credit notes into [#InvoicesCreditNote]',0,1) WITH NOWAIT
      
      IF OBJECT_ID('[tempdb].[dbo].[#InvoicesCreditNote]') IS NOT NULL
      DROP TABLE [#InvoicesCreditNote]
      
      SELECT
      I.[JOURNAL_LINE_PWC],
      I.[COMPANY_KEY_PWC],
      I.[VENDOR_KEY_PWC],
      I.[ClearingDocumentNumber],
      I.[AbsAmount],
      I.[TransactionSubType_PWC],
      I.[DocumentDate],
      I.[AmountDocument],
      I.[CurrencyKeyDocument],
      CN.[CountInvoices], 
      CN.[CountCreditNoes],
      I.[VendorInvoiceNumber],
      Convert(BIGINT, BIA.ExtractNumbers(I.[VendorInvoiceNumber])) AS [VendorInvoiceNumberClean]
      INTO		[#InvoicesCreditNote]
      FROM		[#Invoices] AS I
      JOIN		[#CreditNotes] AS CN
      ON			I.[COMPANY_KEY_PWC] = CN.[COMPANY_KEY_PWC] 
      AND			I.[VENDOR_KEY_PWC] = CN.[VENDOR_KEY_PWC]
      AND			I.[ClearingDocumentNumber] = CN.[ClearingDocumentNumber]
      AND			I.AbsAmount = CN.AbsAmount
      WHERE		CN.[CountInvoices] > CN.[CountCreditNoes]
      
      /**********************************************************************
      06. Create fuzzy match with vendor listing into [#FussyMatchVendor]
      **********************************************************************/
      RAISERROR('..+Create fuzzy match with vendor listing into [#FussyMatchVendor]',0,1) WITH NOWAIT
      
      IF OBJECT_ID('[tempdb].[dbo].[#FussyMatchVendor]') IS NOT NULL
      DROP TABLE [#FussyMatchVendor]
      
      SELECT 
      ROW_NUMBER() Over (Order by ICN.[VENDOR_KEY_PWC]) AS [DuplicateID_PWC], 
      ICN.[VENDOR_KEY_PWC],
      ICN.[DocumentDate],
      ICN.[AbsAmount],
      ICN.[CurrencyKeyDocument],
      ICN.[VendorInvoiceNumberClean],
      'Match: Fuzzy Invoice, Vendor, Date and Amount' AS [DuplicateMatchNote_PWC],
      Count(*) AS [NumberOfMatchers],
      Max(ICN.[CountInvoices]) AS [NoOfInvoices],
      Max(ICN.[CountCreditNoes]) AS [NoOfCreditNotes],
      Sum(ICN.[AmountDocument]) AS [NetAmount]
      INTO		[#FussyMatchVendor]
      FROM		[#InvoicesCreditNote] AS ICN
      WHERE		ICN.[TransactionSubType_PWC] = 'IN'
      GROUP BY
      ICN.[VENDOR_KEY_PWC],
      ICN.[DocumentDate],
      ICN.[AbsAmount],
      ICN.[CurrencyKeyDocument],
      ICN.[VendorInvoiceNumberClean]
      -- Number of duplicates is greater than 1
      HAVING		Count(*) > 1
      -- Net impact is not zero
      AND			Sum([AmountDocument]) <> 0
      -- Invoice has to be 2 transaction greater than credit note
      AND			Count(*) > Max(ICN.[CountCreditNoes]) + 1
      
      /**********************************************************************
      07. Create fuzzy match without vendor listing into [#FussyMatch]
      **********************************************************************/
      RAISERROR('..+Create fuzzy match without vendor listing into [#FussyMatch]',0,1) WITH NOWAIT
      
      DECLARE @DupNumber AS INT
      
      SET @DupNumber = (SELECT Max([DuplicateID_PWC]) FROM [#FussyMatchVendor])
      
      
      IF OBJECT_ID('[tempdb].[dbo].[#FussyMatch]') IS NOT NULL
      DROP TABLE [#FussyMatch]
      
      SELECT 
      @DupNumber + ROW_NUMBER() Over (Order by ICN.[DocumentDate]) AS [DuplicateID_PWC], 
      ICN.[DocumentDate],
      ICN.[AbsAmount],
      ICN.[CurrencyKeyDocument],
      ICN.[VendorInvoiceNumberClean],
      'Match: Fuzzy Invoice, Date and Amount' AS [DuplicateMatchNote_PWC],
      Count(*) AS [NumberOfMatchers],
      Max(ICN.[CountInvoices]) AS [NoOfInvoices],
      Max(ICN.[CountCreditNoes]) AS [NoOfCreditNotes],
      Sum(ICN.[AmountDocument]) AS [NetAmount]
      INTO		[#FussyMatch]
      FROM		[#InvoicesCreditNote] AS ICN
      LEFT JOIN	[#FussyMatchVendor] AS FMV
      ON			ICN.[DocumentDate] = FMV.[DocumentDate] 
      AND			ICN.[AbsAmount] = FMV.[AbsAmount]
      AND			ICN.[CurrencyKeyDocument] = FMV.[CurrencyKeyDocument]
      AND			ICN.[VendorInvoiceNumberClean] = FMV.[VendorInvoiceNumberClean]
      AND			ICN.[VENDOR_KEY_PWC] = FMV.[VENDOR_KEY_PWC]
      WHERE		ICN.[TransactionSubType_PWC] = 'IN'
      AND			FMV.[AbsAmount] IS NULL
      GROUP BY
      ICN.[DocumentDate],
      ICN.[AbsAmount],
      ICN.[CurrencyKeyDocument],
      ICN.[VendorInvoiceNumberClean]
      -- Number of duplicates is greater than 1
      HAVING		Count(*) > 1
      -- Net impact is not zero
      AND			Sum(ICN.[AmountDocument]) <> 0
      -- Invoice has to be 2 transaction greater than credit note
      AND			Count(*) > Max(ICN.[CountCreditNoes]) + 1
      
      
      /*********************************************************************
      08. UPDATE TEST RESULT
      **********************************************************************/
      RAISERROR('..+Update results table [Result].[TestResult]>',0,1) WITH NOWAIT
      
      INSERT INTO [Result].[TestTResult]
      (
      [KEY_PWC],
      [Type],			[VENDOR_KEY_PWC],
      [COMPANY_KEY_PWC],
      [TestID],
      [DimensionText],
      [DimensionUnit]
      )
      
      SELECT		
      ICN.[JOURNAL_LINE_PWC],
      'Invoice',
      ICN.[VENDOR_KEY_PWC],
      0,	
      'TST010',
      'High match: ' + Convert(NVARCHAR(5), DuplicateID_PWC),
      'Duplicate ID'
      FROM		[#InvoicesCreditNote] AS ICN
      JOIN		[#FussyMatchVendor] AS FMV
      ON			ICN.[DocumentDate] = FMV.[DocumentDate] 
      AND			ICN.[AbsAmount] = FMV.[AbsAmount]
      AND			ICN.[CurrencyKeyDocument] = FMV.[CurrencyKeyDocument]
      AND			ICN.[VendorInvoiceNumberClean] = FMV.[VendorInvoiceNumberClean]
      AND			ICN.[VENDOR_KEY_PWC] = FMV.[VENDOR_KEY_PWC]
      
      UNION ALL 
      
      SELECT		
      ICN.[JOURNAL_LINE_PWC],
      'Invoice',
      ICN.[VENDOR_KEY_PWC],
      0,	
      'TST010',
      'Low match: ' + Convert(NVARCHAR(5), FM.DuplicateID_PWC),
      'Duplicate ID'
      FROM		[#InvoicesCreditNote] AS ICN
      JOIN		[#FussyMatch] AS FM
      ON			ICN.[DocumentDate] = FM.[DocumentDate] 
      AND			ICN.[AbsAmount] = FM.[AbsAmount]
      AND			ICN.[CurrencyKeyDocument] = FM.[CurrencyKeyDocument]
      AND			ICN.[VendorInvoiceNumberClean] = FM.[VendorInvoiceNumberClean]
      JOIN		[#FussyMatchVendor] AS FMV
      ON			ICN.[DocumentDate] = FMV.[DocumentDate] 
      AND			ICN.[AbsAmount] = FMV.[AbsAmount]
      AND			ICN.[CurrencyKeyDocument] = FMV.[CurrencyKeyDocument]
      AND			ICN.[VendorInvoiceNumberClean] = FMV.[VendorInvoiceNumberClean]
      AND			ICN.[VENDOR_KEY_PWC] = FMV.[VENDOR_KEY_PWC]
      WHERE		FMV.[VENDOR_KEY_PWC] IS NULL
      
      /**********************************************************************
      04. END
      **********************************************************************/
      RAISERROR('>COMPLETE <TST010> - Duplicate invoices',0,1) WITH NOWAITUSE [z'c40ee561-6d97-44f0-b4ca-46a9db4b5b99]
      GO
      /****** Object:  StoredProcedure [Result].[TST011]    Script Date: 19/09/2018 9:02:11 AM ******/
      SET ANSI_NULLS ON
      GO
      SET QUOTED_IDENTIFIER ON
      GO
      ALTER PROC [Result].[TST011]
      AS
      
      /*********************************************************************
      *                           DATA ASSURANCE                           *
      **********************************************************************
      SCRIPT REFERENCE   - TST011
      SCRIPT DESCRIPTION - Invalid vendor name
      
      UPDATES            - Version 1.0 {29/03/2016} {Fei A Li} 
      
      TABLE INFORMATION
      INPUT TABLE(S)
      - [Prepared].[VendorMaster]
      - [Prepared].[Parameters]
      - [^BIA Master Data].[store].[ABN_LISTING]
      
      OUTPUT TABLE(S)
      - [Result].[TestTResult]
      
      SUMMARY OF SCRIPT -	01. START
      - 02. DELETE TEST REUSLT IF EXISTS
      - 03. DROP TEMPORARY TABLE IF EXISTS
      - 04. CREATE TEMPORAY TABLE
      - 05. UPDATE TEST RESULT
      - 06. END
      
      **********************************************************************
      01. START
      **********************************************************************/
      RAISERROR('>START <TST011> - Testing invalid vendor name',0,1) WITH NOWAIT
      
      /**********************************************************************
      02. DELETE TEST REUSLT IF EXISTS
      **********************************************************************/
      RAISERROR('..+Delete test result TST011',0,1) WITH NOWAIT
      
      DELETE FROM [Result].[TestTResult]
      WHERE	[TestID]='TST011' 
      
      /**********************************************************************
      03. DROP TEMPORARY TABLE IF EXISTS
      **********************************************************************/
      RAISERROR('..+Drop temporary table [#NAME] if exists',0,1) WITH NOWAIT
      
      IF OBJECT_ID ('tempdb.dbo.#NAME') IS NOT NULL
      DROP TABLE  [#NAME]
      
      /**********************************************************************
      04. CREATE TEMPORAY TABLE
      **********************************************************************/
      SELECT		
      VM.[VENDOR_KEY_PWC],
      Max(PA.[AppledText]) AS [AppledText]
      INTO		[#NAME]
      FROM		 [Prepared].[VendorMaster] VM
      ,[Prepared].[Parameters]   PA
      WHERE
      UPPER(VendorName) LIKE '%' +
      PA.[AppledText] + '%'
      GROUP BY
      VM.[VENDOR_KEY_PWC]
      
      
      /*********************************************************************
      05. UPDATE TEST RESULT
      **********************************************************************/
      RAISERROR('..+Update results table [Result].[TestResult]',0,1) WITH NOWAIT
      
      INSERT INTO [Result].[TestTResult]
      (
      [KEY_PWC],
      [Type],
      [VENDOR_KEY_PWC],
      [COMPANY_KEY_PWC],
      [TestID],
      [DimensionText],
      [DimensionUnit]
      )
      
      SELECT		DISTINCT 
      VM.[VENDOR_KEY_PWC],
      'Vendor',
      VM.[VENDOR_KEY_PWC],
      0,	
      'TST011',
      CASE 
      WHEN N.[AppledText] IS NOT NULL AND VM.[VendorCountry] <> 'AU' THEN 'Non-AU vendor containing "' + Lower([AppledText]) + '"'
      WHEN N.[AppledText] IS NOT NULL  THEN 'Non-AU vendor containing "' + Lower([AppledText]) + '"'
      WHEN VM.[VendorCountry] <> 'AU' THEN 'Non-AU vendor'
      WHEN ABN.[SearchABN] IS NULL THEN 'AU vendor not listed'
      ELSE 'AU vendor ' + Lower(Substring([BIA].[EvaluateSimularity](VM.[VendorName],ABN.[ORGANISATIONNAME]),3,20)) + ' to ABN register' END,				
      'Name match type'
      FROM		[Prepared].[VendorMaster] AS VM
      LEFT JOIN   [^BIA Master Data].[store].[ABN_LISTING] AS ABN
      ON			[BIA].[ExtractNumbers](VM.ABN)= ABN.[SearchABN]
      LEFT JOIN   [#NAME] AS N
      ON			VM.[VENDOR_KEY_PWC]=N.[VENDOR_KEY_PWC]
      
      
      select distinct
      CASE 
      WHEN N.[AppledText] IS NOT NULL AND VM.[VendorCountry] <> 'AU' THEN 'Non-AU vendor containing "' + Lower([AppledText]) + '"'
      WHEN N.[AppledText] IS NOT NULL  THEN 'Non-AU vendor containing "' + Lower([AppledText]) + '"'
      WHEN VM.[VendorCountry] <> 'AU' THEN 'Non-AU vendor'
      WHEN ABN.[SearchABN] IS NULL THEN 'AU vendor not listed'
      ELSE 'AU vendor ' + Lower(Substring([BIA].[EvaluateSimularity](VM.[VendorName],ABN.[ORGANISATIONNAME]),3,20)) + ' to ABN register' END,				
      'Name match type'
      FROM		[Prepared].[VendorMaster] AS VM
      LEFT JOIN   [^BIA Master Data].[store].[ABN_LISTING] AS ABN
      ON			[BIA].[ExtractNumbers](VM.ABN)= ABN.[SearchABN]
      LEFT JOIN   [#NAME] AS N
      ON			VM.[VENDOR_KEY_PWC]=N.[VENDOR_KEY_PWC]
      
      
      /**********************************************************************
      06. END
      **********************************************************************/
      RAISERROR('>COMPLETE <TST011> - Testing invalid vendor name',0,1) WITH NOWAITUSE [z'c40ee561-6d97-44f0-b4ca-46a9db4b5b99]
      GO
      /****** Object:  StoredProcedure [Result].[TST012]    Script Date: 19/09/2018 9:02:32 AM ******/
      SET ANSI_NULLS ON
      GO
      SET QUOTED_IDENTIFIER ON
      GO
      ALTER PROC [Result].[TST012]
      AS
      
      /*********************************************************************
      *                           DATA ASSURANCE                           *
      **********************************************************************
      SCRIPT REFERENCE   - TST012
      SCRIPT DESCRIPTION - Invoice test: Invoices with different payment terms
      
      UPDATES            - Version 1.0 {21/03/2016} {Fei A Li} 
      
      TABLE INFORMATION
      INPUT TABLE(S)
      - [Prepared].[VendorMaster]
      - [Prepared].[Journal]
      - [Interface].[VendorCompanyCodeLevel]	
      
      OUTPUT TABLE(S)
      - [Result].[TestTResult]
      
      SUMMARY OF SCRIPT -	01. START
      - 02. DELETE TEST REUSLT IF EXISTS
      - 03. UPDATE TEST RESULT
      - 04. END
      
      **********************************************************************
      01. START
      **********************************************************************/
      RAISERROR('>START <TST012> - Testing invoices with different Payment Terms',0,1) WITH NOWAIT
      
      /**********************************************************************
      02. DELETE TEST REUSLT IF EXISTS
      **********************************************************************/
      
      RAISERROR('..+Delete test result TST012',0,1) WITH NOWAIT
      
      DELETE FROM [Result].[TestTResult]
      WHERE	[TestID]='TST012' 
      
      /*********************************************************************
      03. UPDATE TEST RESULT
      **********************************************************************/
      RAISERROR('..+Update results table [Result].[TestResult]>',0,1) WITH NOWAIT
      
      INSERT INTO [Result].[TestTResult]
      (
      [KEY_PWC],
      [Type],
      [VENDOR_KEY_PWC],
      [COMPANY_KEY_PWC],
      [TestID],
      [DimensionText],
      [DimensionUnit],
      [ExceptionFlag]
      )
      
      SELECT		DISTINCT 
      J.[JOURNAL_LINE_PWC],
      'Invoice',
      J.[VENDOR_KEY_PWC],
      0,	
      'TST012',
      
      -- Difference 
      Convert(NVARCHAR(20), VE.[TermsCodeDays] - J.[TermsCodeDays]),
      'Days',
      CASE WHEN VE.[TermsCodeDays] - J.[TermsCodeDays] <> 0 THEN 1 ELSE 0 END
      FROM		[Prepared].[Journal] AS J
      JOIN		[Prepared].[VendorEntity] AS VE	
      ON			J.[VENDOR_KEY_PWC]=VE.[VENDOR_KEY_PWC]
      AND			J.[COMPANY_KEY_PWC]=VE.[COMPANY_KEY_PWC]
      
      --In-scope
      WHERE		[Scope_PWC] = 1
      --Invoice lines only
      AND			[TransactionType_PWC] ='INV'
      --Terms different 
      AND			VE.[TermsCodeDays] - J.[TermsCodeDays] <> 0 
      
      /**********************************************************************
      04. END
      **********************************************************************/
      RAISERROR('>COMPLETE <TST012> - Testing invoices with different Payment Terms',0,1) WITH NOWAITUSE [z'c40ee561-6d97-44f0-b4ca-46a9db4b5b99]
      GO
      /****** Object:  StoredProcedure [Result].[TST013]    Script Date: 19/09/2018 9:02:50 AM ******/
      SET ANSI_NULLS ON
      GO
      SET QUOTED_IDENTIFIER ON
      GO
      ALTER PROC [Result].[TST013]
      AS
      
      /*********************************************************************
      *                           DATA ASSURANCE                           *
      **********************************************************************
      SCRIPT REFERENCE   - TST013
      SCRIPT DESCRIPTION - Invalid vendor bank account
      
      UPDATES            - Version 1.0 {24/03/2016} {Fei A Li} 
      
      TABLE INFORMATION
      INPUT TABLE(S)
      - [Prepared].[VendorMaster]
      - [Prepared].[VendorBank]
      - [^BIA Master Data].[store].[BSB_LISTING]
      
      OUTPUT TABLE(S)
      - [Result].[TestTResult]
      
      SUMMARY OF SCRIPT -	01. START
      - 02. DELETE TEST REUSLT IF EXISTS
      - 03. DROP TEMPORARY TABLE IF EXISTS
      - 04. CREATE TEMPORARY TABLE
      - 03. UPDATE TEST RESULT
      - 04. END
      
      **********************************************************************
      01. START
      **********************************************************************/
      RAISERROR('>START <TST013> - Testing invalid bank account',0,1) WITH NOWAIT
      
      /**********************************************************************
      02. DELETE TEST REUSLT IF EXISTS
      **********************************************************************/
      
      RAISERROR('..+Delete test result TST013',0,1) WITH NOWAIT
      
      DELETE FROM [Result].[TestTResult]
      WHERE	[TestID]='TST013' 
      
      /**********************************************************************
      03. DROP TEMPORARY TABLE IF EXISTS
      **********************************************************************/
      RAISERROR('..+Drop temporary table [#BSB] if exists',0,1) WITH NOWAIT
      
      IF OBJECT_ID ('tempdb.dbo.#BSB') IS NOT NULL
      DROP TABLE  [#BSB]
      
      /**********************************************************************
      04. CREATE TEMPORARY TABLE
      **********************************************************************/
      
      RAISERROR('..+Create temporary table [#BSB] if exists',0,1) WITH NOWAIT
      
      SELECT		VB.[VENDOR_KEY_PWC],
      RIGHT ('000000'+ [BIA].[ExtractNumbers](IsNull(VB.BSB,'')),6)	AS PWC_BSB,
      CASE WHEN Upper(VM.VendorCountry)='AU'	THEN 1 ELSE 0 END AS PWC_AU_VENDOR,
      CASE WHEN Len([BIA].[ExtractNumbers](VB.BSB)) BETWEEN 4 AND 6 THEN 1 ELSE 0 END AS PWC_AU_BSB 
      INTO		[#BSB]
      FROM		[Prepared].[VendorBank]  AS VB
      JOIN		[Prepared].[VendorMaster]  AS VM
      ON			VB.[VENDOR_KEY_PWC]=VM.[VENDOR_KEY_PWC]
      
      
      /*********************************************************************
      05. UPDATE TEST RESULT
      **********************************************************************/
      RAISERROR('..+Update results table [Result].[TestResult]',0,1) WITH NOWAIT
      
      INSERT INTO [Result].[TestTResult]
      (
      [KEY_PWC],
      [Type],
      [VENDOR_KEY_PWC],
      [COMPANY_KEY_PWC],
      [TestID],
      [DimensionText],
      [DimensionUnit]
      )
      
      SELECT		DISTINCT 
      VB.[VENDOR_KEY_PWC],
      'Vendor',
      VB.[VENDOR_KEY_PWC],
      0,	
      'TST013',
      CASE	
      WHEN VB.PWC_BSB='000000'	  AND PWC_AU_VENDOR	=0						THEN 'Non-AU vendor'
      WHEN PWC_AU_BSB=0			  AND PWC_AU_VENDOR	=0						THEN 'Non-AU vendor' 
      
      WHEN BSBL.PWC_BSB IS NULL 	  AND PWC_AU_BSB=1	AND PWC_AU_VENDOR	=0  THEN 'Non-AU vendor with AU BSB listed'
      WHEN BSBL.PWC_BSB IS NOT NULL AND PWC_AU_BSB=1	AND PWC_AU_VENDOR	=0  THEN 'Non-AU vendor with AU BSB not listed' 
      
      WHEN VB.PWC_BSB='000000'	  											THEN 'AU vendor with no BSB'
      WHEN PWC_AU_BSB=0														THEN 'AU vendor with non-AU BSB' 
      WHEN BSBL.PWC_BSB IS NULL 	  											THEN 'AU vendor with BSB not listed' 
      
      ELSE 'AU vendor with AU BSB listed' END,
      'BSB check result'
      FROM		[#BSB]	VB
      LEFT JOIN	[^BIA Master Data].[store].[BSB_LISTING] BSBL
      ON			VB.PWC_BSB=BSBL.PWC_BSB
      WHERE		
      CASE	
      WHEN VB.PWC_BSB='000000'	  AND PWC_AU_VENDOR	=0						THEN 'Non-AU vendor'
      WHEN PWC_AU_BSB=0			  AND PWC_AU_VENDOR	=0						THEN 'Non-AU vendor' 
      
      WHEN BSBL.PWC_BSB IS NULL 	  AND PWC_AU_BSB=1	AND PWC_AU_VENDOR	=0  THEN 'Non-AU vendor with AU BSB listed'
      WHEN BSBL.PWC_BSB IS NOT NULL AND PWC_AU_BSB=1	AND PWC_AU_VENDOR	=0  THEN 'Non-AU vendor with AU BSB not listed' 
      
      WHEN VB.PWC_BSB='000000'	  											THEN 'AU vendor with no BSB'
      WHEN PWC_AU_BSB=0														THEN 'AU vendor with non-AU BSB ' 
      WHEN BSBL.PWC_BSB IS NULL 	  											THEN 'AU vendor with BSB not listed' 
      
      ELSE 'AU vendor with AU BSB listed' END
      <> 'AU vendor with AU BSB listed'
      
      
      /**********************************************************************
      06. END
      **********************************************************************/
      RAISERROR('>COMPLETE <TST013> - Testing invalid bank account',0,1) WITH NOWAITUSE [z'c40ee561-6d97-44f0-b4ca-46a9db4b5b99]
      GO
      /****** Object:  StoredProcedure [Result].[TST014]    Script Date: 19/09/2018 9:03:08 AM ******/
      SET ANSI_NULLS ON
      GO
      SET QUOTED_IDENTIFIER ON
      GO
      ALTER PROC [Result].[TST014]
      AS
      
      /*********************************************************************
      *                           DATA ASSURANCE                           *
      **********************************************************************
      SCRIPT REFERENCE   - TST014
      SCRIPT DESCRIPTION - Payment test: Round dollar payments
      
      UPDATES            - Version 1.0 {21/03/2016} {Fei A Li}
      - Version 1.1 {08/08/2016} {Fei A Li}
      
      TABLE INFORMATION
      INPUT TABLE(S)
      - [Prepared].[Payment]	
      
      OUTPUT TABLE(S)
      - [Result].[TestTResult]
      
      SUMMARY OF SCRIPT -	01. START
      - 02. DELETE TEST REUSLT IF EXISTS
      - 03. DECLARE VARIABLES
      - 04.	CREATE TEMPORARY TABLE
      - 05. UPDATE TEST RESULT
      - 06. END
      
      **********************************************************************
      01. START
      **********************************************************************/
      RAISERROR('>START <TST014> - Round dollar payments',0,1) WITH NOWAIT
      
      /**********************************************************************
      02. DELETE TEST REUSLT IF EXISTS
      **********************************************************************/
      
      RAISERROR('..+Delete test result TST014',0,1) WITH NOWAIT
      
      DELETE FROM [Result].[TestTResult]
      WHERE [TestID]='TST014'
      
      /**********************************************************************
      03. DECLARE VARIABLES
      **********************************************************************/
      RAISERROR('..+Declare valriable',0,1) WITH NOWAIT
      
      DECLARE @Pay_Rnd_Amt_Div INT
      SET @Pay_Rnd_Amt_Div = CONVERT(MONEY, ( SELECT	[AppledValue] FROM [Prepared].[Parameters] WHERE [Table] = 'Pay_Rnd_Amt_Div'))
      
      
      /**********************************************************************
      04. CREATE TEMPORARY TABLE
      **********************************************************************/
      RAISERROR('..+Create temporary table [#Payments]',0,1) WITH NOWAIT
      
      IF OBJECT_ID('[tempdb].[dbo].[#Payments]') IS NOT NULL
      DROP TABLE [#Payments]
      
      SELECT
      [PAYMENT_KEY_PWC],
      [PAYMENT_LINE_PWC],
      [VENDOR_KEY_PWC],
      [AmountDocument],
      Sum([AmountDocument]) Over (Partition by [PAYMENT_KEY_PWC]) AS [TotalAmountDocument]
      INTO			[#Payments]
      FROM			[Prepared].[Payment]
      WHERE			[SCOPE_PWC]=1
      
      /*********************************************************************
      05. UPDATE TEST RESULT
      **********************************************************************/
      RAISERROR('..+Update results table [Result].[TestResult]>',0,1) WITH NOWAIT
      
      INSERT INTO		[Result].[TestTResult]
      (
      [KEY_PWC],
      [Type],
      [VENDOR_KEY_PWC],
      [COMPANY_KEY_PWC],
      [TestID],
      [DimensionText],
      [DimensionUnit]
      )
      
      SELECT			[PAYMENT_LINE_PWC],
      'Payment',
      [VENDOR_KEY_PWC],
      0,
      'TST014',
      CASE 
      WHEN TotalAmountDocument = 0							THEN 'Valid'						--Added on 08/08/2016 
      WHEN TotalAmountDocument % (1000*@Pay_Rnd_Amt_Div) = 0 THEN 'Total paid ($1M)' 
      WHEN TotalAmountDocument % (100*@Pay_Rnd_Amt_Div) = 0 THEN 'Total paid ($100K)' 
      WHEN TotalAmountDocument % (10*@Pay_Rnd_Amt_Div) = 0 THEN 'Total paid ($10K)' 
      WHEN TotalAmountDocument % (1*@Pay_Rnd_Amt_Div) = 0 THEN 'Total paid ($1K)' 
      WHEN AmountDocument % (1000*@Pay_Rnd_Amt_Div) = 0 THEN 'Payment line ($1M)' 
      WHEN AmountDocument % (100*@Pay_Rnd_Amt_Div) = 0 THEN 'Payment line ($100K)' 
      WHEN AmountDocument % (10*@Pay_Rnd_Amt_Div) = 0 THEN 'Payment line ($10K)' 
      WHEN AmountDocument % (1*@Pay_Rnd_Amt_Div) = 0 THEN 'Payment line ($1K)' 
      ELSE 'Valid'
      END,
      '$ bucket'
      FROM			[#Payments]
      WHERE			CASE 
      WHEN TotalAmountDocument = 0							THEN 'Valid'
      WHEN TotalAmountDocument % (1000*@Pay_Rnd_Amt_Div) = 0 THEN 'Total paid ($1M)' 
      WHEN TotalAmountDocument % (100*@Pay_Rnd_Amt_Div) = 0 THEN 'Total paid ($100K)' 
      WHEN TotalAmountDocument % (10*@Pay_Rnd_Amt_Div) = 0 THEN 'Total paid ($10K)' 
      WHEN TotalAmountDocument % (1*@Pay_Rnd_Amt_Div) = 0 THEN 'Total paid ($1K)' 
      WHEN AmountDocument % (1000*@Pay_Rnd_Amt_Div) = 0 THEN 'Payment line ($1M)' 
      WHEN AmountDocument % (100*@Pay_Rnd_Amt_Div) = 0 THEN 'Payment line ($100K)' 
      WHEN AmountDocument % (10*@Pay_Rnd_Amt_Div) = 0 THEN 'Payment line ($10K)' 
      WHEN AmountDocument % (1*@Pay_Rnd_Amt_Div) = 0 THEN 'Payment line ($1K)' 
      ELSE 'Valid'
      END  <> 'Valid'
      
      /**********************************************************************
      06. END
      **********************************************************************/
      RAISERROR('>COMPLETE <TST014> - Round dollar payments',0,1) WITH NOWAITUSE [z'c40ee561-6d97-44f0-b4ca-46a9db4b5b99]
      GO
      /****** Object:  StoredProcedure [Result].[TST015]    Script Date: 19/09/2018 9:04:56 AM ******/
      SET ANSI_NULLS ON
      GO
      SET QUOTED_IDENTIFIER ON
      GO
      ALTER PROC [Result].[TST015]
      AS
      
      /*********************************************************************
      *                           DATA ASSURANCE                           *
      **********************************************************************
      SCRIPT REFERENCE   - TST015
      SCRIPT DESCRIPTION - Invoice test: Round dollar invoices
      
      UPDATES            - Version 1.0 {21/03/2016} {Fei A Li} 
      - Version 1.1 {08/08/2016} {Fei A Li} 
      
      TABLE INFORMATION
      INPUT TABLE(S)
      - [Prepared].[Journal]	
      
      OUTPUT TABLE(S)
      - [Result].[TestTResult]
      
      SUMMARY OF SCRIPT -	01. START
      - 02. DELETE TEST REUSLT IF EXISTS
      - 03. DECLARE VARIABLES
      - 04. CREATE TEMPORARY TABLE
      - 05. UPDATE TEST RESULT
      - 06. END
      
      **********************************************************************
      01. START
      **********************************************************************/
      RAISERROR('>START <TST015> - Round dollar invoices',0,1) WITH NOWAIT
      
      /**********************************************************************
      02. DELETE TEST REUSLT IF EXISTS
      **********************************************************************/
      
      RAISERROR('..+Delete test result TST015',0,1) WITH NOWAIT
      
      DELETE FROM [Result].[TestTResult]
      WHERE [TestID]='TST015'
      
      /**********************************************************************
      03. DECLARE VARIABLES
      **********************************************************************/
      RAISERROR('..+Declare valriable',0,1) WITH NOWAIT
      
      DECLARE @Pay_Rnd_Amt_Div INT
      SET @Pay_Rnd_Amt_Div = CONVERT(MONEY, ( SELECT	[AppledValue] FROM [Prepared].[Parameters] WHERE [Table] = 'Pay_Rnd_Amt_Div'))
      
      /**********************************************************************
      04. CREATE TEMPORARY TABLE
      **********************************************************************/
      RAISERROR('..+Create temporary table [#Invoices]',0,1) WITH NOWAIT
      
      IF OBJECT_ID('[tempdb].[dbo].[#Inovices]') IS NOT NULL
      DROP TABLE [#Invoices]
      
      SELECT
      [JOURNAL_KEY_PWC],
      [JOURNAL_LINE_PWC],
      [VENDOR_KEY_PWC],
      [AmountDocument],
      Sum([AmountDocument]) Over (Partition by [JOURNAL_KEY_PWC]) AS [TotalAmountDocument]
      INTO			[#Invoices]
      FROM			[Prepared].[Journal]
      WHERE			[SCOPE_PWC]=1
      AND				[TransactionType_PWC]='INV'
      
      
      /*********************************************************************
      05. UPDATE TEST RESULT
      **********************************************************************/
      RAISERROR('..+Update results table [Result].[TestResult]',0,1) WITH NOWAIT
      
      INSERT INTO		[Result].[TestTResult]
      (
      [KEY_PWC],
      [Type],
      [VENDOR_KEY_PWC],
      [COMPANY_KEY_PWC],
      [TestID],
      [DimensionText],
      [DimensionUnit]
      )
      
      SELECT			[JOURNAL_LINE_PWC],
      'Invoice',
      [VENDOR_KEY_PWC],
      0,
      'TST015',
      CASE 
      WHEN TotalAmountDocument = 0							THEN 'Valid'					--Added on 08/08/2016
      WHEN TotalAmountDocument % (1000*@Pay_Rnd_Amt_Div) = 0 THEN 'Total invoice ($1M)' 
      WHEN TotalAmountDocument % (100*@Pay_Rnd_Amt_Div) = 0 THEN 'Total invoice ($100K)' 
      WHEN TotalAmountDocument % (10*@Pay_Rnd_Amt_Div) = 0 THEN 'Total invoice ($10K)' 
      WHEN TotalAmountDocument % (1*@Pay_Rnd_Amt_Div) = 0 THEN 'Total invoice ($1K)' 
      WHEN AmountDocument % (1000*@Pay_Rnd_Amt_Div) = 0 THEN 'Invoice line ($1M)' 
      WHEN AmountDocument % (100*@Pay_Rnd_Amt_Div) = 0 THEN 'Invoice line ($100K)' 
      WHEN AmountDocument % (10*@Pay_Rnd_Amt_Div) = 0 THEN 'Invoice line ($10K)' 
      WHEN AmountDocument % (1*@Pay_Rnd_Amt_Div) = 0 THEN 'Invoice line ($1K)' 
      ELSE 'Valid'
      END,
      '$ bucket'
      FROM			[#Invoices]
      WHERE			CASE 
      WHEN TotalAmountDocument = 0							THEN 'Valid'
      WHEN TotalAmountDocument % (1000*@Pay_Rnd_Amt_Div) = 0 THEN 'Total invoice ($1M)' 
      WHEN TotalAmountDocument % (100*@Pay_Rnd_Amt_Div) = 0 THEN 'Total invoice ($100K)' 
      WHEN TotalAmountDocument % (10*@Pay_Rnd_Amt_Div) = 0 THEN 'Total invoice ($10K)' 
      WHEN TotalAmountDocument % (1*@Pay_Rnd_Amt_Div) = 0 THEN 'Total invoice ($1K)' 
      WHEN AmountDocument % (1000*@Pay_Rnd_Amt_Div) = 0 THEN 'Invoice line ($1M)' 
      WHEN AmountDocument % (100*@Pay_Rnd_Amt_Div) = 0 THEN 'Invoice line ($100K)' 
      WHEN AmountDocument % (10*@Pay_Rnd_Amt_Div) = 0 THEN 'Invoice line ($10K)' 
      WHEN AmountDocument % (1*@Pay_Rnd_Amt_Div) = 0 THEN 'Invoice line ($1K)' 
      ELSE 'Valid'
      END  <> 'Valid'
      
      /**********************************************************************
      06. END
      **********************************************************************/
      RAISERROR('>COMPLETE <TST015> - Round dollar invoices',0,1) WITH NOWAITUSE [z'c40ee561-6d97-44f0-b4ca-46a9db4b5b99]
      GO
      /****** Object:  StoredProcedure [Result].[TST016]    Script Date: 19/09/2018 9:04:30 AM ******/
      SET ANSI_NULLS ON
      GO
      SET QUOTED_IDENTIFIER ON
      GO
      ALTER PROC [Result].[TST016]
      AS
      
      /*********************************************************************
      *                           DATA ASSURANCE                           *
      **********************************************************************
      SCRIPT REFERENCE   - TST016
      SCRIPT DESCRIPTION - Invoice test: Invoice outside business hours
      
      UPDATES            - Version 1.0 {16/03/2016} {Fei Li} 
      TABLE INFORMATION
      INPUT TABLE(S)
      - [Prepared].[Journal]
      
      OUTPUT TABLE(S)
      - [Result].[TestTResult]
      
      SUMMARY OF SCRIPT -	01. START
      - 02. DELETE TEST RESULT IF EXISTS
      - 03. UPDATE TEST RESULT
      - 04. END
      
      **********************************************************************
      01. START
      **********************************************************************/
      RAISERROR('>START <TST016> - Invoice outside business hours',0,1) WITH NOWAIT
      
      /**********************************************************************
      02. DELETE TEST REUSLT IF EXISTS
      **********************************************************************/
      
      RAISERROR('..+Delete test result TST016',0,1) WITH NOWAIT
      
      DELETE FROM [Result].[TestTResult]
      WHERE	[TestID]='TST016' 
      
      DECLARE		@StartTime AS INT
      DECLARE		@EndTime AS INT
      
      SET			@StartTime = (SELECT Value FROM Store.Setting WHERE [Key]='1: Business starting hour')
      SET			@EndTime = (SELECT Value FROM Store.Setting WHERE [Key]='2: Business finishing hour')
      
      /*********************************************************************
      03. UPDATE TEST RESULT
      **********************************************************************/
      RAISERROR('..+Update results table [Result].[TestTResult]',0,1) WITH NOWAIT
      
      INSERT INTO [Result].[TestTResult]
      (
      [KEY_PWC],
      [Type],
      [VENDOR_KEY_PWC],
      [COMPANY_KEY_PWC],
      [TestID],
      [DimensionText],
      [DimensionUnit]
      )
      
      SELECT		
      J.[JOURNAL_LINE_PWC],
      'Invoice',
      J.[VENDOR_KEY_PWC],
      0,	
      'TST016',
      CASE		
      WHEN	[BIA].[WeekdayName](J.[EntryDate]) IN ('Saturday', 'Sunday') 
      THEN	'Weekend'
      WHEN	DATEPART(hh, J.EntryTime) Between @StartTime and @EndTime
      THEN	'Standard'
      ELSE	'Out-of hour'
      END,
      'Occurance'		
      FROM		[Prepared].[Journal] AS J
      WHERE		[Scope_PWC] = 1
      AND			[TransactionType_PWC]='INV'
      AND			CASE		
      WHEN	[BIA].[WeekdayName](J.[EntryDate]) IN ('Saturday', 'Sunday') 
      THEN	'Weekend'
      WHEN	DATEPART(hh, J.[EntryTime]) Between @StartTime and @EndTime
      THEN	'Standard'
      ELSE	'Out-of hour'
      END <> 'Standard'
      
      
      /**********************************************************************
      04. END
      **********************************************************************/
      RAISERROR('>COMPLETE <TST016> - Invoice outside business hours ',0,1) WITH NOWAITUSE [z'c40ee561-6d97-44f0-b4ca-46a9db4b5b99]
      GO
      /****** Object:  StoredProcedure [Result].[TST017]    Script Date: 19/09/2018 9:05:26 AM ******/
      SET ANSI_NULLS ON
      GO
      SET QUOTED_IDENTIFIER ON
      GO
      ALTER PROC [Result].[TST017]
      AS
      
      /*********************************************************************
      *                           DATA ASSURANCE                           *
      **********************************************************************
      SCRIPT REFERENCE   - TST017
      SCRIPT DESCRIPTION - Vendor test: Invalid ABN
      
      UPDATES            - Version 1.0 {23/03/2016} {Fei A Li} 
      
      TABLE INFORMATION
      INPUT TABLE(S)
      - [Prepared].[VendorMaster]						
      OUTPUT TABLE(S)
      - [Result].[TestTResult]
      
      SUMMARY OF SCRIPT -	01. START
      - 02. DELETE TEST REUSLT IF EXISTS
      - 03.	UPDATE TEST RESULT
      - 04. END
      
      **********************************************************************
      01. START
      **********************************************************************/
      RAISERROR('>START <TST017> - Testing invalid ABN',0,1) WITH NOWAIT
      
      /**********************************************************************
      02. DELETE TEST REUSLT IF EXISTS
      **********************************************************************/
      
      RAISERROR('..+Delete test result TST017',0,1) WITH NOWAIT
      
      DELETE FROM [Result].[TestTResult]
      WHERE	[TestID]='TST017' 
      
      /*********************************************************************
      03. UPDATE TEST RESULT
      **********************************************************************/
      RAISERROR('..+Update results table [Result].[TestResult]',0,1) WITH NOWAIT
      
      INSERT INTO [Result].[TestTResult]
      (
      [KEY_PWC],
      [Type],
      [VENDOR_KEY_PWC],
      [COMPANY_KEY_PWC],
      [TestID],
      [DimensionText],
      [DimensionUnit],
      [ExceptionFlag]
      )
      
      SELECT		VM.[VENDOR_KEY_PWC],
      'Vendor',
      VM.[VENDOR_KEY_PWC],
      0,
      'TST017',
      CASE WHEN [BIA].[ExtractNumbers](IsNull(VM.ABN,'00000000000')) = '00000000000' THEN 'ABN not provided'
      WHEN A.[SearchABN] IS NULL THEN 'ABN not found'
      ELSE A.[EntityStatus] END,
      'ABN status',
      CASE WHEN [BIA].[ExtractNumbers](IsNull(VM.ABN,'00000000000')) = '00000000000' THEN 1
      WHEN A.[SearchABN] IS NULL THEN 1
      WHEN Upper(A.[EntityStatus]) = 'ACTIVE' THEN 0 
      ELSE 1 END 
      FROM		[Prepared].[VendorMaster] AS VM
      LEFT JOIN	[^BIA Master Data].[store].[ABN_listing] AS  A
      ON			[BIA].[ExtractNumbers](VM.[ABN]) = A.[SearchABN]
      
      
      /**********************************************************************
      04. END
      **********************************************************************/
      RAISERROR('>COMPLETE <TST017> - Testing invalid ABN',0,1) WITH NOWAITUSE [z'c40ee561-6d97-44f0-b4ca-46a9db4b5b99]
      GO
      /****** Object:  StoredProcedure [Result].[TST018]    Script Date: 19/09/2018 9:05:49 AM ******/
      SET ANSI_NULLS ON
      GO
      SET QUOTED_IDENTIFIER ON
      GO
      ALTER PROC [Result].[TST018]
      AS
      
      /*********************************************************************
      *                           DATA ASSURANCE                           *
      **********************************************************************
      SCRIPT REFERENCE   - TST018
      SCRIPT DESCRIPTION - Payment test: Unrecorded liabilities, payments post yearend
      
      UPDATES            - Version 1.0 {22/03/2016} {Melissa Cole} 
      
      TABLE INFORMATION
      INPUT TABLE(S)
      - [Interface].[VendorBankDetails]
      - [Interface].[VendorMaster]
      
      OUTPUT TABLE(S)
      - [Result].[TestTResult]
      
      SUMMARY OF SCRIPT -	01. START
      - 02. DELETE TEST RESULT IF EXISTS
      - 03. UPDATE TEST RESULT
      - 04. END
      
      **********************************************************************
      01. START
      **********************************************************************/
      RAISERROR('>START <TST018> - Unrecorded liabilities, payments after year end',0,1) WITH NOWAIT
      
      /**********************************************************************
      02. DELETE TEST RESULT IF EXISTS
      **********************************************************************/
      RAISERROR('..+Delete test result TST018',0,1) WITH NOWAIT
      
      DELETE FROM [Result].[TestTResult]
      WHERE	[TestID]='TST018' 
      
      /*********************************************************************
      03. UPDATE TEST RESULT
      **********************************************************************/
      RAISERROR('..+Update results table [Result].[TestTResult]>',0,1) WITH NOWAIT
      
      INSERT INTO [Result].[TestTResult]
      (
      [KEY_PWC],
      [Type],
      [VENDOR_KEY_PWC],
      [COMPANY_KEY_PWC],
      [TestID],
      [DimensionText],
      [DimensionUnit]
      )
      
      SELECT		
      P.PAYMENT_LINE_PWC,
      'Payment',
      0,
      0,	
      'TST018',
      Convert(NVARCHAR(30), DateDiff(Day, P.[Rundate],  E.[EntityPeriodeEnd])),
      'Days'
      FROM		[Prepared].[Payment] AS P
      JOIN		[Prepared].[Entity] AS E
      ON			P.[COMPANY_KEY_PWC] = E.[COMPANY_KEY_PWC]
      WHERE		[Scope_PWC] = 0
      AND 		(
      [InvoicePaymentMatch_PWC] = 0
      OR			P.[EntryDate] > E.[EntityPeriodeEnd]
      )
      
      /**********************************************************************
      04. END
      **********************************************************************/
      RAISERROR('>COMPLETE <TST018> - Unrecorded liabilities, payments after year end',0,1) WITH NOWAITUSE [z'c40ee561-6d97-44f0-b4ca-46a9db4b5b99]
      GO
      /****** Object:  StoredProcedure [Result].[TST019]    Script Date: 19/09/2018 9:06:06 AM ******/
      SET ANSI_NULLS ON
      GO
      SET QUOTED_IDENTIFIER ON
      GO
      ALTER PROC [Result].[TST019]
      AS
      
      /*********************************************************************
      *                           DATA ASSURANCE                           *
      **********************************************************************
      SCRIPT REFERENCE   - TST019
      SCRIPT DESCRIPTION - Invoice test: Unrecorded liabilities, invoices post yearend
      
      UPDATES            - Version 1.0 {22/03/2016} {Fei Li} 
      
      TABLE INFORMATION
      INPUT TABLE(S)
      - [Prepared].[Journal]
      
      OUTPUT TABLE(S)
      - [Result].[TestTResult]
      
      SUMMARY OF SCRIPT -	01. START
      - 02. DELETE TEST RESULT IF EXISTS
      - 03. UPDATE TEST RESULT
      - 04. END
      
      **********************************************************************
      01. START
      **********************************************************************/
      RAISERROR('>START <TST019> - Unrecorded liabilities, invoices after year end',0,1) WITH NOWAIT
      
      
      /**********************************************************************
      02. DELETE TEST RESULT IF EXISTS
      **********************************************************************/
      RAISERROR('..+Delete test result TST019',0,1) WITH NOWAIT
      
      DELETE FROM [Result].[TestTResult]
      WHERE	[TestID]='TST019' 
      
      
      /*********************************************************************
      03. UPDATE TEST RESULT
      **********************************************************************/
      RAISERROR('..+Update results table [Result].[TestTResult]',0,1) WITH NOWAIT
      
      INSERT INTO [Result].[TestTResult]
      (
      [KEY_PWC],
      [Type],
      [VENDOR_KEY_PWC],
      [COMPANY_KEY_PWC],
      [TestID],
      [DimensionText],
      [DimensionUnit]
      )
      
      SELECT		
      J.[JOURNAL_LINE_PWC],
      'Invoice',
      0,
      0,	
      'TST019',
      Convert(NVARCHAR(30), DateDiff(Day, J.[Documentdate],  E.[EntityPeriodeEnd])),
      'Days'
      FROM		[Prepared].[Journal] AS J
      JOIN		[Prepared].[Entity] AS E
      ON			J.[COMPANY_KEY_PWC] = E.[COMPANY_KEY_PWC]
      WHERE		J.[Scope_PWC] = 0 
      AND			J.[TransactionType_PWC] ='INV'
      
      /**********************************************************************
      04. END
      **********************************************************************/
      RAISERROR('>COMPLETE <TST019> - Unrecorded liabilities, invoices after year end',0,1) WITH NOWAITUSE [z'c40ee561-6d97-44f0-b4ca-46a9db4b5b99]
      GO
      /****** Object:  StoredProcedure [Result].[TST020]    Script Date: 19/09/2018 9:06:28 AM ******/
      SET ANSI_NULLS ON
      GO
      SET QUOTED_IDENTIFIER ON
      GO
      ALTER PROC [Result].[TST020]
      AS
      
      /*********************************************************************
      *                           DATA ASSURANCE                           *
      **********************************************************************
      SCRIPT REFERENCE   - TST020
      SCRIPT DESCRIPTION - Invoice test: Purchase date greater than invoice date  
      
      UPDATES            - Version 1.0 {23/03/2016} {Russell Taylor} 
      - Version 1.1 {15/08/2016} {Fei Li} {Update CASE WHEN DateDiff(Day,J.[PurchaseDate],J.[DocumentDate]) > 0 --> CASE WHEN DateDiff(Day, J.[DocumentDate],J.[PurchaseDate]) >= 0}
      
      TABLE INFORMATION
      INPUT TABLE(S)
      - [Prepared].[Journal]						
      OUTPUT TABLE(S)
      - [Result].[TestTResult]
      
      SUMMARY OF SCRIPT -	01. START
      - 02. DELETE TEST REUSLT IF EXISTS
      - 03.	UPDATE TEST RESULT
      - 04. END
      
      **********************************************************************
      01. START
      **********************************************************************/
      RAISERROR('>START <TST020> - Purchase date greater than invocie date',0,1) WITH NOWAIT
      
      /**********************************************************************
      02. DELETE TEST REUSLT IF EXISTS
      **********************************************************************/
      
      RAISERROR('..+Delete test result TST020',0,1) WITH NOWAIT
      
      DELETE FROM [Result].[TestTResult]
      WHERE	[TestID]='TST020' 
      
      /*********************************************************************
      03. UPDATE TEST RESULT
      **********************************************************************/
      RAISERROR('..+Update results table [Result].[TestResult]',0,1) WITH NOWAIT
      
      INSERT INTO [Result].[TestTResult]
      (
      [KEY_PWC],
      [Type],
      [VENDOR_KEY_PWC],
      [COMPANY_KEY_PWC],
      [TestID],
      [DimensionText],
      [DimensionUnit],
      [ExceptionFlag]
      )
      
      SELECT		J.[JOURNAL_LINE_PWC],
      'Invoice',
      J.[VENDOR_KEY_PWC],
      0,
      'TST020',
      Convert(NVARCHAR(30), DateDiff(Day, J.[DocumentDate],J.[PurchaseDate])),
      'Days',
      CASE WHEN DateDiff(Day, J.[DocumentDate],J.[PurchaseDate]) >= 0 THEN 1 ELSE 0 END
      FROM		[Prepared].[Journal]  AS J
      WHERE		[Scope_PWC] = 1
      AND			[InvoicePurchasetMatch_PWC] = 1
      
      /**********************************************************************
      04. END
      **********************************************************************/
      RAISERROR('>COMPLETE <TST020> - Purchase date greater than invocie date',0,1) WITH NOWAITUSE [z'c40ee561-6d97-44f0-b4ca-46a9db4b5b99]
      GO
      /****** Object:  StoredProcedure [Result].[TST021]    Script Date: 19/09/2018 9:06:47 AM ******/
      SET ANSI_NULLS ON
      GO
      SET QUOTED_IDENTIFIER ON
      GO
      ALTER PROC [Result].[TST021]
      AS
      
      /*********************************************************************
      *                           DATA ASSURANCE                           *
      **********************************************************************
      SCRIPT REFERENCE   - TST021
      SCRIPT DESCRIPTION - Invocie test: Invocie date greater than posting date
      
      UPDATES            - Version 1.0 {23/03/2016} {Russell Taylor} 
      
      TABLE INFORMATION
      INPUT TABLE(S)
      - [Prepared].[Journal]						
      OUTPUT TABLE(S)
      - [Result].[TestTResult]
      
      SUMMARY OF SCRIPT -	01. START
      - 02. DELETE TEST REUSLT IF EXISTS
      - 03.	UPDATE TEST RESULT
      - 04. END
      
      **********************************************************************
      01. START
      **********************************************************************/
      RAISERROR('>START <TST021> - Invocie date greater than posting date',0,1) WITH NOWAIT
      
      /**********************************************************************
      02. DELETE TEST REUSLT IF EXISTS
      **********************************************************************/
      
      RAISERROR('..+Delete test result TST021',0,1) WITH NOWAIT
      
      DELETE FROM [Result].[TestTResult]
      WHERE	[TestID]='TST021' 
      
      /*********************************************************************
      03. UPDATE TEST RESULT
      **********************************************************************/
      RAISERROR('..+Update results table [Result].[TestResult]',0,1) WITH NOWAIT
      
      INSERT INTO [Result].[TestTResult]
      (
      [KEY_PWC],
      [Type],
      [VENDOR_KEY_PWC],
      [COMPANY_KEY_PWC],
      [TestID],
      [DimensionText],
      [DimensionUnit],
      [ExceptionFlag]
      )
      
      SELECT		J.[JOURNAL_LINE_PWC],
      'Invoice',
      J.[VENDOR_KEY_PWC],
      0,
      'TST021',
      Convert(NVARCHAR(30), DateDiff(Day, J.[PostingDate],J.[DocumentDate])),
      'Days',
      CASE WHEN DateDiff(Day, J.[PostingDate],J.[DocumentDate]) > 0 THEN 1 ELSE 0 END 
      FROM		[Prepared].[Journal]  AS J
      WHERE		[Scope_PWC] = 1
      AND			[TransactionType_PWC] = 'INV'
      
      /**********************************************************************
      04. END
      **********************************************************************/
      RAISERROR('>COMPLETE <TST021> - Invocie date greater than posting date',0,1) WITH NOWAITUSE [z'c40ee561-6d97-44f0-b4ca-46a9db4b5b99]
      GO
      /****** Object:  StoredProcedure [Result].[TST022]    Script Date: 19/09/2018 9:07:09 AM ******/
      SET ANSI_NULLS ON
      GO
      SET QUOTED_IDENTIFIER ON
      GO
      ALTER PROC [Result].[TST022]
      AS
      
      /*********************************************************************
      *                           DATA ASSURANCE                           *
      **********************************************************************
      SCRIPT REFERENCE   - TST022
      SCRIPT DESCRIPTION - Payment test: Payment due date different from payment date
      
      UPDATES            - Version 1.0 {23/03/2016} {Russell Taylor} 
      
      TABLE INFORMATION
      INPUT TABLE(S)
      - [Prepared].[Payment]						
      - [Prepared].[VendorEntity]						
      OUTPUT TABLE(S)
      - [Result].[TestTResult]
      
      SUMMARY OF SCRIPT -	01. START
      - 02. DELETE TEST REUSLT IF EXISTS
      - 03.	UPDATE TEST RESULT
      - 04. END
      
      **********************************************************************
      01. START
      **********************************************************************/
      RAISERROR('>START <TST022> - Payment date different from payment due',0,1) WITH NOWAIT
      
      /**********************************************************************
      02. DELETE TEST REUSLT IF EXISTS
      **********************************************************************/
      
      RAISERROR('..+Delete test result TST022',0,1) WITH NOWAIT
      
      DELETE FROM [Result].[TestTResult]
      WHERE	[TestID]='TST022' 
      
      /*********************************************************************
      03. UPDATE TEST RESULT
      **********************************************************************/
      RAISERROR('..+Update results table [Result].[TestResult]',0,1) WITH NOWAIT
      INSERT INTO [Result].[TestTResult]
      (
      [KEY_PWC],
      [Type],
      [VENDOR_KEY_PWC],
      [COMPANY_KEY_PWC],
      [TestID],
      [DimensionText],
      [DimensionUnit],
      [ExceptionFlag]
      )
      
      SELECT		DISTINCT
      P.[PAYMENT_LINE_PWC],
      'Payment',
      P.[VENDOR_KEY_PWC],
      0,
      'TST022',
      Convert(NVARCHAR(30), DateDiff(Day, Dateadd(Day, VE.[TermsCodeDays], J.[DocumentDate]),P.[RunDate])),			
      'Days',
      CASE WHEN DateDiff(Day, Dateadd(Day, VE.[TermsCodeDays], J.[DocumentDate]),P.[RunDate]) <> 0 THEN 1 ELSE 0 END	
      FROM		[Prepared].[Payment]  AS P
      JOIN		[Prepared].[VendorEntity] AS VE
      ON			P.[VENDOR_KEY_PWC] = VE.[VENDOR_KEY_PWC]
      AND			P.[COMPANY_KEY_PWC] = VE.[COMPANY_KEY_PWC]
      JOIN		[Prepared].[Journal] AS J
      ON			P.[INVOICE_KEY_PWC] = J.[INVOICE_KEY_PWC]
      WHERE		P.[Scope_PWC] = 1
      AND			P.[InvoicePaymentMatch_PWC] = 1
      
      /**********************************************************************
      04. END
      **********************************************************************/
      RAISERROR('>COMPLETE <TST022> - Payment date different from payment due',0,1) WITH NOWAITUSE [z'c40ee561-6d97-44f0-b4ca-46a9db4b5b99]
      GO
      /****** Object:  StoredProcedure [Result].[TST023]    Script Date: 19/09/2018 9:07:25 AM ******/
      SET ANSI_NULLS ON
      GO
      SET QUOTED_IDENTIFIER ON
      GO
      ALTER PROC [Result].[TST023]
      AS
      
      /*********************************************************************
      *                           DATA ASSURANCE                           *
      **********************************************************************
      SCRIPT REFERENCE   - TST023
      SCRIPT DESCRIPTION - Non-order invoices 
      
      UPDATES            - Version 1.0 {23/03/2016} {Russell Taylor} 
      - Version 1.1 {15/08/2016} {Added filter Convert(NVARCHAR(2), [PurchaseFlag_PWC]) =0 to filter non-ordered invoice}
      
      TABLE INFORMATION
      INPUT TABLE(S)
      - [Prepared].[Journal]						
      OUTPUT TABLE(S)
      - [Result].[TestTResult]
      
      SUMMARY OF SCRIPT -	01. START
      - 02. DELETE TEST REUSLT IF EXISTS
      - 03.	UPDATE TEST RESULT
      - 04. END
      
      **********************************************************************
      01. START
      **********************************************************************/
      RAISERROR('>START <TST023> - Non-order invoices',0,1) WITH NOWAIT
      
      /**********************************************************************
      02. DELETE TEST REUSLT IF EXISTS
      **********************************************************************/
      RAISERROR('..+Delete test result TST023',0,1) WITH NOWAIT
      
      DELETE FROM [Result].[TestTResult]
      WHERE	[TestID]='TST023' 
      
      /*********************************************************************
      03. UPDATE TEST RESULT
      **********************************************************************/
      RAISERROR('..+Update results table [Result].[TestResult]',0,1) WITH NOWAIT
      
      INSERT INTO [Result].[TestTResult]
      (
      [KEY_PWC],
      [Type],
      [VENDOR_KEY_PWC],
      [COMPANY_KEY_PWC],
      [TestID],
      [DimensionText],
      [DimensionUnit],
      [ExceptionFlag]
      )
      
      SELECT		DISTINCT
      [JOURNAL_LINE_PWC],
      'Invoice',
      [VENDOR_KEY_PWC],
      0,
      'TST023',
      Convert(NVARCHAR(2), [PurchaseFlag_PWC]),
      'Non-order flag',
      Convert(NVARCHAR(2), [PurchaseFlag_PWC])					
      FROM		[Prepared].[Journal] AS J
      WHERE		J.[Scope_PWC] = 1
      AND			J.[TransactionSubType_PWC] = 'IN'
      AND 		Convert(NVARCHAR(2), [PurchaseFlag_PWC]) =0        -- Added on 15/08/16 by Fei to filter non-ordered invoice
      
      /**********************************************************************
      04. END
      **********************************************************************/
      RAISERROR('>COMPLETE <TST023> - Non-order invoices',0,1) WITH NOWAIT
      
      