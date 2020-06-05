namespace: setAdd_Ins
operation:
  name: act_dummy
  sequential_action:
    gav: com.microfocus.seq:setAdd_Ins.act_dummy:1.0.0
    skills:
    - Terminal Emulators
    - Web
    - WPF
    settings:
      windows:
        active: false
      terminal_settings:
        active: false
      web:
        active: false
        close_on_exit: false
    steps:
    - step:
        id: '1'
        object_path: Browser("Internet Explorer Enhanced").Page("Internet Explorer
          Enhanced")
        action: Sync
        snapshot: .\Snapshots\ssf1.html
        highlight_id: Browser("Internet Explorer Enhanced").Page("Internet Explorer
          Enhanced")
    - step:
        id: '2'
        object_path: Browser("Internet Explorer Enhanced")
        action: Navigate
        default_args: '"http://rpa.mf-te.com:8080/#/"'
        snapshot: .\Snapshots\ssf2.png
        highlight_id: '2033126'
    - step:
        id: '3'
        object_path: Browser("Internet Explorer Enhanced").Page("Advantage Shopping").Link("speakersTxt")
        action: Click
        snapshot: .\Snapshots\ssf3.html
        highlight_id: Browser("Internet Explorer Enhanced").Page("Advantage Shopping").Link("speakersTxt")
    - step:
        id: '4'
        object_path: Browser("Internet Explorer Enhanced").Page("Advantage Shopping")
        action: Sync
        snapshot: .\Snapshots\ssf4.html
        highlight_id: Browser("Internet Explorer Enhanced").Page("Advantage Shopping")
    - step:
        id: '5'
        object_path: Browser("Internet Explorer Enhanced")
        action: CloseAllTabs
        snapshot: .\Snapshots\ssf5.png
        highlight_id: '2033126'
  outputs:
  - return_result: ${return_result}
  - error_message: ${error_message}
  results:
  - SUCCESS
  - WARNING
  - FAILURE
object_repository:
  objects:
  - object:
      class: Browser
      name: Internet Explorer Enhanced
      properties:
      - property:
          value:
            value: Internet Explorer Enhanced Security Configuration is not enabled
            regular_expression: false
          name: title
          hidden: true
          read_only: true
          type: STRING
      - property:
          value:
            value: res://iesetup.dll/SoftAdmin.htm
            regular_expression: false
          name: openurl
          hidden: true
          read_only: true
          type: STRING
      - property:
          value:
            value: Internet Explorer Enhanced Security Configuration is not enabled
            regular_expression: false
          name: opentitle
          hidden: true
          read_only: true
          type: STRING
      - property:
          value:
            value: '0'
            regular_expression: false
          name: openedbytestingtool
          hidden: true
          read_only: true
          type: BOOL
      - property:
          value:
            value: '1'
            regular_expression: false
          name: number of tabs
          hidden: true
          read_only: true
          type: NUMBER
      - property:
          value:
            value: Internet Explorer Enhanced Security Configuration is not enabled
            regular_expression: false
          name: name
          hidden: true
          read_only: true
          type: STRING
      - property:
          value:
            value: Browser
            regular_expression: false
          name: micclass
          hidden: true
          read_only: true
          type: STRING
      - property:
          value:
            value: '-1'
            regular_expression: false
          name: hastoolbar
          hidden: true
          read_only: true
          type: BOOL
      - property:
          value:
            value: '0'
            regular_expression: false
          name: hasstatusbar
          hidden: true
          read_only: true
          type: BOOL
      - property:
          value:
            value: '-1'
            regular_expression: false
          name: hasmenubar
          hidden: true
          read_only: true
          type: BOOL
      - property:
          value:
            value: '1'
            regular_expression: false
          name: browserindex
          hidden: true
          read_only: true
          type: I2
      basic_identification:
        property_ref:
        - micclass
        ordinal_identifier:
          value: 7
          type: creationtime
      smart_identification:
        base_filter:
          property_ref:
          - micclass
        optional_filter:
          property_ref:
          - name
          - title
          - openurl
          - opentitle
          - hasstatusbar
          - hasmenubar
          - hastoolbar
          - openedbytestingtool
          - number of tabs
        algorithm: Mercury.TolerantPriority
        active: true
      custom_replay: ''
      comments: ''
      visual_relations: ''
      last_update_time: Tuesday, June 2, 2020 3:21:27 PM
      child_objects:
      - object:
          class: Page
          name: Internet Explorer Enhanced
          properties:
          - property:
              value:
                value: ''
                regular_expression: false
              name: user-input in post data
              hidden: true
              read_only: true
              type: STRING
          - property:
              value:
                value: ''
                regular_expression: false
              name: user input in get data
              hidden: true
              read_only: true
              type: STRING
          - property:
              value:
                value: res://iesetup.dll/SoftAdmin.htm
                regular_expression: false
              name: url without form data
              hidden: true
              read_only: true
              type: STRING
          - property:
              value:
                value: res://iesetup.dll/SoftAdmin.htm
                regular_expression: false
              name: url
              hidden: true
              read_only: true
              type: STRING
          - property:
              value:
                value: Internet Explorer Enhanced Security Configuration is not enabled
                regular_expression: false
              name: title
              hidden: true
              read_only: true
              type: STRING
          - property:
              value:
                value: ''
                regular_expression: false
              name: non user-input in post data
              hidden: true
              read_only: true
              type: STRING
          - property:
              value:
                value: ''
                regular_expression: false
              name: non user-input in get data
              hidden: true
              read_only: true
              type: STRING
          - property:
              value:
                value: Page
                regular_expression: false
              name: micclass
              hidden: true
              read_only: true
              type: STRING
          - property:
              value:
                value: '10001'
                regular_expression: false
              name: index
              hidden: true
              read_only: true
              type: NUMBER
          - property:
              value:
                value: ''
                regular_expression: false
              name: form data
              hidden: true
              read_only: true
              type: STRING
          - property:
              value:
                value: '3137'
                regular_expression: false
              name: document size
              hidden: true
              read_only: true
              type: NUMBER
          - property:
              value:
                value: ''
                regular_expression: false
              name: all data in get method
              hidden: true
              read_only: true
              type: STRING
          basic_identification:
            property_ref:
            - micclass
            ordinal_identifier: ''
          smart_identification:
            base_filter:
              property_ref:
              - micclass
            optional_filter:
              property_ref:
              - title
              - url
            algorithm: Mercury.TolerantPriority
            active: true
          custom_replay: ''
          comments: ''
          visual_relations: ''
          last_update_time: Tuesday, June 2, 2020 3:21:27 PM
          child_objects: []
      - object:
          class: Page
          name: Advantage Shopping
          properties:
          - property:
              value:
                value: ''
                regular_expression: false
              name: user-input in post data
              hidden: true
              read_only: true
              type: STRING
          - property:
              value:
                value: ''
                regular_expression: false
              name: user input in get data
              hidden: true
              read_only: true
              type: STRING
          - property:
              value:
                value: http://rpa.mf-te.com:8080/#
                regular_expression: false
              name: url without form data
              hidden: true
              read_only: true
              type: STRING
          - property:
              value:
                value: http://rpa.mf-te.com:8080/#
                regular_expression: false
              name: url
              hidden: true
              read_only: true
              type: STRING
          - property:
              value:
                value:  Advantage Shopping
                regular_expression: false
              name: title
              hidden: true
              read_only: true
              type: STRING
          - property:
              value:
                value: ''
                regular_expression: false
              name: non user-input in post data
              hidden: true
              read_only: true
              type: STRING
          - property:
              value:
                value: ''
                regular_expression: false
              name: non user-input in get data
              hidden: true
              read_only: true
              type: STRING
          - property:
              value:
                value: Page
                regular_expression: false
              name: micclass
              hidden: true
              read_only: true
              type: STRING
          - property:
              value:
                value: '10002'
                regular_expression: false
              name: index
              hidden: true
              read_only: true
              type: NUMBER
          - property:
              value:
                value: ''
                regular_expression: false
              name: form data
              hidden: true
              read_only: true
              type: STRING
          - property:
              value:
                value: '10610'
                regular_expression: false
              name: document size
              hidden: true
              read_only: true
              type: NUMBER
          - property:
              value:
                value: ''
                regular_expression: false
              name: all data in get method
              hidden: true
              read_only: true
              type: STRING
          basic_identification:
            property_ref:
            - micclass
            ordinal_identifier: ''
          smart_identification:
            base_filter:
              property_ref:
              - micclass
            optional_filter:
              property_ref:
              - title
              - url
            algorithm: Mercury.TolerantPriority
            active: true
          custom_replay: ''
          comments: ''
          visual_relations: ''
          last_update_time: Tuesday, June 2, 2020 3:21:27 PM
          child_objects:
          - object:
              class: Link
              name: speakersTxt
              properties:
              - property:
                  value:
                    value: Link
                    regular_expression: false
                  name: micclass
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: //SPAN[@id="speakersTxt"]
                    regular_expression: false
                  name: _xpath
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: '-1'
                    regular_expression: false
                  name: visible
                  hidden: true
                  read_only: true
                  type: BOOL
              - property:
                  value:
                    value: SPEAKERS
                    regular_expression: false
                  name: text
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: '231'
                    regular_expression: false
                  name: source_index
                  hidden: true
                  read_only: true
                  type: NUMBER
              - property:
                  value:
                    value: SPAN
                    regular_expression: false
                  name: html tag
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: speakersTxt
                    regular_expression: false
                  name: html id
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: ''
                    regular_expression: false
                  name: href
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: shop_now roboto-bold ng-binding
                    regular_expression: false
                  name: class
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: ''
                    regular_expression: false
                  name: acc_name
                  hidden: true
                  read_only: true
                  type: STRING
              basic_identification:
                property_ref:
                - micclass
                - _xpath
                - text
                - html tag
                ordinal_identifier: ''
              smart_identification:
                base_filter:
                  property_ref:
                  - micclass
                  - html tag
                optional_filter:
                  property_ref:
                  - text
                  - html id
                  - class
                  - href
                  - visible
                  - acc_name
                algorithm: Mercury.TolerantPriority
                active: true
              custom_replay: ''
              comments: ''
              visual_relations: ''
              last_update_time: Tuesday, June 2, 2020 3:21:27 PM
              child_objects: []
  check_points_and_outputs: []
  parameters: []
