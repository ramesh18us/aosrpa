namespace: AOS.Flows
operation:
  name: Ron_UFT
  sequential_action:
    gav: com.microfocus.seq:AOS.Flows.Ron_UFT:1.0.0
    external: true
  outputs:
  - return_result: ${return_result}
  - error_message: ${error_message}
  results:
  - SUCCESS
  - WARNING
  - FAILURE
