namespace: AOS.Flows
flow:
  name: buy_item
  inputs:
    - url: 'http://rpa.mf-te.com:8080/'
    - username: rameshn
    - password: Password1
  workflow:
    - buy_item_act:
        do:
          AOS.buy_item_act:
            - url: '${url}'
            - username: '${username}'
            - password:
                value: '${password}'
                sensitive: true
        navigate:
          - SUCCESS: SUCCESS
          - WARNING: SUCCESS
          - FAILURE: on_failure
  results:
    - FAILURE
    - SUCCESS
extensions:
  graph:
    steps:
      buy_item_act:
        x: 239
        'y': 191
        navigate:
          4a570a38-9183-636a-b186-7edec6f0bfe8:
            targetId: 18e9f4b7-78e7-3338-92b0-34808eab9fc6
            port: SUCCESS
          927651e0-5a33-b4be-68f7-d99c1c1ba242:
            targetId: 18e9f4b7-78e7-3338-92b0-34808eab9fc6
            port: WARNING
    results:
      SUCCESS:
        18e9f4b7-78e7-3338-92b0-34808eab9fc6:
          x: 562
          'y': 157
