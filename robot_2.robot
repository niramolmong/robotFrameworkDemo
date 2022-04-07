*** Settings ***
Library    Collections
Library    String
Library    HttpLibrary.HTTP
Library    RequestsLibrary
Library    OperatingSystem

*** Variables ***
${url}      https://reqres.in  
${path_success}     /api/users/12
${path_user_not_found}     /api/users/1234
@{data_response}  id  email  first_name  last_name  avatar


*** Keywords ***
Get response case success
  Create Session    my_session    ${url}
  ${response}=    Get Request    my_session    ${path_success}
  Return From Keyword    ${response}

Get response case user not found
  Create Session    my_session    ${url}
  ${response}=    Get Request    my_session    ${path_user_not_found}
  Return From Keyword    ${response}


*** Test Cases ***
Get user profile success
  &{params}=    Create Dictionary
  ...   id=12    
  ...   email=rachel.howell@reqres.in
  ...   first_name=Rachel
  ...   last_name=Howell
  ...   avatar=https://reqres.in/img/faces/12-image.jpg

  ${response}=    Get response case success    
  # Log to console     ${response.content}
  Should be equal as strings  ${response.status_code}    200
	Log to console  \nExpected result: 1. Verify response status code should be ‘200’ 
  Should be equal as strings  ${params.id}    12
  Should be equal as strings  ${params.email}    rachel.howell@reqres.in
  Should be equal as strings  ${params.first_name}    Rachel
  Should be equal as strings  ${params.last_name}    Howell
  Should be equal as strings  ${params.avatar}    https://reqres.in/img/faces/12-image.jpg
  Log to console  \nExpected result: 2. Compare the response body with expected. ‘ID’ == 12, ‘Email’ == rachel.howell@reqres.in, \n‘First Name’ == Rachel, ‘Last Name’ == Howell, ‘Avatar’ == https://reqres.in/img/faces/12-image.jpg

 
Get user profile not found
  ${response}=    Get response case user not found    
  Log to console     ${response.content}
  Should be equal as strings  ${response.status_code}    404
	Log to console  \nExpected result: 1. Verify response status code should be ‘404’ 
  Should be equal as strings  ${response.content}    {}
  Log to console  \nExpected result: 2.Response body should be '{}'
  
 

