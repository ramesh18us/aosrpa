namespace: AOS.Flows
flow:
  name: add_product_to_cart
  inputs:
    - url: 'http://rpa.mf-te.com:8080/'
    - username: rameshn
    - password:
        default: Password1
        sensitive: true
    - product_id: '29'
    - color_code: '414141'
  workflow:
    - Authenticate:
        do:
          io.cloudslang.base.http.http_client_post:
            - url: "${url+'/accountservice/AccountLoginRequest'}"
            - body: "${'<?xml version=\"1.0\" encoding=\"UTF-8\"?><soap:Envelope xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\"><soap:Body><AccountLoginRequest xmlns=\"com.advantage.online.store.accountservice\"><email></email><loginUser>%s</loginUser><loginPassword>%s</loginPassword></AccountLoginRequest></soap:Body></soap:Envelope>' % (username, password)}"
            - content_type: text/xml
        publish:
          - soap: '${return_result}'
        navigate:
          - SUCCESS: get_user_id
          - FAILURE: on_failure
    - get_user_id:
        do:
          io.cloudslang.base.xml.xpath_query:
            - xml_document: '${soap}'
            - xpath_query: '//ns2:userId/text()'
        publish:
          - user_id: '${selected_value}'
        navigate:
          - SUCCESS: get_auth_token
          - FAILURE: on_failure
    - get_auth_token:
        do:
          io.cloudslang.base.xml.xpath_query:
            - xml_document: '${soap}'
            - xpath_query: '//ns2:t_authorization/text()'
        publish:
          - token: '${selected_value}'
        navigate:
          - SUCCESS: add_product_to_cart
          - FAILURE: on_failure
    - add_product_to_cart:
        do:
          io.cloudslang.base.http.http_client_post:
            - url: '${"%s/order/api/v1/carts/%s/product/%s/color/%s" % (url, user_id, product_id, color_code)}'
            - auth_type: anonymous
            - headers: '${"Authorization: Basic "+token}'
        publish:
          - cart_json: '${return_result}'
        navigate:
          - SUCCESS: SUCCESS
          - FAILURE: on_failure
  outputs:
    - cart_json: '${cart_json}'
  results:
    - SUCCESS
    - FAILURE
extensions:
  graph:
    steps:
      get_auth_token:
        x: 263
        'y': 341
      get_user_id:
        x: 329
        'y': 86
      Authenticate:
        x: 67
        'y': 156
      add_product_to_cart:
        x: 487
        'y': 210
        navigate:
          4b95c8c7-95fa-406d-1705-ca7207e5a609:
            targetId: 81244b72-3a6a-808d-cd41-f2a507541ee8
            port: SUCCESS
    results:
      SUCCESS:
        81244b72-3a6a-808d-cd41-f2a507541ee8:
          x: 713
          'y': 292
