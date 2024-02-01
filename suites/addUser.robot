*** Settings ***
Library           RequestsLibrary

*** Variables ***
${API_URL}        https://reqres.in/api/users
${name}           aziz muslim
${job}            software quality assurance

*** Test Cases ***
# Kasus Uji Positif - API Users POST
[Documentation]    #Uji API dengan skenario positif
    Create Session    api_session    ${API_URL}

    ${headers}    Create Dictionary    Content-Type=application/json

    ${valid_payload}    Create Dictionary    name=${name}    job=${job}

    # Kirim permintaan POST
    ${response}    Post Request    api_session    /users    data=${valid_payload}    headers=${headers}

    # Verifikasi bahwa kode status adalah 201 (Created)
    Should Be Equal As Numbers    ${response.status_code}    201
    
    # # Ekstrak ID pengguna dari respons
    # ${user_id}    Set Variable    ${response.json().id}
    
    # Log    User ID: ${user_id}
