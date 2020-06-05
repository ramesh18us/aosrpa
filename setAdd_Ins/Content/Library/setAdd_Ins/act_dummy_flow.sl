namespace: setAdd_Ins
flow:
  name: act_dummy_flow
  workflow:
  - act_dummy:
      do:
        setAdd_Ins.act_dummy: []
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
