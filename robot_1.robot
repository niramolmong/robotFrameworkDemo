*** Settings ***
Library    Selenium2Library
Test Teardown   Close All Browsers
 
*** Variables ***
${browser}            Chrome
${url}                https://the-internet.herokuapp.com/login
${login_success_url}  https://the-internet.herokuapp.com/secure
${username_success}   tomsmith
${username_notfound}  tomholland
${password_incorrect}  Password!
${password_success}   SuperSecretPassword!

${xpath_input_username}   //*[@id="username"]
${xpath_input_password}   //*[@id="password"]
${xpath_submit_botton}    //*[@type="submit"]
${xpath_logout_button}    //*[@class="button secondary radius"]

${login_success_text}    You logged into a secure area!
${logout_success_text}   You logged out of the secure area!
${login_password_incorrect}    Your password is invalid!
${login_username_invalid}  Your username is invalid!


*** Keywords ***
Open login page
  Open Browser  ${url}  ${browser}

Input username and password case success
  # [Arguments]  ${username_success}  ${password_success} 
  Input Text  ${xpath_input_username}  ${username_success}
  Input Text  ${xpath_input_password}  ${password_success}
  Click Button  ${xpath_submit_botton}

Input username and password case password incorrect
  # [Arguments]  ${username_success}  ${password_success} 
  Input Text  ${xpath_input_username}  ${username_success}
  Input Text  ${xpath_input_password}  ${password_incorrect}
  Click Button  ${xpath_submit_botton}

Input username and password case username not found
  # [Arguments]  ${username_success}  ${password_success} 
  Input Text  ${xpath_input_username}  ${username_notfound}
  Input Text  ${xpath_input_password}  ${password_incorrect}
  Click Button  ${xpath_submit_botton}


*** Test Cases ***
Login success
  Open login page
  Log to console  \nExpected result: 1. Login page is shown.
  Input username and password case success 
  Location Should Be  ${login_success_url}
  Page Should Contain   ${login_success_text} 
  Log to console  \nExpected result: 2. Login success and the message 'You logged into a secure area!' is shown.
  Click Element  ${xpath_logout_button}
  Page Should Contain   ${logout_success_text} 
  Log to console  \nExpected result: 3. Go back to the Login page and the message 'You logged out of the secure area!' is shown.

Login failed - Password incorrect
  Open login page
  Log to console  \nExpected result: 1. Login page is shown.
  Input username and password case password incorrect
  Page Should Contain  ${login_password_incorrect}
  Log to console  \nExpected result: 2. Login failed and the message 'Your password is invalid!' is shown.

Login failed - Username not found
  Open login page
  Log to console  \nExpected result: 1. Login page is shown.
  Input username and password case username not found
  Page Should Contain  ${login_username_invalid}
  Log to console  \nExpected result: 2. Login failed and the message 'Your username is invalid!' is shown.


