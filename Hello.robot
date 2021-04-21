*** Settings ***
Documentation     Hello Robot Suites
Variables         Hello.robot    ${HELLO}    # Hello world

*** Test Cases ***
Landing page
    [Documentation]    Hello world setup
    Log    Hello World Robot
