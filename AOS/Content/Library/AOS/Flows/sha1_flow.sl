namespace: AOS.Flows
flow:
  name: sha1_flow
  workflow:
    - Calculatesha1:
        do:
          AOS.Calculatesha1:
            - text: tests
        navigate:
          - SUCCESS: SUCCESS
  results:
    - SUCCESS
extensions:
  graph:
    steps:
      Calculatesha1:
        x: 235
        'y': 168
        navigate:
          ee4fa09f-8917-6c2a-5534-cb3e7c3ec59d:
            targetId: fbb955cf-62c4-8af7-5f22-abd1ac79a660
            port: SUCCESS
    results:
      SUCCESS:
        fbb955cf-62c4-8af7-5f22-abd1ac79a660:
          x: 503
          'y': 179
