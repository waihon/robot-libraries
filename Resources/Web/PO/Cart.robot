*** Settings ***
Library  SeleniumLibrary


*** Variables ***
${CART_CHECKOUT_BUTTON} =    css:#sc-buy-box-ptc-button > span > input


*** Keywords ***
Verify Product Added
    Wait Until Page Contains  subtotal

Proceed to Checkout
    Click Element    ${CART_CHECKOUT_BUTTON}
