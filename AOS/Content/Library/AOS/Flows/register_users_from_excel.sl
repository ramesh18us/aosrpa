namespace: AOS.Flows
flow:
  name: register_users_from_excel
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
          - success: First_UFT_RPA_flow
    - First_UFT_RPA_flow:
        loop:
          for: 'row in data.split("|")'
          do:
            AOS_UFT.First_UFT_RPA_flow:
              - username_f: '${row.split(",")[int(login_index)]}'
              - password: '${row.split(",")[int(password_index)]}'
              - first_name: '${row.split(",")[int(name_index)].split()[0]}'
              - last_name: '${row.split(",")[int(name_index)].split()[-1]}'
              - email: '${row.split(",")[int(email_index)]}'
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
        'y': 89
      First_UFT_RPA_flow:
        x: 196
        'y': 160
        navigate:
          751ebdcd-70e2-d43c-ff5a-a6dc068e0f40:
            targetId: ef4d9e9a-8d40-de93-5349-bb0e76e44292
            port: SUCCESS
    results:
      SUCCESS:
        ef4d9e9a-8d40-de93-5349-bb0e76e44292:
          x: 377
          'y': 196
