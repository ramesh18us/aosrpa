namespace: AOS.Flows.Python_Expressions
flow:
  name: parallel_flow
  inputs:
    - number
    - names
  workflow:
    - is_zero:
        do:
          io.cloudslang.base.utils.is_true:
            - bool_value: "${str(number=='0')}"
        navigate:
          - 'TRUE': iterate_list_sleep_using_names
          - 'FALSE': is_one
    - iterate_list_sleep_using_names:
        loop:
          for: name in eval(names)
          do:
            io.cloudslang.base.utils.sleep:
              - seconds: '${str(len(name))}'
              - name: '${name}'
          break:
            - FAILURE
        navigate:
          - SUCCESS: SUCCESS
          - FAILURE: on_failure
    - iterate_list_sleep_using_names_index:
        loop:
          for: x in eval(names)
          do:
            io.cloudslang.base.utils.sleep:
              - seconds: '${str(eval(names).index(x))}'
              - name: '${x}'
          break:
            - FAILURE
        navigate:
          - SUCCESS: SUCCESS
          - FAILURE: on_failure
    - is_one:
        do:
          io.cloudslang.base.utils.is_true:
            - bool_value: "${str(number=='1')}"
        navigate:
          - 'TRUE': iterate_list_sleep_using_names_index
          - 'FALSE': sleep
    - sleep:
        do:
          io.cloudslang.base.utils.sleep:
            - seconds: '2'
        navigate:
          - SUCCESS: SUCCESS
          - FAILURE: on_failure
  results:
    - SUCCESS
    - FAILURE
extensions:
  graph:
    steps:
      iterate_list_sleep_using_names_index:
        x: 445
        'y': 231
        navigate:
          4ad9f9a0-e6b3-323b-2e8a-c4de42a118fc:
            targetId: 0f36e1fe-a616-fd0f-e2e0-74f1b700d801
            port: SUCCESS
      iterate_list_sleep_using_names:
        x: 370
        'y': 22
        navigate:
          be3bdc68-4f9a-217f-a535-daa0dcacc9e6:
            targetId: 0f36e1fe-a616-fd0f-e2e0-74f1b700d801
            port: SUCCESS
      is_zero:
        x: 124
        'y': 78
      is_one:
        x: 233
        'y': 402
      sleep:
        x: 633
        'y': 532
        navigate:
          e54c1d17-2795-ec36-2e0b-f459028873f3:
            targetId: 0f36e1fe-a616-fd0f-e2e0-74f1b700d801
            port: SUCCESS
    results:
      SUCCESS:
        0f36e1fe-a616-fd0f-e2e0-74f1b700d801:
          x: 795
          'y': 209
