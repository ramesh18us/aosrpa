namespace: AOS.Flows.Python_Expressions
flow:
  name: Format_JSON
  workflow:
    - json_path_query:
        do:
          io.cloudslang.base.json.json_path_query:
            - json_object: |-
                ${'''
                {{
                    "central" : {{
                        "hostname": "{hostname}",
                        "port" : "{central_port}"
                    }},
                    "designer" : {{
                        "hostname": "{hostname}",
                        "port" : "{designer_port}"
                    }},
                    "ssx" : {{
                        "hostname": "{hostname}",
                        "port" : "{ssx_port}"
                    }}
                }}
                '''.format(hostname="rpa.mf-te.com", central_port=8443, designer_port=8445, ssx_port=8446)}
            - json_path: $.designer.port
        publish:
          - designer_port: '${return_result}'
        navigate:
          - SUCCESS: SUCCESS
          - FAILURE: on_failure
  results:
    - SUCCESS
    - FAILURE
extensions:
  graph:
    steps:
      json_path_query:
        x: 134
        'y': 162
        navigate:
          91a2fab2-ede0-940d-13c1-2fe5e1ab2627:
            targetId: f943f9e5-905f-5c37-5c02-0705f999caf7
            port: SUCCESS
    results:
      SUCCESS:
        f943f9e5-905f-5c37-5c02-0705f999caf7:
          x: 536
          'y': 225
