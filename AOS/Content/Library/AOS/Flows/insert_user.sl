namespace: AOS.Flows
flow:
  name: insert_user
  inputs:
    - login_name: rameshn3
    - password: Password1
    - email: ramesh.nagarajan@microfocus.com
    - first_name: Ramesh
    - last_name: Nagarajan
  workflow:
    - has_password:
        do:
          AOS.sub_flows.sha1:
            - text: '${password}'
        publish:
          - password_sha1: '${sha1}'
        navigate:
          - SUCCESS: hash_name_password
    - hash_name_password:
        do:
          AOS.sub_flows.sha1:
            - text: '${login_name[::-1]+password_sha1}'
        publish:
          - username_password_sha1: '${sha1}'
        navigate:
          - SUCCESS: random_user_id
    - random_user_id:
        do:
          io.cloudslang.base.math.random_number_generator:
            - min: '100000000'
            - max: '1000000000'
        publish:
          - user_id: '${random_number}'
        navigate:
          - SUCCESS: insert_user
          - FAILURE: on_failure
    - insert_user:
        do:
          io.cloudslang.base.database.sql_command:
            - db_server_name: "${get_sp('db_host')}"
            - db_type: PostgreSQL
            - username: "${get_sp('db_user')}"
            - password:
                value: "${get_sp('db_password')}"
                sensitive: true
            - database_name: adv_account
            - command: "${\"INSERT INTO account (user_id, user_type, active, agree_to_receive_offers, defaultpaymentmethodid, email, internallastsuccesssullogin, internalunsuccessfulloginattempts, internaluserblockedfromloginuntil, first_name, last_name, login_name, password, country_id, address, city_name) VALUES ('\"+user_id+\"', 20, 'Y', true, 0, '\"+email+\"', 0, 0, 0, '\"+first_name+\"', '\"+last_name+\"', '\"+login_name+\"', '\"+username_password_sha1+\"', 210, '', '');\"}"
            - trust_all_roots: 'true'
            - user_id: '${user_id}'
        publish:
          - return_result
        navigate:
          - SUCCESS: SUCCESS
          - FAILURE: on_failure
  results:
    - SUCCESS
    - FAILURE
extensions:
  graph:
    steps:
      has_password:
        x: 135
        'y': 104
      hash_name_password:
        x: 118
        'y': 264
      random_user_id:
        x: 314
        'y': 280
      insert_user:
        x: 519
        'y': 372
        navigate:
          63994c14-6675-ad83-ac57-8db74797920b:
            targetId: b0587cd5-1340-809b-f961-1e6188fc806d
            port: SUCCESS
    results:
      SUCCESS:
        b0587cd5-1340-809b-f961-1e6188fc806d:
          x: 454
          'y': 117
