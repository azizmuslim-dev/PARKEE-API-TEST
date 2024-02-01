*** Settings ***
Library           RequestsLibrary

*** Variables ***
${API_URL}        https://reqres.in/api/users
${name}           aziz muslim
${job}            software quality assurance

*** Test Cases ***
# Test Case: Respons Tidak Sama Dengan Permintaan
[Documentation]    # Uji API dengan payload dan verifikasi respons tidak sama dengan permintaan
    Create Session    api_session    ${API_URL}

    ${headers}    Create Dictionary    Content-Type=application/json

    ${request_payload}    Create Dictionary    name=${name}    job=${job}

    # Kirim permintaan
    ${response}    Post Request    api_session    /users    data=${request_payload}    headers=${headers}

    # Verifikasi bahwa kode status adalah 201 (Created)
    Should Be Equal As Numbers    ${response.status_code}    201

    # Buat kamus dari respons JSON
    ${response_body}    Set Variable    ${response.json()}
    
    # Verifikasi bahwa respons tidak sama dengan payload permintaan
    Should Not Be Equal    ${response_body}    ${request_payload}
