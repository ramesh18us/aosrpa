namespace: AOS.Flows.Python_Expressions
flow:
  name: iterate_dictionaries
  workflow:
    - is_true:
        do:
          io.cloudslang.base.utils.is_true:
            - bool_value: 'true'
        navigate:
          - 'TRUE': iterate_list
          - 'FALSE': iterate_dictionary
    - iterate_dictionary:
        do:
          io.cloudslang.base.json.json_path_query:
            - json_object: '{"names":{"Petr":1,"Ron":2,"Mike":3,"Lori":4}}'
            - json_path: $.names
        publish:
          - names: '${return_result}'
        navigate:
          - SUCCESS: iterate_dictionary_sleep
          - FAILURE: iterate_list_zip
    - iterate_dictionary_sleep:
        loop:
          for: 'name,i in eval(names)'
          do:
            io.cloudslang.base.utils.sleep:
              - seconds: '${str(i)}'
              - name: '${name}'
          break:
            - FAILURE
        navigate:
          - SUCCESS: SUCCESS
          - FAILURE: on_failure
    - iterate_list:
        do:
          io.cloudslang.base.json.json_path_query:
            - json_object: '{"names":["Ed","Ron","Mike","Peter"]}'
            - json_path: $.names
        publish:
          - names: '${return_result}'
        navigate:
          - SUCCESS: iterate_list_sleep_using_enumerate
          - FAILURE: parallel_flow
    - parallel_flow:
        parallel_loop:
          for: number in range(3)
          do:
            AOS.Flows.Python_Expressions.parallel_flow:
              - number: '${str(number)}'
              - names: '${names}'
        navigate:
          - SUCCESS: SUCCESS
          - FAILURE: on_failure
    - iterate_list_sleep_using_enumerate:
        loop:
          for: pair in enumerate(eval(names))
          do:
            io.cloudslang.base.utils.sleep:
              - seconds: '${str(pair[0])}'
              - name: '${pair[1]}'
          break:
            - FAILURE
        navigate:
          - SUCCESS: SUCCESS
          - FAILURE: on_failure
    - iterate_list_zip:
        do:
          io.cloudslang.base.json.json_path_query:
            - json_object: |-
                ${'''
                {
                "names": ["Ed","Ron","Mike","Peter"],
                "seconds": [4,3,2]
                }
                '''}
            - json_path: $.names
        publish:
          - names: '${return_result}'
        navigate:
          - SUCCESS: iterate_list_zip_1
          - FAILURE: on_failure
    - iterate_list_sleep_using_zip:
        loop:
          for: 'pair in zip(eval(seconds),eval(names))'
          do:
            io.cloudslang.base.utils.sleep:
              - seconds: '${str(pair[0])}'
              - name: '${pair[1]}'
          break:
            - FAILURE
        navigate:
          - SUCCESS: SUCCESS
          - FAILURE: on_failure
    - iterate_list_zip_1:
        do:
          io.cloudslang.base.json.json_path_query:
            - json_object: |-
                ${'''
                {
                "names": ["Ed","Ron","Mike","Peter"],
                "seconds": [4,3,2]
                }
                '''}
            - json_path: $.seconds
        publish:
          - seconds: '${return_result}'
        navigate:
          - SUCCESS: iterate_list_sleep_using_zip
          - FAILURE: on_failure
  results:
    - SUCCESS
    - FAILURE
extensions:
  graph:
    steps:
      iterate_list_sleep_using_zip:
        x: 426
        'y': 271
        navigate:
          4d57496a-9b73-c731-e1ad-66c0837ce954:
            targetId: 9a4b9ccb-9913-4149-2428-313b4352ee2b
            port: SUCCESS
      iterate_list:
        x: 266
        'y': 26
      is_true:
        x: 23
        'y': 84
      iterate_list_sleep_using_enumerate:
        x: 689
        'y': 33
        navigate:
          716233a1-60d7-bcd0-d4a0-6221357b17d0:
            targetId: 9a4b9ccb-9913-4149-2428-313b4352ee2b
            port: SUCCESS
      iterate_list_zip:
        x: 148
        'y': 215
      parallel_flow:
        x: 517
        'y': 164
        navigate:
          dc188dbe-6c26-d36a-0674-790f6809c4b1:
            targetId: 9a4b9ccb-9913-4149-2428-313b4352ee2b
            port: SUCCESS
      iterate_dictionary_sleep:
        x: 470
        'y': 485
        navigate:
          c2a7d10f-1699-6588-9791-60f59ad7f9ba:
            targetId: 9a4b9ccb-9913-4149-2428-313b4352ee2b
            port: SUCCESS
      iterate_list_zip_1:
        x: 294
        'y': 198
      iterate_dictionary:
        x: 81
        'y': 417
    results:
      SUCCESS:
        9a4b9ccb-9913-4149-2428-313b4352ee2b:
          x: 761
          'y': 329
