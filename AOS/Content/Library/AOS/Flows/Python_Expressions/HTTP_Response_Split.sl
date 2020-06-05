namespace: AOS.Flows.Python_Expressions
flow:
  name: HTTP_Response_Split
  inputs:
    - list: '1,2,3,4,5'
    - list2: 1-2-3-4-5
    - list3: '1  2 3   4   5 '
  workflow:
    - is_true:
        do:
          io.cloudslang.base.utils.is_true:
            - bool_value: 'true'
        navigate:
          - 'TRUE': get_token
          - 'FALSE': SUCCESS
    - get_token:
        do:
          io.cloudslang.base.http.http_client_action:
            - url: "${get_sp('url')}"
            - auth_type: basic
            - username: "${get_sp('username')}"
            - password:
                value: "${get_sp('password')}"
                sensitive: true
            - method: HEAD
        publish:
          - token: "${response_headers.split('X-CSRF-TOKEN:')[1].split('\\n')[0].strip()}"
          - length: '${str(len(token))}'
          - test_string: '---###Test String###---'
          - strip: "${test_string.strip('-#')}"
          - lstrip: "${test_string.lstrip('-#')}"
          - rstrip: "${test_string.rstrip('-#')}"
        navigate:
          - SUCCESS: get_categories
          - FAILURE: on_failure
    - get_categories:
        do:
          io.cloudslang.base.http.http_client_action:
            - url: "${'%s/rest/v0/categories' % get_sp('url')}"
            - auth_type: basic
            - username: admin
            - password:
                value: Cloud@123
                sensitive: true
            - headers: "${'X-CSRF-TOKEN: '+token}"
            - method: GET
        publish:
          - token: "${response_headers.split('X-CSRF-TOKEN:')[1].split('\\n')[0].strip()}"
          - length: '${str(len(token))}'
          - test_string: '---###Test String###---'
          - strip: "${test_string.strip('-#')}"
          - lstrip: "${test_string.lstrip('-#')}"
          - rstrip: "${test_string.rstrip('-#')}"
          - categories_json: '${return_result}'
        navigate:
          - SUCCESS: SUCCESS
          - FAILURE: on_failure
  results:
    - FAILURE
    - SUCCESS
extensions:
  graph:
    steps:
      is_true:
        x: 174
        'y': 356
        navigate:
          150ca4ed-9314-d671-acaa-71a94a3b4d7b:
            targetId: b0e4cd40-0d52-d2c9-35d1-fb4d06dd69ff
            port: 'FALSE'
      get_categories:
        x: 477
        'y': 34
        navigate:
          1900c622-9c89-792a-9d8a-83ba5db2fe89:
            targetId: b0e4cd40-0d52-d2c9-35d1-fb4d06dd69ff
            port: SUCCESS
      get_token:
        x: 169
        'y': 84
    results:
      SUCCESS:
        b0e4cd40-0d52-d2c9-35d1-fb4d06dd69ff:
          x: 721
          'y': 331
