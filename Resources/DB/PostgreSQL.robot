*** Settings ***
Library  DatabaseLibrary
Library  String
Library  Dialogs


*** Variables ***
${DB_NAME} =  rftutorial
${DB_USER_NAME} =  postgres 
${DB_USER_PASSWORD} =  Pas$w0rd 
${DB_HOST} =  localhost
${DB_PORT} =  5432 
${PREVIOUS_ROW_COUNT}


*** Keywords ***
Connect
    Connect To Database  psycopg2  ${DB_NAME}  ${DB_USER_NAME}  ${DB_USER_PASSWORD}  ${DB_HOST}  ${DB_PORT}

Save Current Row Count
    ${current_row_count} =  Row Count  SELECT * FROM demo_items;
    Set Suite Variable  ${PREVIOUS_ROW_COUNT}  ${current_row_count}
    Log  ${current_row_count}

Get Input Data
    ${name} =  Get Value From User  Enter a First Name
    # Save it at the suite scope so subsequent test can use it
    Set Suite Variable  ${FIRST_NAME}  ${name}

Insert Record
    # Execute SQL Script  Inputs/SQL/insert.txt
    # Notice the first name variable is put inside single quotes
    Execute SQL String  INSERT INTO demo_items (item_name, first_name) VALUES ('New Item: ' || CAST(CURRENT_DATE AS VARCHAR(50)), '${FIRST_NAME}');

Verify New Record Added
    ${new_row_count} =  Row Count  SELECT * FROM demo_items;
    Log  ${new_row_count}
    # Notice that +1 is used inside the braces, not after the final brace
    Should be Equal as Numbers  ${new_row_count}  ${PREVIOUS_ROW_COUNT + 1 }

Verify Last Record
    # Notice here  TOP 1 is used instead of LIMIT 1 in PostgreSQL
    ${queryResults} =  Query  SELECT * FROM demo_items ORDER BY item_id DESC LIMIT 1
    # Examine the (0-based) 3rd field of the first record in the results
    Should be Equal as Strings  ${queryResults[0][2]}  ${FIRST_NAME}
    Log  ${queryResults[0][2]}

Log All Rows
    ${queryResults} =  Query  SELECT * FROM demo_items ORDER BY item_id
    Log Many  ${queryResults}

Disconnect
    Disconnect from Database
