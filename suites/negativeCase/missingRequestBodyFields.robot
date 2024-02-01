*** Settings ***
Library           RequestsLibrary

*** Variables ***
${API_URL}        https://reqres.in/api/users

*** Test Cases ***
# Kasus Uji: Bidang Permintaan yang Hilang
[Documentation]    #Uji API dengan bidang permintaan yang hilang
    Create Session    api_session    ${API_URL}

    ${headers}    Create Dictionary    Content-Type=application/json

    # Kirim permintaan dengan body kosong
    ${response}    Post Request    api_session    /users    data={}    headers=${headers}

    # Verifikasi bahwa kode status adalah 201 (Created) - Perhatikan bahwa ini bisa saja salah pada implementasi aktual API
    Should Be Equal As Numbers    ${response.status_code}    201

    ${response_body}    Set Variable    ${response.text}
    Log    Response Body: ${response_body}
