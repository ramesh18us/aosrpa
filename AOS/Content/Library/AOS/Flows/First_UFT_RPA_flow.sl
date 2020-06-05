namespace: AOS.Flows
flow:
  name: First_UFT_RPA_flow
  inputs:
    - username_f: rameshn2
    - password: Password1
    - first_name: Ramesh
    - last_name: Nagarajan
    - email: ramesh.nagarajan@microfocus.com
    - url: 'http://rpa.mf-te.com:8080/'
  workflow:
    - First_UFT_RPA:
        do:
          AOS_UFT.First_UFT_RPA:
            - username_a: '${username_f}'
            - url: '${url}'
            - username: '${username_f}'
            - password: '${password}'
            - first_name: '${first_name}'
            - last_name: '${last_name}'
            - email: '${email}'
        publish:
          - return_result
          - error_message
        navigate:
          - SUCCESS: SUCCESS
          - WARNING: SUCCESS
          - FAILURE: on_failure
  outputs:
    - return_result
    - error_message
  results:
    - SUCCESS
    - FAILURE
extensions:
  graph:
    steps:
      First_UFT_RPA:
        x: 100
        'y': 149
        navigate:
          c575cea9-9dd3-8dec-49e5-7cd9d23425c2:
            targetId: 3eb66b24-e702-4aeb-4c25-3ca763b71cdb
            port: SUCCESS
          093f8192-ab45-0238-b5e6-f640c32df6c6:
            targetId: 3eb66b24-e702-4aeb-4c25-3ca763b71cdb
            port: WARNING
    results:
      SUCCESS:
        3eb66b24-e702-4aeb-4c25-3ca763b71cdb:
          x: 400
          'y': 150
