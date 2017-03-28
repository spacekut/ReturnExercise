*** Settings ***
Documentation            This suite is for functionality testing of filtering by price.
Default Tags             ReturnExercise
Library                  Selenium2Library
Resource                 /return_exercise_keywords.robot
Resource                 /return_exercise_variables.robot
Suite Setup              Open Browser    https://www.carmudi.com.ph/all/    chrome
Suite Teardown           Close All Browsers

*** Variables ***
${MINIMUM_PRICE}        50000
${MAXIMUM_PRICE}        60000

*** Test Cases ***
User Has Successfully Filtered Car By Price
    Given User Is In Categories Page
    When User Filters Car By Price    ${MINIMUM_PRICE}    ${MAXIMUM_PRICE}
    And User Sorts From Lowest Price To Highest Price
    Then List Of Cars Should Be Displayed    ${MINIMUM_PRICE}    ${MAXIMUM_PRICE}
