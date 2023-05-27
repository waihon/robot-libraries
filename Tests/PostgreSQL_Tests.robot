*** Settings ***
Documentation  These are some SQL Server Database tests
Resource  ../Resources/DB/PostgreSQL.robot
Test Setup  PostgreSQL.Connect
Test Teardown  PostgreSQL.Disconnect

# Many ways to run:
# robot -d results/postgresql tests/PostgreSQL_Tests.robot
# robot -d results/posgresql -i PosgreSQLDB tests
# robot -d results tests

*** Variables ***


*** Test Cases ***
Insert a Record
    [Tags]  PostgreSQLDB
    PostgreSQL.Save Current Row Count
    PostgreSQL.Get Input Data
    PostgreSQL.Insert Record
    PostgreSQL.Verify New Record Added

Verify Insert Contains Correct Input Data
    [Tags]  PostgreSQLDB
    PostgreSQL.Verify Last Record

Log All Rows
    PostgreSQL.Log All Rows
