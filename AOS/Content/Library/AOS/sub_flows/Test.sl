namespace: AOS.sub_flows
flow:
  name: Test
  workflow:
    - Sleep:
        do_external:
          d1bbf441-824a-450e-afae-2ddec0e0f35e:
            - seconds: '0'
        navigate:
          - success: SUCCESS
          - failure: on_failure
  results:
    - SUCCESS
    - FAILURE
extensions:
  graph:
    steps:
      Sleep:
        x: 170
        'y': 76
        navigate:
          179a7ce0-9c09-2046-9223-07f60b766d08:
            targetId: e80320fc-a7d7-1f6d-5e6d-1457caf3e638
            port: success
    results:
      SUCCESS:
        e80320fc-a7d7-1f6d-5e6d-1457caf3e638:
          x: 351
          'y': 264
