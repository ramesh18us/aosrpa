namespace: AOS.sub_flows
flow:
  name: iterate_categories
  inputs:
    - json
    - category_id
    - file_path
  workflow:
    - get_category:
        do:
          io.cloudslang.base.json.json_path_query:
            - json_object: '${json}'
            - json_path: '${"$[?(@.categoryId == "+category_id+")]"}'
        publish:
          - category_json: '${return_result}'
        navigate:
          - SUCCESS: get_category_name
          - FAILURE: on_failure
    - get_product_ids:
        do:
          io.cloudslang.base.json.json_path_query:
            - json_object: '${category_json}'
            - json_path: '$.*.products.*.productId'
        publish:
          - product_ids: '${return_result[1:-1]}'
        navigate:
          - SUCCESS: add_product
          - FAILURE: on_failure
    - get_category_name:
        do:
          io.cloudslang.base.json.json_path_query:
            - json_object: '${category_json}'
            - json_path: '$.*.categoryName'
        publish:
          - category_name: '${return_result[2:-2]}'
        navigate:
          - SUCCESS: get_product_ids
          - FAILURE: on_failure
    - add_product:
        loop:
          for: product_id in product_ids
          do:
            AOS.sub_flows.iterate_products:
              - json: '${category_json}'
              - category_name: '${category_name}'
              - category_id: '${category_id}'
              - product_id: '${product_id}'
              - file_path: '${file_path}'
          break: []
        navigate:
          - SUCCESS: SUCCESS
          - FAILURE: on_failure
  results:
    - SUCCESS
    - FAILURE
extensions:
  graph:
    steps:
      get_category:
        x: 188
        'y': 155
      get_product_ids:
        x: 307
        'y': 374
      get_category_name:
        x: 111
        'y': 365
      add_product:
        x: 537
        'y': 402
        navigate:
          e2842658-4e72-ecab-cfe8-972ea29d6495:
            targetId: 43ffa837-32a4-eef2-e345-5c431e67f168
            port: SUCCESS
    results:
      SUCCESS:
        43ffa837-32a4-eef2-e345-5c431e67f168:
          x: 797
          'y': 147
