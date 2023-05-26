*** Settings ***
Library  SeleniumLibrary


*** Variables ***
${SEARCH_RESULTS_FIRST_PRODUCT} =    xpath://*[@id="search"]/div[1]/div[1]/div/span[1]/div[1]/div[2]//h2/a/span


*** Keywords ***
Verify Search Completed
    Wait Until Page Contains  results for "${SEARCH_TERM}"

Click Product Link
    [Documentation]  Clicks on the first product in the search results list
    Click Element    ${SEARCH_RESULTS_FIRST_PRODUCT}
