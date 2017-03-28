*** Settings ***
Resource                /return_exercise_variables.robot

*** Keywords ***
############################
#         GIVEN            #
############################
User Is In Categories Page
    Wait Until Keyword Succeeds    10 sec    2 sec
    ...    Location Should Contain    https://www.carmudi.com.ph/all/
    Set Window Size        1920    1080


############################
#          WHEN            #
############################
User Filters Car By Price
    [Arguments]    ${p_minimum_price}    ${p_maximum_price}
    Click Element    ${PRICE_BTN}
    Click Element    ${MINIMUM_PRICE_TB}
    Input Text    ${MINIMUM_PRICE_TB}    ${p_minimum_price}
    Click Element    ${MAXIMUM_PRICE_TB}
    Input Text    ${MAXIMUM_PRICE_TB}    ${p_maximum_price}
    Set Selenium Speed    3 seconds
    Click Element    ${APPLY_FILTER_BTN}

User Sorts From Lowest Price To Highest Price
    Click Element    ${CLOSE_CHAT_BTN}
    Click Element    ${SORT_BY_BTN}
    ${p_lowest_price_btn}=   Execute Javascript    return window.${PRICE_LOWEST_FIRST_BTN}
    [Return]    ${p_lowest_price_btn}
    Click Element    ${p_lowest_price_btn}

############################
#          THEN            #
############################
List Of Cars Should Be Displayed
    [Arguments]    ${p_minimum_item_price}    ${p_maximum_item_price}
    ${p_minimum_item_price}=   Execute Javascript    return window.${MINIMUM_PRICE_HEADER}
    [Return]    ${p_minimum_item_price}
    Element Should Be Visible    ${MINIMUM_PRICE_HEADER}    ${p_minimum_item_price}
    ${p_pagination_last_page}=   Execute Javascript    return window.${PAGINATION_LAST_PAGE_BTN}
    [Return]    ${p_pagination_last_page}
    Click Element    ${p+p_pagination_last_page}
    ${p_maximum_item_price}=   Execute Javascript    return window.${MAXIMUM_PRICE_HEADER}
    [Return]    ${p_maximum_item_price}
    Element Should Be Visible    ${MINIMUM_PRICE_HEADER}    ${p_maximum_item_price}



######################################
#           TEST TEMPLATES           #
######################################
