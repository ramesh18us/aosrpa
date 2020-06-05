namespace: AOS.Flows.Python_Expressions
flow:
  name: Slice_Operator_Excercise1
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
          - 'TRUE': sleep
          - 'FALSE': Remove_First_Last_Characters
    - Remove_First_Last_Characters:
        do:
          io.cloudslang.base.json.json_path_query:
            - json_object: '{"id": "12345"}'
            - json_path: ' $.id'
        publish:
          - id: '${return_result[0:7]}'
        navigate:
          - SUCCESS: Remove_every_second_character
          - FAILURE: on_failure
    - Remove_every_second_character:
        do:
          io.cloudslang.base.json.json_path_query:
            - json_object: '{"id": "12345"}'
            - json_path: ' $.id'
        publish:
          - id: '${return_result[1:-1:2]}'
        navigate:
          - SUCCESS: Reverse_Order
          - FAILURE: on_failure
    - Reverse_Order:
        do:
          io.cloudslang.base.json.json_path_query:
            - json_object: '{"id": "12345"}'
            - json_path: ' $.id'
        publish:
          - id: '${return_result[::-1]}'
        navigate:
          - SUCCESS: Reverse_Order_Remove_First_Last_Character
          - FAILURE: on_failure
    - Reverse_Order_Remove_First_Last_Character:
        do:
          io.cloudslang.base.json.json_path_query:
            - json_object: '{"id": "12345"}'
            - json_path: ' $.id'
        publish:
          - id: '${return_result[1:-1][::-1]}'
        navigate:
          - SUCCESS: Reverse_String_List
          - FAILURE: on_failure
    - Reverse_String_List:
        do:
          io.cloudslang.base.json.json_path_query:
            - json_object: |-
                ${'''
                {
                "names" : [ "Petr", "Ron", "Mike", "Lori" ]
                }
                '''}
            - json_path: $.names
        publish:
          - id: '${str(eval(return_result)[::-1])}'
        navigate:
          - SUCCESS: Split_strings
          - FAILURE: on_failure
    - Split_strings:
        loop:
          for: seconds in list
          do:
            io.cloudslang.base.utils.sleep:
              - seconds: '${seconds}'
          break:
            - FAILURE
        navigate:
          - SUCCESS: Split_strings_special_Characters
          - FAILURE: on_failure
    - Split_strings_special_Characters:
        loop:
          for: "seconds in list2.split('-')"
          do:
            io.cloudslang.base.utils.sleep:
              - seconds: '${seconds}'
          break:
            - FAILURE
          publish:
            - seconds
        navigate:
          - SUCCESS: Split_strings_white_spaces
          - FAILURE: on_failure
    - Split_strings_white_spaces:
        loop:
          for: 'seconds in list3.split(None, 4)'
          do:
            io.cloudslang.base.utils.sleep:
              - seconds: '${seconds}'
          break:
            - FAILURE
          publish:
            - seconds
        navigate:
          - SUCCESS: SUCCESS
          - FAILURE: on_failure
    - sleep:
        do:
          io.cloudslang.base.utils.sleep:
            - seconds: '0'
            - list_val: "${str(list.split(','))}"
            - list: '${eval(input_0)[0]}'
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
        x: 47
        'y': 160
      Split_strings_white_spaces:
        x: 495
        'y': 153
        navigate:
          64abd72f-9961-09c1-722a-efa68120d14c:
            targetId: b0e4cd40-0d52-d2c9-35d1-fb4d06dd69ff
            port: SUCCESS
      Remove_First_Last_Characters:
        x: 206
        'y': 333
      Reverse_String_List:
        x: 686
        'y': 576
      Reverse_Order:
        x: 389
        'y': 550
      Split_strings_special_Characters:
        x: 556
        'y': 287
      sleep:
        x: 274
        'y': 50
        navigate:
          d1a5ee20-7fcf-9f70-8dfa-85379965ac3f:
            targetId: b0e4cd40-0d52-d2c9-35d1-fb4d06dd69ff
            port: SUCCESS
      Reverse_Order_Remove_First_Last_Character:
        x: 532
        'y': 523
      Split_strings:
        x: 697
        'y': 362
      Remove_every_second_character:
        x: 380
        'y': 383
    results:
      SUCCESS:
        b0e4cd40-0d52-d2c9-35d1-fb4d06dd69ff:
          x: 793
          'y': 25
