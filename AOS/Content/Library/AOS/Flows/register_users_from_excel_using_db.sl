namespace: AOS.Flows
flow:
  name: register_users_from_excel_using_db
  inputs:
    - excel_path: "C:\\\\Enablement\\\\HotLabs\\\\AOS\\\\shopping_list.xlsx"
    - sheet: Users
    - login_header: Username
    - password_header: Password
    - name_header: Full Name
    - email_header: Email
  workflow:
    - Get_Cell_1:
        do_external:
          5060d8cc-d03c-43fe-946f-7babaaec589f:
            - excelFileName: '${excel_path}'
            - worksheetName: '${sheet}'
            - hasHeader: 'yes'
            - firstRowIndex: '0'
            - rowIndex: '0:1000'
            - columnIndex: '0:100'
            - rowDelimiter: '|'
            - columnDelimiter: ','
            - login_header: '${login_header}'
            - password_header: '${password_header}'
            - email_header: '${email_header}'
            - name_header: '${name_header}'
        publish:
          - data: '${returnResult}'
          - header
          - login_index: '${str(header.split(",").index(login_header))}'
          - password_index: '${str(header.split(",").index(password_header))}'
          - email_index: '${str(header.split(",").index(email_header))}'
          - name_index: '${str(header.split(",").index(name_header))}'
        navigate:
          - failure: on_failure
          - success: insert_user
    - insert_user:
        loop:
          for: 'row in data.split("|")'
          do:
            AOS.Flows.insert_user:
              - login_name: '${row.split(",")[int(login_index)]}'
              - password: '${row.split(",")[int(password_index)]}'
              - email: '${row.split(",")[int(email_index)]}'
              - first_name: '${row.split(",")[int(name_index)].split()[0]}'
              - last_name: '${row.split(",")[int(name_index)].split()[-1]}'
          break:
            - FAILURE
        navigate:
          - SUCCESS: SUCCESS
          - FAILURE: on_failure
  results:
    - SUCCESS
    - FAILURE
extensions:
  graph:
    steps:
      Get_Cell_1:
        x: 72
        'y': 90
      insert_user:
        x: 282
        'y': 93
        navigate:
          3a3f4120-a457-8a54-7f70-30d407bb5acf:
            targetId: ef4d9e9a-8d40-de93-5349-bb0e76e44292
            port: SUCCESS
    results:
      SUCCESS:
        ef4d9e9a-8d40-de93-5349-bb0e76e44292:
          x: 377
          'y': 196
