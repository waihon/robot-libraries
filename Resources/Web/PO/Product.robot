*** Settings ***
Library  SeleniumLibrary


*** Variables ***
${PRODUCT_ADD_TO_CART_BUTTON} =       css:#add-to-cart-button
${PRODUCT_BACK_TO_RESULTS_LABEL} =    Back to results


*** Keywords ***
Verify Page Loaded
    Wait Until Page Contains    ${PRODUCT_BACK_TO_RESULTS_LABEL}

Add to Cart
    Click Button  ${PRODUCT_ADD_TO_CART_BUTTON}
