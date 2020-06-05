namespace: AOS.Flows.Python_Expressions
flow:
  name: Iiterate
  workflow:
    - is_true:
        do:
          io.cloudslang.base.utils.is_true:
            - bool_value: 'true'
        navigate:
          - 'TRUE': sleep_1_1_1
          - 'FALSE': sleep
    - sleep:
        loop:
          for: i in range(4)
          do:
            io.cloudslang.base.utils.sleep:
              - seconds: '${str(i)}'
          break:
            - FAILURE
        navigate:
          - SUCCESS: sleep_1
          - FAILURE: on_failure
    - sleep_1:
        loop:
          for: 'i in range(1,2)'
          do:
            io.cloudslang.base.utils.sleep:
              - seconds: '${str(i)}'
          break:
            - FAILURE
        navigate:
          - SUCCESS: sleep_1_1
          - FAILURE: on_failure
    - sleep_1_1:
        loop:
          for: 'i in range(2,4,2)'
          do:
            io.cloudslang.base.utils.sleep:
              - seconds: '${str(i)}'
          break:
            - FAILURE
        navigate:
          - SUCCESS: sleep_1_1_1
          - FAILURE: on_failure
    - sleep_1_1_1:
        loop:
          for: 'i in range(4,1,-2)'
          do:
            io.cloudslang.base.utils.sleep:
              - seconds: '${str(i)}'
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
      sleep:
        x: 258
        'y': 495
      is_true:
        x: 47
        'y': 182
      sleep_1:
        x: 539
        'y': 371
      sleep_1_1:
        x: 265
        'y': 266
      sleep_1_1_1:
        x: 230
        'y': 32
        navigate:
          1ffba135-595b-c0e1-3af6-acce9fca0fd7:
            targetId: 0ffb4451-9cad-6c7e-0199-c89dac3e827d
            port: SUCCESS
    results:
      SUCCESS:
        0ffb4451-9cad-6c7e-0199-c89dac3e827d:
          x: 677
          'y': 270
