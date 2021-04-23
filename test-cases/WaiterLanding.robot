*** Setting ***
Suite Setup       Setup
Suite Teardown    Teardown
Test Setup
Test Teardown
Force Tags
Test Timeout
Library           Selenium2Library
Library           String
Library           OperatingSystem

*** Variable ***
${PASSWORD}       ilikepie
${BROWSER}        headlesschrome
${URL_AUTH}       https://dev:ilikepie@dev2.waiter.com
${DAY_RANDOM}     SUN
${NUMBER_RANDOM}    1
${SITE_DEFAULT}    Waiter Breakfast/Lunch/Late Lunch - Sunnyvale
${MEAL_DEFAULT}    Waiter Lunch
${RESTAURANT_DEFAULT}    Snack Shak
${RESTAURANT_DEFAULT_ID}    name_1734
${ADDRESS_DEFAULT}    442 oakmead Pkwy, Sunnyvale,CA 94085
${URL}            https://dev:ilikepie@dev2.waiter.com
${MENU_ITEM}      Bottled Water
${MENU_ITEM_TYPE}    BEVERAGES
${FIRST_NAME}     Test-No-Vcs-2
${LAST_NAME}      Tester
${PHONE}          123-456-7890x246
${USERNAME}       test-no-vcs-1
${USERNAME_NON_VCS}    test-no-vcs-2
${USERNAME_VCS}    test-vcs-2
${USERNAME_NOADDRESS}    test-no-vcs-3
${ZIP2}           94107
${ADDRESS_DEFAULT2}    1 Market Street, San Francisco, CA,94105
${CITY}           Stanford
${STATE}          CA
${CITY2}          Arlington
${ADDRESS}        442 oakMead Pkwy, Sunnyvale, CA, 94085
${RESTAURANT}     Snackshak
${RESTAURANT2}    amicis
${RESTAURANT3}    Restaurants
${EMAIL_NON_VCS}    testaltom1@altom.ro
${EMAIL}          testaltom2@altom.ro
@{SESSION_FAILURE}    We're sorry    system failure    webmaster    alerted    issue
${MEAL_DAY}       SUN
${TIMEOUT}        10s
${Menu_Item_1}    Soda
${promo}          wb2

*** Test Case ***
Landing
    [Documentation]    Guest (not-logged-in) user is taken to landing page when accessing root URL (/)
    ...
    ...    1. Go to main url
    ...    2. Logs out the current user if logged in
    ...    3. Verify elements on the home page when no user is logged in
    [Tags]    smoke
    Go To    ${URL}
    Comment    Maximize Browser Window
    Sleep    5s
    Page Should Contain Element    xpath=//a[contains(.,'Sign In')]
    Sleep    4
    Click Element    jquery=a:contains('Sign In'):visible
    Sleep    5

Get Started
    Go To    ${URL}/get-started
    Sleep    5
    Page Should Contain    A Full Menu of Services
    Page Should Contain Element    jquery=a.btn.white:contains('Learn More')

Custom Cafe
    Go To    ${URL}/custom-cafe
    Sleep    5
    Page Should contain    Tell us about your meal delivery needs
    Page Should Contain    Benefits
    Input Text    jquery=input#name.form-control    test
    Input Text    jquery=input#company.form-control    abc
    Input Text    jquery=input#email.form-control    test@gmail.com
    Input Text    jquery=input#phone.form-control    1234567890
    Input Text    jquery=input#headcount.form-control    100
    Input Text    jquery=input#city.form-control    Sunnyvale
    Input Text    jquery=input#state.form-control    CA
    Click Element    jquery=a.btn.btn-primary.submit
    Sleep    4
    Page Should Contain    Thank you!
    Sleep    2

Recurring Catering
    Go To    ${URL}/recurring-catering
    Sleep    5
    Page Should Contain    Planned meals for every budget, cuisine, and occasion—no muss and no fuss.
    Page Should contain    Tell us about your meal delivery needs
    Page Should Contain    Benefits
    Input Text    jquery=input#name.form-control    test
    Input Text    jquery=input#company.form-control    abc
    Input Text    jquery=input#email.form-control    test@gmail.com
    Input Text    jquery=input#phone.form-control    1234567890
    Input Text    jquery=input#headcount.form-control    100
    Input Text    jquery=input#city.form-control    Sunnyvale
    Input Text    jquery=input#state.form-control    CA
    Focus    jquery=a.btn.btn-primary.submit
    Sleep    4
    Click Element    jquery=a.btn.btn-primary.submit
    Sleep    4
    Page Should Contain    Thank you!
    Sleep    2

Meals On Demand
    Go To    ${URL}/meals-on-demand
    Sleep    5
    Page should Contain    Life (and meals) happen, sometimes without planning. We’re here to help.
    page Should Contain Element    jquery=input.form-control.address
    Page should Contain    Benefits
    Input Text    jquery=input.form-control.address    442 oak mead Pkwy,94085
    Sleep    2
    Click Element    jquery=button.btn.btn-primary.submit
    Sleep    10
    Page Should Contain    Where are you?

Our story
    Go To    ${URL}/our-story
    Sleep    5
    Page should Contain    Happiness Through Food
    Page should Contain    What our customers are saying

FAQ
    Go To    ${URL}/faq
    Sleep    5
    Page Should Contain    Answers to top questions
    Page Should Contain Element    jquery=i.glyphicon.glyphicon-minus

Service Areas
    Go To    ${URL}/service-areas
    Sleep    5
    Page Should Contain    Food Delivery in the San Francisco Bay Area, Los Angeles, Seattle, Dallas, Raleigh & Austin
    Page Should Contain    Please let us know what city to add next!

jobs
    Go To    ${URL}/jobs
    Sleep    8
    Page Should Contain Element    jquery=h1:contains('Jobs @ Waiter.com')

Privacy Policy
    Go To    ${URL}
    Sleep    10
    Focus    jquery=a:contains('Privacy Policy')
    Sleep    4
    Click Link    jquery=a:contains('Privacy Policy')
    Sleep    5
    Page should Contain Element    jquery=h1:contains('Privacy Policy')
    Wait Until Page contains    Your consent

City Landing
    Go To    ${URL}
    Sleep    10
    Focus    jquery=a:contains('All Cities')
    Sleep    5
    Click Link    jquery=a:contains('All Cities')
    Sleep    10
    Page Should Contain    Order Food Delivery In a City Near You

Cuisine Landing
    Go To    ${URL}
    Sleep    5
    Focus    jquery=a:contains('All Cuisines')
    Sleep    5
    Click Link    jquery=a:contains('All Cuisines')
    Sleep    10
    Page Should Contain    Order Food Delivery in San Francisco and The Bay Area

Blog
    Go To    https://www.waiter.com
    Sleep    5
    Focus    jquery=a:contains('Our Blog')
    Sleep    5
    Click Link    jquery=a:contains('Our Blog')
    Wait Until page Contains    Find Restaurants

*** Keyword ***
Setup
    Set Selenium Timeout    ${TIMEOUT}
    Open Browser    ${URL}/logout    ${BROWSER}

Teardown
    Close Browser
