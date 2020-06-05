namespace: AOS_UFT
operation:
  name: First_UFT_RPA
  inputs:
    - username_a
    - password
    - first_name
    - last_name
    - email
    - url
  sequential_action:
    gav: 'com.microfocus.seq:AOS_UFT.First_UFT_RPA:1.0.0'
    skills:
      - Web
    settings:
      windows:
        active: false
      web:
        active: true
        address: google.com
        browser: FIREFOX64
        close_on_exit: true
    steps:
      - step:
          id: '1'
          object_path: 'Browser("Google").Page("Google")'
          action: Sync
      - step:
          id: '2'
          object_path: 'Browser("Google")'
          action: Navigate
          default_args: '"http://localhost:8080/"'
          snapshot: ".\\Snapshots\\ssf1.png"
          highlight_id: '66644'
          args: 'Parameter("url")'
      - step:
          id: '3'
          object_path: 'Browser("Google").Page("Advantage Shopping").Link("UserMenu")'
          action: Click
          snapshot: ".\\Snapshots\\ssf2.html"
          highlight_id: '10000000'
      - step:
          id: '4'
          object_path: 'Browser("Google").Page("Advantage Shopping").Link("CREATE NEW ACCOUNT")'
          action: Click
          snapshot: ".\\Snapshots\\ssf3.html"
          highlight_id: '10000000'
      - step:
          id: '5'
          object_path: 'Browser("Google").Page("Advantage Shopping").WebEdit("usernameRegisterPage")'
          action: Set
          default_args: '"rameshn"'
          snapshot: ".\\Snapshots\\ssf4.html"
          highlight_id: '10000000'
          args: 'Parameter("username_a")'
      - step:
          id: '6'
          object_path: 'Browser("Google").Page("Advantage Shopping").WebEdit("emailRegisterPage")'
          action: Set
          default_args: '"ramesh.nagarajan@microfocus.com"'
          snapshot: ".\\Snapshots\\ssf5.html"
          highlight_id: '10000000'
          args: 'Parameter("email")'
      - step:
          id: '7'
          object_path: 'Browser("Google").Page("Advantage Shopping").WebEdit("passwordRegisterPage")'
          action: SetSecure
          default_args: '"Password1"'
          snapshot: ".\\Snapshots\\ssf6.html"
          highlight_id: '10000000'
          args: 'Parameter("password")'
      - step:
          id: '8'
          object_path: 'Browser("Google").Page("Advantage Shopping").WebEdit("confirm_passwordRegisterPage")'
          action: SetSecure
          default_args: '"Password1"'
          snapshot: ".\\Snapshots\\ssf7.html"
          highlight_id: '10000000'
          args: 'Parameter("password")'
      - step:
          id: '9'
          object_path: 'Browser("Google").Page("Advantage Shopping").WebEdit("first_nameRegisterPage")'
          action: Set
          default_args: '"Ramesh"'
          snapshot: ".\\Snapshots\\ssf8.html"
          highlight_id: '10000000'
          args: 'Parameter("first_name")'
      - step:
          id: '10'
          object_path: 'Browser("Google").Page("Advantage Shopping").WebEdit("last_nameRegisterPage")'
          action: Set
          default_args: '"Nagarajan"'
          snapshot: ".\\Snapshots\\ssf9.html"
          highlight_id: '10000000'
          args: 'Parameter("last_name")'
      - step:
          id: '11'
          object_path: 'Browser("Google").Page("Advantage Shopping").WebCheckBox("i_agree")'
          action: Set
          default_args: '"ON"'
          snapshot: ".\\Snapshots\\ssf10.html"
          highlight_id: '10000000'
      - step:
          id: '12'
          object_path: 'Browser("Google").Page("Advantage Shopping").WebCheckBox("allowOffersPromotion")'
          action: Set
          default_args: '"OFF"'
          snapshot: ".\\Snapshots\\ssf11.html"
          highlight_id: '10000000'
      - step:
          id: '13'
          object_path: 'Browser("Google").Page("Advantage Shopping").WebButton("register_btnundefined")'
          action: Click
          snapshot: ".\\Snapshots\\ssf12.html"
          highlight_id: '10000000'
      - step:
          id: '14'
          object_path: 'Browser("Google").Page("Advantage Shopping").Link("UserMenu_2")'
          action: Click
          snapshot: ".\\Snapshots\\ssf13.html"
          highlight_id: '10000000'
      - step:
          id: '15'
          object_path: 'Browser("Google").Page("Advantage Shopping").Link("Sign out")'
          action: Click
          snapshot: ".\\Snapshots\\ssf14.html"
          highlight_id: '10000000'
  outputs:
    - return_result: '${return_result}'
    - error_message: '${error_message}'
  results:
    - SUCCESS
    - WARNING
    - FAILURE
object_repository:
  objects:
    - object:
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
              - openedbytestingtool
              - number of tabs
          algorithm: Mercury.TolerantPriority
          active: true
        name: Google
        child_objects:
          - object:
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
              name: Google
              child_objects: []
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
                      value: 'https://www.google.com/'
                      regular_expression: false
                    name: url without form data
                    hidden: true
                    read_only: true
                    type: STRING
                - property:
                    value:
                      value: 'https://www.google.com/?gws_rd=ssl'
                      regular_expression: false
                    name: url
                    hidden: true
                    read_only: true
                    type: STRING
                - property:
                    value:
                      value: Google
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
                      value: ''
                      regular_expression: false
                    name: index
                    hidden: true
                    read_only: true
                    type: STRING
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
                      value: ''
                      regular_expression: false
                    name: document size
                    hidden: true
                    read_only: true
                    type: STRING
                - property:
                    value:
                      value: ''
                      regular_expression: false
                    name: all data in get method
                    hidden: true
                    read_only: true
                    type: STRING
              comments: ''
              custom_replay: ''
              class: Page
              visual_relations: ''
              last_update_time: 'Wednesday, June 3, 2020 5:48:04 PM'
              basic_identification:
                property_ref:
                  - micclass
                ordinal_identifier: ''
          - object:
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
              name: Advantage Shopping
              child_objects:
                - object:
                    smart_identification:
                      base_filter:
                        property_ref:
                          - micclass
                          - type
                          - html tag
                      optional_filter:
                        property_ref:
                          - name
                          - html id
                          - max length
                          - default value
                          - class
                          - rows
                          - placeholder
                          - acc_name
                      algorithm: Mercury.TolerantPriority
                      active: true
                    name: usernameRegisterPage
                    child_objects: []
                    properties:
                      - property:
                          value:
                            value: WebEdit
                            regular_expression: false
                          name: micclass
                          hidden: true
                          read_only: true
                          type: STRING
                      - property:
                          value:
                            value: '//SEC-VIEW/DIV[normalize-space()="*Username"]/INPUT[1]'
                            regular_expression: false
                          name: _xpath
                          hidden: true
                          read_only: true
                          type: STRING
                      - property:
                          value:
                            value: '326'
                            regular_expression: false
                          name: width
                          hidden: true
                          read_only: true
                          type: NUMBER
                      - property:
                          value:
                            value: '302'
                            regular_expression: false
                          name: view_y
                          hidden: true
                          read_only: true
                          type: NUMBER
                      - property:
                          value:
                            value: '319'
                            regular_expression: false
                          name: view_x
                          hidden: true
                          read_only: true
                          type: NUMBER
                      - property:
                          value:
                            value: text
                            regular_expression: false
                          name: type
                          hidden: false
                          read_only: false
                          type: STRING
                      - property:
                          value:
                            value: '0'
                            regular_expression: false
                          name: rows
                          hidden: true
                          read_only: true
                          type: NUMBER
                      - property:
                          value:
                            value: ''
                            regular_expression: false
                          name: placeholder
                          hidden: true
                          read_only: true
                          type: STRING
                      - property:
                          value:
                            value: usernameRegisterPage
                            regular_expression: false
                          name: name
                          hidden: false
                          read_only: false
                          type: STRING
                      - property:
                          value:
                            value: '524288'
                            regular_expression: false
                          name: max length
                          hidden: true
                          read_only: true
                          type: NUMBER
                      - property:
                          value:
                            value: INPUT
                            regular_expression: false
                          name: html tag
                          hidden: false
                          read_only: false
                          type: STRING
                      - property:
                          value:
                            value: ''
                            regular_expression: false
                          name: html id
                          hidden: true
                          read_only: true
                          type: STRING
                      - property:
                          value:
                            value: '26'
                            regular_expression: false
                          name: height
                          hidden: true
                          read_only: true
                          type: NUMBER
                      - property:
                          value:
                            value: ''
                            regular_expression: false
                          name: default value
                          hidden: true
                          read_only: true
                          type: STRING
                      - property:
                          value:
                            value: ng-untouched ng-valid ng-scope in-focus ng-dirty ng-valid-parse
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
                      - property:
                          value:
                            value: '376'
                            regular_expression: false
                          name: abs_y
                          hidden: true
                          read_only: true
                          type: NUMBER
                      - property:
                          value:
                            value: '965'
                            regular_expression: false
                          name: abs_x
                          hidden: true
                          read_only: true
                          type: NUMBER
                    comments: ''
                    custom_replay: ''
                    class: WebEdit
                    visual_relations: ''
                    last_update_time: 'Wednesday, June 3, 2020 5:48:04 PM'
                    basic_identification:
                      property_ref:
                        - micclass
                        - _xpath
                        - type
                        - name
                        - html tag
                      ordinal_identifier: ''
                - object:
                    smart_identification:
                      base_filter:
                        property_ref:
                          - micclass
                          - type
                          - html tag
                      optional_filter:
                        property_ref:
                          - name
                          - html id
                          - max length
                          - default value
                          - class
                          - rows
                          - placeholder
                          - acc_name
                      algorithm: Mercury.TolerantPriority
                      active: true
                    name: passwordRegisterPage
                    child_objects: []
                    properties:
                      - property:
                          value:
                            value: WebEdit
                            regular_expression: false
                          name: micclass
                          hidden: true
                          read_only: true
                          type: STRING
                      - property:
                          value:
                            value: '//SEC-VIEW/DIV[normalize-space()="*Password"]/INPUT[1]'
                            regular_expression: false
                          name: _xpath
                          hidden: true
                          read_only: true
                          type: STRING
                      - property:
                          value:
                            value: '326'
                            regular_expression: false
                          name: width
                          hidden: true
                          read_only: true
                          type: NUMBER
                      - property:
                          value:
                            value: '360'
                            regular_expression: false
                          name: view_y
                          hidden: true
                          read_only: true
                          type: NUMBER
                      - property:
                          value:
                            value: '319'
                            regular_expression: false
                          name: view_x
                          hidden: true
                          read_only: true
                          type: NUMBER
                      - property:
                          value:
                            value: password
                            regular_expression: false
                          name: type
                          hidden: false
                          read_only: false
                          type: STRING
                      - property:
                          value:
                            value: '0'
                            regular_expression: false
                          name: rows
                          hidden: true
                          read_only: true
                          type: NUMBER
                      - property:
                          value:
                            value: ''
                            regular_expression: false
                          name: placeholder
                          hidden: true
                          read_only: true
                          type: STRING
                      - property:
                          value:
                            value: passwordRegisterPage
                            regular_expression: false
                          name: name
                          hidden: false
                          read_only: false
                          type: STRING
                      - property:
                          value:
                            value: '524288'
                            regular_expression: false
                          name: max length
                          hidden: true
                          read_only: true
                          type: NUMBER
                      - property:
                          value:
                            value: INPUT
                            regular_expression: false
                          name: html tag
                          hidden: false
                          read_only: false
                          type: STRING
                      - property:
                          value:
                            value: ''
                            regular_expression: false
                          name: html id
                          hidden: true
                          read_only: true
                          type: STRING
                      - property:
                          value:
                            value: '26'
                            regular_expression: false
                          name: height
                          hidden: true
                          read_only: true
                          type: NUMBER
                      - property:
                          value:
                            value: ''
                            regular_expression: false
                          name: default value
                          hidden: true
                          read_only: true
                          type: STRING
                      - property:
                          value:
                            value: ng-untouched ng-valid ng-scope in-focus ng-dirty ng-valid-parse
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
                      - property:
                          value:
                            value: '434'
                            regular_expression: false
                          name: abs_y
                          hidden: true
                          read_only: true
                          type: NUMBER
                      - property:
                          value:
                            value: '965'
                            regular_expression: false
                          name: abs_x
                          hidden: true
                          read_only: true
                          type: NUMBER
                    comments: ''
                    custom_replay: ''
                    class: WebEdit
                    visual_relations: ''
                    last_update_time: 'Wednesday, June 3, 2020 5:48:04 PM'
                    basic_identification:
                      property_ref:
                        - micclass
                        - _xpath
                        - type
                        - name
                        - html tag
                      ordinal_identifier: ''
                - object:
                    smart_identification:
                      base_filter:
                        property_ref:
                          - micclass
                          - type
                          - html tag
                      optional_filter:
                        property_ref:
                          - name
                          - html id
                          - max length
                          - default value
                          - class
                          - rows
                          - placeholder
                          - acc_name
                      algorithm: Mercury.TolerantPriority
                      active: true
                    name: last_nameRegisterPage
                    child_objects: []
                    properties:
                      - property:
                          value:
                            value: WebEdit
                            regular_expression: false
                          name: micclass
                          hidden: true
                          read_only: true
                          type: STRING
                      - property:
                          value:
                            value: '//SEC-VIEW/DIV[normalize-space()="Last Name"]/INPUT[1]'
                            regular_expression: false
                          name: _xpath
                          hidden: true
                          read_only: true
                          type: STRING
                      - property:
                          value:
                            value: '326'
                            regular_expression: false
                          name: width
                          hidden: true
                          read_only: true
                          type: NUMBER
                      - property:
                          value:
                            value: '63'
                            regular_expression: false
                          name: view_y
                          hidden: true
                          read_only: true
                          type: NUMBER
                      - property:
                          value:
                            value: '729'
                            regular_expression: false
                          name: view_x
                          hidden: true
                          read_only: true
                          type: NUMBER
                      - property:
                          value:
                            value: text
                            regular_expression: false
                          name: type
                          hidden: false
                          read_only: false
                          type: STRING
                      - property:
                          value:
                            value: '0'
                            regular_expression: false
                          name: rows
                          hidden: true
                          read_only: true
                          type: NUMBER
                      - property:
                          value:
                            value: ''
                            regular_expression: false
                          name: placeholder
                          hidden: true
                          read_only: true
                          type: STRING
                      - property:
                          value:
                            value: last_nameRegisterPage
                            regular_expression: false
                          name: name
                          hidden: false
                          read_only: false
                          type: STRING
                      - property:
                          value:
                            value: '524288'
                            regular_expression: false
                          name: max length
                          hidden: true
                          read_only: true
                          type: NUMBER
                      - property:
                          value:
                            value: INPUT
                            regular_expression: false
                          name: html tag
                          hidden: false
                          read_only: false
                          type: STRING
                      - property:
                          value:
                            value: ''
                            regular_expression: false
                          name: html id
                          hidden: true
                          read_only: true
                          type: STRING
                      - property:
                          value:
                            value: '26'
                            regular_expression: false
                          name: height
                          hidden: true
                          read_only: true
                          type: NUMBER
                      - property:
                          value:
                            value: ''
                            regular_expression: false
                          name: default value
                          hidden: true
                          read_only: true
                          type: STRING
                      - property:
                          value:
                            value: ng-untouched ng-valid ng-scope in-focus ng-dirty ng-valid-parse
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
                      - property:
                          value:
                            value: '137'
                            regular_expression: false
                          name: abs_y
                          hidden: true
                          read_only: true
                          type: NUMBER
                      - property:
                          value:
                            value: '1375'
                            regular_expression: false
                          name: abs_x
                          hidden: true
                          read_only: true
                          type: NUMBER
                    comments: ''
                    custom_replay: ''
                    class: WebEdit
                    visual_relations: ''
                    last_update_time: 'Wednesday, June 3, 2020 5:48:04 PM'
                    basic_identification:
                      property_ref:
                        - micclass
                        - _xpath
                        - type
                        - name
                        - html tag
                      ordinal_identifier: ''
                - object:
                    smart_identification:
                      base_filter:
                        property_ref:
                          - micclass
                          - type
                          - html tag
                      optional_filter:
                        property_ref:
                          - name
                          - html id
                          - max length
                          - default value
                          - class
                          - rows
                          - placeholder
                          - acc_name
                      algorithm: Mercury.TolerantPriority
                      active: true
                    name: first_nameRegisterPage
                    child_objects: []
                    properties:
                      - property:
                          value:
                            value: WebEdit
                            regular_expression: false
                          name: micclass
                          hidden: true
                          read_only: true
                          type: STRING
                      - property:
                          value:
                            value: '//SEC-VIEW/DIV[normalize-space()="First Name"]/INPUT[1]'
                            regular_expression: false
                          name: _xpath
                          hidden: true
                          read_only: true
                          type: STRING
                      - property:
                          value:
                            value: '326'
                            regular_expression: false
                          name: width
                          hidden: true
                          read_only: true
                          type: NUMBER
                      - property:
                          value:
                            value: '509'
                            regular_expression: false
                          name: view_y
                          hidden: true
                          read_only: true
                          type: NUMBER
                      - property:
                          value:
                            value: '319'
                            regular_expression: false
                          name: view_x
                          hidden: true
                          read_only: true
                          type: NUMBER
                      - property:
                          value:
                            value: text
                            regular_expression: false
                          name: type
                          hidden: false
                          read_only: false
                          type: STRING
                      - property:
                          value:
                            value: '0'
                            regular_expression: false
                          name: rows
                          hidden: true
                          read_only: true
                          type: NUMBER
                      - property:
                          value:
                            value: ''
                            regular_expression: false
                          name: placeholder
                          hidden: true
                          read_only: true
                          type: STRING
                      - property:
                          value:
                            value: first_nameRegisterPage
                            regular_expression: false
                          name: name
                          hidden: false
                          read_only: false
                          type: STRING
                      - property:
                          value:
                            value: '524288'
                            regular_expression: false
                          name: max length
                          hidden: true
                          read_only: true
                          type: NUMBER
                      - property:
                          value:
                            value: INPUT
                            regular_expression: false
                          name: html tag
                          hidden: false
                          read_only: false
                          type: STRING
                      - property:
                          value:
                            value: ''
                            regular_expression: false
                          name: html id
                          hidden: true
                          read_only: true
                          type: STRING
                      - property:
                          value:
                            value: '26'
                            regular_expression: false
                          name: height
                          hidden: true
                          read_only: true
                          type: NUMBER
                      - property:
                          value:
                            value: ''
                            regular_expression: false
                          name: default value
                          hidden: true
                          read_only: true
                          type: STRING
                      - property:
                          value:
                            value: ng-untouched ng-valid ng-scope in-focus ng-dirty ng-valid-parse
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
                      - property:
                          value:
                            value: '583'
                            regular_expression: false
                          name: abs_y
                          hidden: true
                          read_only: true
                          type: NUMBER
                      - property:
                          value:
                            value: '965'
                            regular_expression: false
                          name: abs_x
                          hidden: true
                          read_only: true
                          type: NUMBER
                    comments: ''
                    custom_replay: ''
                    class: WebEdit
                    visual_relations: ''
                    last_update_time: 'Wednesday, June 3, 2020 5:48:04 PM'
                    basic_identification:
                      property_ref:
                        - micclass
                        - _xpath
                        - type
                        - name
                        - html tag
                      ordinal_identifier: ''
                - object:
                    smart_identification:
                      base_filter:
                        property_ref:
                          - micclass
                          - type
                          - html tag
                      optional_filter:
                        property_ref:
                          - name
                          - html id
                          - max length
                          - default value
                          - class
                          - rows
                          - placeholder
                          - acc_name
                      algorithm: Mercury.TolerantPriority
                      active: true
                    name: emailRegisterPage
                    child_objects: []
                    properties:
                      - property:
                          value:
                            value: WebEdit
                            regular_expression: false
                          name: micclass
                          hidden: true
                          read_only: true
                          type: STRING
                      - property:
                          value:
                            value: '//SEC-VIEW/DIV[normalize-space()="*Email"]/INPUT[1]'
                            regular_expression: false
                          name: _xpath
                          hidden: true
                          read_only: true
                          type: STRING
                      - property:
                          value:
                            value: '326'
                            regular_expression: false
                          name: width
                          hidden: true
                          read_only: true
                          type: NUMBER
                      - property:
                          value:
                            value: '302'
                            regular_expression: false
                          name: view_y
                          hidden: true
                          read_only: true
                          type: NUMBER
                      - property:
                          value:
                            value: '729'
                            regular_expression: false
                          name: view_x
                          hidden: true
                          read_only: true
                          type: NUMBER
                      - property:
                          value:
                            value: text
                            regular_expression: false
                          name: type
                          hidden: false
                          read_only: false
                          type: STRING
                      - property:
                          value:
                            value: '0'
                            regular_expression: false
                          name: rows
                          hidden: true
                          read_only: true
                          type: NUMBER
                      - property:
                          value:
                            value: ''
                            regular_expression: false
                          name: placeholder
                          hidden: true
                          read_only: true
                          type: STRING
                      - property:
                          value:
                            value: emailRegisterPage
                            regular_expression: false
                          name: name
                          hidden: false
                          read_only: false
                          type: STRING
                      - property:
                          value:
                            value: '524288'
                            regular_expression: false
                          name: max length
                          hidden: true
                          read_only: true
                          type: NUMBER
                      - property:
                          value:
                            value: INPUT
                            regular_expression: false
                          name: html tag
                          hidden: false
                          read_only: false
                          type: STRING
                      - property:
                          value:
                            value: ''
                            regular_expression: false
                          name: html id
                          hidden: true
                          read_only: true
                          type: STRING
                      - property:
                          value:
                            value: '26'
                            regular_expression: false
                          name: height
                          hidden: true
                          read_only: true
                          type: NUMBER
                      - property:
                          value:
                            value: ''
                            regular_expression: false
                          name: default value
                          hidden: true
                          read_only: true
                          type: STRING
                      - property:
                          value:
                            value: ng-untouched ng-valid ng-scope in-focus ng-dirty ng-valid-parse
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
                      - property:
                          value:
                            value: '376'
                            regular_expression: false
                          name: abs_y
                          hidden: true
                          read_only: true
                          type: NUMBER
                      - property:
                          value:
                            value: '1375'
                            regular_expression: false
                          name: abs_x
                          hidden: true
                          read_only: true
                          type: NUMBER
                    comments: ''
                    custom_replay: ''
                    class: WebEdit
                    visual_relations: ''
                    last_update_time: 'Wednesday, June 3, 2020 5:48:04 PM'
                    basic_identification:
                      property_ref:
                        - micclass
                        - _xpath
                        - type
                        - name
                        - html tag
                      ordinal_identifier: ''
                - object:
                    smart_identification:
                      base_filter:
                        property_ref:
                          - micclass
                          - type
                          - html tag
                      optional_filter:
                        property_ref:
                          - name
                          - html id
                          - max length
                          - default value
                          - class
                          - rows
                          - placeholder
                          - acc_name
                      algorithm: Mercury.TolerantPriority
                      active: true
                    name: confirm_passwordRegisterPage
                    child_objects: []
                    properties:
                      - property:
                          value:
                            value: WebEdit
                            regular_expression: false
                          name: micclass
                          hidden: true
                          read_only: true
                          type: STRING
                      - property:
                          value:
                            value: '//SEC-VIEW/DIV[normalize-space()="*Confirm password"]/INPUT[1]'
                            regular_expression: false
                          name: _xpath
                          hidden: true
                          read_only: true
                          type: STRING
                      - property:
                          value:
                            value: '326'
                            regular_expression: false
                          name: width
                          hidden: true
                          read_only: true
                          type: NUMBER
                      - property:
                          value:
                            value: '360'
                            regular_expression: false
                          name: view_y
                          hidden: true
                          read_only: true
                          type: NUMBER
                      - property:
                          value:
                            value: '729'
                            regular_expression: false
                          name: view_x
                          hidden: true
                          read_only: true
                          type: NUMBER
                      - property:
                          value:
                            value: password
                            regular_expression: false
                          name: type
                          hidden: false
                          read_only: false
                          type: STRING
                      - property:
                          value:
                            value: '0'
                            regular_expression: false
                          name: rows
                          hidden: true
                          read_only: true
                          type: NUMBER
                      - property:
                          value:
                            value: ''
                            regular_expression: false
                          name: placeholder
                          hidden: true
                          read_only: true
                          type: STRING
                      - property:
                          value:
                            value: confirm_passwordRegisterPage
                            regular_expression: false
                          name: name
                          hidden: false
                          read_only: false
                          type: STRING
                      - property:
                          value:
                            value: '524288'
                            regular_expression: false
                          name: max length
                          hidden: true
                          read_only: true
                          type: NUMBER
                      - property:
                          value:
                            value: INPUT
                            regular_expression: false
                          name: html tag
                          hidden: false
                          read_only: false
                          type: STRING
                      - property:
                          value:
                            value: ''
                            regular_expression: false
                          name: html id
                          hidden: true
                          read_only: true
                          type: STRING
                      - property:
                          value:
                            value: '26'
                            regular_expression: false
                          name: height
                          hidden: true
                          read_only: true
                          type: NUMBER
                      - property:
                          value:
                            value: ''
                            regular_expression: false
                          name: default value
                          hidden: true
                          read_only: true
                          type: STRING
                      - property:
                          value:
                            value: ng-untouched ng-valid ng-scope in-focus ng-dirty ng-valid-parse
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
                      - property:
                          value:
                            value: '434'
                            regular_expression: false
                          name: abs_y
                          hidden: true
                          read_only: true
                          type: NUMBER
                      - property:
                          value:
                            value: '1375'
                            regular_expression: false
                          name: abs_x
                          hidden: true
                          read_only: true
                          type: NUMBER
                    comments: ''
                    custom_replay: ''
                    class: WebEdit
                    visual_relations: ''
                    last_update_time: 'Wednesday, June 3, 2020 5:48:04 PM'
                    basic_identification:
                      property_ref:
                        - micclass
                        - _xpath
                        - type
                        - name
                        - html tag
                      ordinal_identifier: ''
                - object:
                    smart_identification:
                      base_filter:
                        property_ref:
                          - micclass
                          - html tag
                      optional_filter:
                        property_ref:
                          - name
                          - type
                          - html id
                          - value
                          - class
                          - visible
                      algorithm: Mercury.TolerantPriority
                      active: true
                    name: i_agree
                    child_objects: []
                    properties:
                      - property:
                          value:
                            value: WebCheckBox
                            regular_expression: false
                          name: micclass
                          hidden: true
                          read_only: true
                          type: STRING
                      - property:
                          value:
                            value: '//DIV[@id="formCover"]/SEC-VIEW[1]/DIV[1]/INPUT[1]'
                            regular_expression: false
                          name: _xpath
                          hidden: true
                          read_only: true
                          type: STRING
                      - property:
                          value:
                            value: '16'
                            regular_expression: false
                          name: width
                          hidden: true
                          read_only: true
                          type: NUMBER
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
                            value: '518'
                            regular_expression: false
                          name: view_y
                          hidden: true
                          read_only: true
                          type: NUMBER
                      - property:
                          value:
                            value: '319'
                            regular_expression: false
                          name: view_x
                          hidden: true
                          read_only: true
                          type: NUMBER
                      - property:
                          value:
                            value: 'on'
                            regular_expression: false
                          name: value
                          hidden: true
                          read_only: true
                          type: STRING
                      - property:
                          value:
                            value: checkbox
                            regular_expression: false
                          name: type
                          hidden: false
                          read_only: false
                          type: STRING
                      - property:
                          value:
                            value: i_agree
                            regular_expression: false
                          name: name
                          hidden: false
                          read_only: false
                          type: STRING
                      - property:
                          value:
                            value: INPUT
                            regular_expression: false
                          name: html tag
                          hidden: false
                          read_only: false
                          type: STRING
                      - property:
                          value:
                            value: ''
                            regular_expression: false
                          name: html id
                          hidden: true
                          read_only: true
                          type: STRING
                      - property:
                          value:
                            value: '17'
                            regular_expression: false
                          name: height
                          hidden: true
                          read_only: true
                          type: NUMBER
                      - property:
                          value:
                            value: ng-pristine ng-untouched ng-valid ng-scope in-focus
                            regular_expression: false
                          name: class
                          hidden: true
                          read_only: true
                          type: STRING
                      - property:
                          value:
                            value: '592'
                            regular_expression: false
                          name: abs_y
                          hidden: true
                          read_only: true
                          type: NUMBER
                      - property:
                          value:
                            value: '965'
                            regular_expression: false
                          name: abs_x
                          hidden: true
                          read_only: true
                          type: NUMBER
                    comments: ''
                    custom_replay: ''
                    class: WebCheckBox
                    visual_relations: ''
                    last_update_time: 'Wednesday, June 3, 2020 5:48:04 PM'
                    basic_identification:
                      property_ref:
                        - micclass
                        - _xpath
                        - type
                        - name
                        - html tag
                      ordinal_identifier: ''
                - object:
                    smart_identification:
                      base_filter:
                        property_ref:
                          - micclass
                          - html tag
                      optional_filter:
                        property_ref:
                          - name
                          - type
                          - html id
                          - value
                          - class
                          - visible
                      algorithm: Mercury.TolerantPriority
                      active: true
                    name: allowOffersPromotion
                    child_objects: []
                    properties:
                      - property:
                          value:
                            value: WebCheckBox
                            regular_expression: false
                          name: micclass
                          hidden: true
                          read_only: true
                          type: STRING
                      - property:
                          value:
                            value: '//DIV[@id="formCover"]/DIV[4]/INPUT[1]'
                            regular_expression: false
                          name: _xpath
                          hidden: true
                          read_only: true
                          type: STRING
                      - property:
                          value:
                            value: '16'
                            regular_expression: false
                          name: width
                          hidden: true
                          read_only: true
                          type: NUMBER
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
                            value: '481'
                            regular_expression: false
                          name: view_y
                          hidden: true
                          read_only: true
                          type: NUMBER
                      - property:
                          value:
                            value: '319'
                            regular_expression: false
                          name: view_x
                          hidden: true
                          read_only: true
                          type: NUMBER
                      - property:
                          value:
                            value: 'on'
                            regular_expression: false
                          name: value
                          hidden: true
                          read_only: true
                          type: STRING
                      - property:
                          value:
                            value: checkbox
                            regular_expression: false
                          name: type
                          hidden: false
                          read_only: false
                          type: STRING
                      - property:
                          value:
                            value: allowOffersPromotion
                            regular_expression: false
                          name: name
                          hidden: false
                          read_only: false
                          type: STRING
                      - property:
                          value:
                            value: INPUT
                            regular_expression: false
                          name: html tag
                          hidden: false
                          read_only: false
                          type: STRING
                      - property:
                          value:
                            value: ''
                            regular_expression: false
                          name: html id
                          hidden: true
                          read_only: true
                          type: STRING
                      - property:
                          value:
                            value: '16'
                            regular_expression: false
                          name: height
                          hidden: true
                          read_only: true
                          type: NUMBER
                      - property:
                          value:
                            value: ng-pristine ng-untouched ng-valid
                            regular_expression: false
                          name: class
                          hidden: true
                          read_only: true
                          type: STRING
                      - property:
                          value:
                            value: '555'
                            regular_expression: false
                          name: abs_y
                          hidden: true
                          read_only: true
                          type: NUMBER
                      - property:
                          value:
                            value: '965'
                            regular_expression: false
                          name: abs_x
                          hidden: true
                          read_only: true
                          type: NUMBER
                    comments: ''
                    custom_replay: ''
                    class: WebCheckBox
                    visual_relations: ''
                    last_update_time: 'Wednesday, June 3, 2020 5:48:04 PM'
                    basic_identification:
                      property_ref:
                        - micclass
                        - _xpath
                        - type
                        - name
                        - html tag
                      ordinal_identifier: ''
                - object:
                    smart_identification:
                      base_filter:
                        property_ref:
                          - micclass
                          - html tag
                      optional_filter:
                        property_ref:
                          - name
                          - type
                          - html id
                          - value
                          - class
                          - visible
                          - acc_name
                      algorithm: Mercury.TolerantPriority
                      active: true
                    name: register_btnundefined
                    child_objects: []
                    properties:
                      - property:
                          value:
                            value: WebButton
                            regular_expression: false
                          name: micclass
                          hidden: true
                          read_only: true
                          type: STRING
                      - property:
                          value:
                            value: '//BUTTON[@id="register_btnundefined"]'
                            regular_expression: false
                          name: _xpath
                          hidden: true
                          read_only: true
                          type: STRING
                      - property:
                          value:
                            value: '330'
                            regular_expression: false
                          name: width
                          hidden: true
                          read_only: true
                          type: NUMBER
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
                            value: '595'
                            regular_expression: false
                          name: view_y
                          hidden: true
                          read_only: true
                          type: NUMBER
                      - property:
                          value:
                            value: '461'
                            regular_expression: false
                          name: view_x
                          hidden: true
                          read_only: true
                          type: NUMBER
                      - property:
                          value:
                            value: REGISTER
                            regular_expression: false
                          name: value
                          hidden: true
                          read_only: true
                          type: STRING
                      - property:
                          value:
                            value: button
                            regular_expression: false
                          name: type
                          hidden: false
                          read_only: false
                          type: STRING
                      - property:
                          value:
                            value: REGISTER
                            regular_expression: false
                          name: name
                          hidden: false
                          read_only: false
                          type: STRING
                      - property:
                          value:
                            value: BUTTON
                            regular_expression: false
                          name: html tag
                          hidden: false
                          read_only: false
                          type: STRING
                      - property:
                          value:
                            value: register_btnundefined
                            regular_expression: false
                          name: html id
                          hidden: true
                          read_only: true
                          type: STRING
                      - property:
                          value:
                            value: '42'
                            regular_expression: false
                          name: height
                          hidden: true
                          read_only: true
                          type: NUMBER
                      - property:
                          value:
                            value: sec-sender-a ng-scope
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
                      - property:
                          value:
                            value: '669'
                            regular_expression: false
                          name: abs_y
                          hidden: true
                          read_only: true
                          type: NUMBER
                      - property:
                          value:
                            value: '1107'
                            regular_expression: false
                          name: abs_x
                          hidden: true
                          read_only: true
                          type: NUMBER
                    comments: ''
                    custom_replay: ''
                    class: WebButton
                    visual_relations: ''
                    last_update_time: 'Wednesday, June 3, 2020 5:48:04 PM'
                    basic_identification:
                      property_ref:
                        - micclass
                        - _xpath
                        - type
                        - name
                        - html tag
                      ordinal_identifier: ''
                - object:
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
                          - name
                          - href
                          - visible
                          - acc_name
                      algorithm: Mercury.TolerantPriority
                      active: true
                    name: UserMenu_2
                    child_objects: []
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
                            value: '//A[@id="menuUserLink"]'
                            regular_expression: false
                          name: _xpath
                          hidden: true
                          read_only: true
                          type: STRING
                      - property:
                          value:
                            value: '117'
                            regular_expression: false
                          name: width
                          hidden: true
                          read_only: true
                          type: NUMBER
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
                            value: '11'
                            regular_expression: false
                          name: view_y
                          hidden: true
                          read_only: true
                          type: NUMBER
                      - property:
                          value:
                            value: '1012'
                            regular_expression: false
                          name: view_x
                          hidden: true
                          read_only: true
                          type: NUMBER
                      - property:
                          value:
                            value: rameshn My account My orders Sign out
                            regular_expression: false
                          name: text
                          hidden: true
                          read_only: true
                          type: STRING
                      - property:
                          value:
                            value: rameshn My account My orders Sign out
                            regular_expression: false
                          name: name
                          hidden: true
                          read_only: true
                          type: STRING
                      - property:
                          value:
                            value: A
                            regular_expression: false
                          name: html tag
                          hidden: false
                          read_only: false
                          type: STRING
                      - property:
                          value:
                            value: menuUserLink
                            regular_expression: false
                          name: html id
                          hidden: false
                          read_only: false
                          type: STRING
                      - property:
                          value:
                            value: 'javascript:void(0)'
                            regular_expression: false
                          name: href
                          hidden: true
                          read_only: true
                          type: STRING
                      - property:
                          value:
                            value: '47'
                            regular_expression: false
                          name: height
                          hidden: true
                          read_only: true
                          type: NUMBER
                      - property:
                          value:
                            value: img
                            regular_expression: false
                          name: class
                          hidden: true
                          read_only: true
                          type: STRING
                      - property:
                          value:
                            value: UserMenu
                            regular_expression: false
                          name: acc_name
                          hidden: true
                          read_only: true
                          type: STRING
                      - property:
                          value:
                            value: '85'
                            regular_expression: false
                          name: abs_y
                          hidden: true
                          read_only: true
                          type: NUMBER
                      - property:
                          value:
                            value: '1658'
                            regular_expression: false
                          name: abs_x
                          hidden: true
                          read_only: true
                          type: NUMBER
                    comments: ''
                    custom_replay: ''
                    class: Link
                    visual_relations: ''
                    last_update_time: 'Wednesday, June 3, 2020 5:48:04 PM'
                    basic_identification:
                      property_ref:
                        - micclass
                        - _xpath
                        - html tag
                        - html id
                      ordinal_identifier: ''
                - object:
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
                          - name
                          - href
                          - visible
                          - acc_name
                      algorithm: Mercury.TolerantPriority
                      active: true
                    name: UserMenu
                    child_objects: []
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
                            value: '//A[@id="menuUserLink"]'
                            regular_expression: false
                          name: _xpath
                          hidden: true
                          read_only: true
                          type: STRING
                      - property:
                          value:
                            value: '42'
                            regular_expression: false
                          name: width
                          hidden: true
                          read_only: true
                          type: NUMBER
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
                            value: '11'
                            regular_expression: false
                          name: view_y
                          hidden: true
                          read_only: true
                          type: NUMBER
                      - property:
                          value:
                            value: '1087'
                            regular_expression: false
                          name: view_x
                          hidden: true
                          read_only: true
                          type: NUMBER
                      - property:
                          value:
                            value: My account My orders Sign out
                            regular_expression: false
                          name: text
                          hidden: false
                          read_only: false
                          type: STRING
                      - property:
                          value:
                            value: My account My orders Sign out
                            regular_expression: false
                          name: name
                          hidden: true
                          read_only: true
                          type: STRING
                      - property:
                          value:
                            value: A
                            regular_expression: false
                          name: html tag
                          hidden: false
                          read_only: false
                          type: STRING
                      - property:
                          value:
                            value: menuUserLink
                            regular_expression: false
                          name: html id
                          hidden: true
                          read_only: true
                          type: STRING
                      - property:
                          value:
                            value: 'javascript:void(0)'
                            regular_expression: false
                          name: href
                          hidden: true
                          read_only: true
                          type: STRING
                      - property:
                          value:
                            value: '47'
                            regular_expression: false
                          name: height
                          hidden: true
                          read_only: true
                          type: NUMBER
                      - property:
                          value:
                            value: img
                            regular_expression: false
                          name: class
                          hidden: true
                          read_only: true
                          type: STRING
                      - property:
                          value:
                            value: UserMenu
                            regular_expression: false
                          name: acc_name
                          hidden: true
                          read_only: true
                          type: STRING
                      - property:
                          value:
                            value: '85'
                            regular_expression: false
                          name: abs_y
                          hidden: true
                          read_only: true
                          type: NUMBER
                      - property:
                          value:
                            value: '1733'
                            regular_expression: false
                          name: abs_x
                          hidden: true
                          read_only: true
                          type: NUMBER
                    comments: ''
                    custom_replay: ''
                    class: Link
                    visual_relations: ''
                    last_update_time: 'Wednesday, June 3, 2020 5:48:04 PM'
                    basic_identification:
                      property_ref:
                        - micclass
                        - _xpath
                        - text
                        - html tag
                      ordinal_identifier: ''
                - object:
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
                          - name
                          - href
                          - visible
                          - acc_name
                      algorithm: Mercury.TolerantPriority
                      active: true
                    name: Sign out
                    child_objects: []
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
                            value: '//DIV[@id="loginMiniTitle"]/LABEL[@role="link" and normalize-space()="Sign out"]'
                            regular_expression: false
                          name: _xpath
                          hidden: true
                          read_only: true
                          type: STRING
                      - property:
                          value:
                            value: '115'
                            regular_expression: false
                          name: width
                          hidden: true
                          read_only: true
                          type: NUMBER
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
                            value: '125'
                            regular_expression: false
                          name: view_y
                          hidden: true
                          read_only: true
                          type: NUMBER
                      - property:
                          value:
                            value: '1024'
                            regular_expression: false
                          name: view_x
                          hidden: true
                          read_only: true
                          type: NUMBER
                      - property:
                          value:
                            value: Sign out
                            regular_expression: false
                          name: text
                          hidden: false
                          read_only: false
                          type: STRING
                      - property:
                          value:
                            value: Sign out
                            regular_expression: false
                          name: name
                          hidden: true
                          read_only: true
                          type: STRING
                      - property:
                          value:
                            value: LABEL
                            regular_expression: false
                          name: html tag
                          hidden: false
                          read_only: false
                          type: STRING
                      - property:
                          value:
                            value: ''
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
                            value: '30'
                            regular_expression: false
                          name: height
                          hidden: true
                          read_only: true
                          type: NUMBER
                      - property:
                          value:
                            value: option roboto-medium ng-scope
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
                      - property:
                          value:
                            value: '199'
                            regular_expression: false
                          name: abs_y
                          hidden: true
                          read_only: true
                          type: NUMBER
                      - property:
                          value:
                            value: '1670'
                            regular_expression: false
                          name: abs_x
                          hidden: true
                          read_only: true
                          type: NUMBER
                    comments: ''
                    custom_replay: ''
                    class: Link
                    visual_relations: ''
                    last_update_time: 'Wednesday, June 3, 2020 5:48:04 PM'
                    basic_identification:
                      property_ref:
                        - micclass
                        - _xpath
                        - text
                        - html tag
                      ordinal_identifier: ''
                - object:
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
                          - name
                          - href
                          - visible
                          - acc_name
                      algorithm: Mercury.TolerantPriority
                      active: true
                    name: CREATE NEW ACCOUNT
                    child_objects: []
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
                            value: '//LOGIN-MODAL[1]/DIV[1]/DIV[1]/DIV[3]/A[@role="link"][2]'
                            regular_expression: false
                          name: _xpath
                          hidden: true
                          read_only: true
                          type: STRING
                      - property:
                          value:
                            value: '350'
                            regular_expression: false
                          name: width
                          hidden: true
                          read_only: true
                          type: NUMBER
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
                            value: '483'
                            regular_expression: false
                          name: view_y
                          hidden: true
                          read_only: true
                          type: NUMBER
                      - property:
                          value:
                            value: '451'
                            regular_expression: false
                          name: view_x
                          hidden: true
                          read_only: true
                          type: NUMBER
                      - property:
                          value:
                            value: CREATE NEW ACCOUNT
                            regular_expression: false
                          name: text
                          hidden: false
                          read_only: false
                          type: STRING
                      - property:
                          value:
                            value: CREATE NEW ACCOUNT
                            regular_expression: false
                          name: name
                          hidden: true
                          read_only: true
                          type: STRING
                      - property:
                          value:
                            value: A
                            regular_expression: false
                          name: html tag
                          hidden: false
                          read_only: false
                          type: STRING
                      - property:
                          value:
                            value: ''
                            regular_expression: false
                          name: html id
                          hidden: true
                          read_only: true
                          type: STRING
                      - property:
                          value:
                            value: 'javascript:void(0)'
                            regular_expression: false
                          name: href
                          hidden: true
                          read_only: true
                          type: STRING
                      - property:
                          value:
                            value: '22'
                            regular_expression: false
                          name: height
                          hidden: true
                          read_only: true
                          type: NUMBER
                      - property:
                          value:
                            value: create-new-account ng-scope
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
                      - property:
                          value:
                            value: '557'
                            regular_expression: false
                          name: abs_y
                          hidden: true
                          read_only: true
                          type: NUMBER
                      - property:
                          value:
                            value: '1097'
                            regular_expression: false
                          name: abs_x
                          hidden: true
                          read_only: true
                          type: NUMBER
                    comments: ''
                    custom_replay: ''
                    class: Link
                    visual_relations: ''
                    last_update_time: 'Wednesday, June 3, 2020 5:48:04 PM'
                    basic_identification:
                      property_ref:
                        - micclass
                        - _xpath
                        - text
                        - html tag
                      ordinal_identifier: ''
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
                      value: 'http://localhost:8080/#'
                      regular_expression: false
                    name: url without form data
                    hidden: true
                    read_only: true
                    type: STRING
                - property:
                    value:
                      value: 'http://localhost:8080/#'
                      regular_expression: false
                    name: url
                    hidden: true
                    read_only: true
                    type: STRING
                - property:
                    value:
                      value: "\_Advantage Shopping"
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
                      value: '10013'
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
                      value: ''
                      regular_expression: false
                    name: document size
                    hidden: true
                    read_only: true
                    type: STRING
                - property:
                    value:
                      value: ''
                      regular_expression: false
                    name: all data in get method
                    hidden: true
                    read_only: true
                    type: STRING
              comments: ''
              custom_replay: ''
              class: Page
              visual_relations: ''
              last_update_time: 'Wednesday, June 3, 2020 5:48:04 PM'
              basic_identification:
                property_ref:
                  - micclass
                ordinal_identifier: ''
        properties:
          - property:
              value:
                value: Google
                regular_expression: false
              name: title
              hidden: true
              read_only: true
              type: STRING
          - property:
              value:
                value: 'about:blank'
                regular_expression: false
              name: openurl
              hidden: true
              read_only: true
              type: STRING
          - property:
              value:
                value: ''
                regular_expression: false
              name: opentitle
              hidden: true
              read_only: true
              type: STRING
          - property:
              value:
                value: '-1'
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
                value: Google
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
                value: '1'
                regular_expression: false
              name: browserindex
              hidden: true
              read_only: true
              type: I2
        comments: ''
        custom_replay: ''
        class: Browser
        visual_relations: ''
        last_update_time: 'Wednesday, June 3, 2020 5:48:04 PM'
        basic_identification:
          property_ref:
            - micclass
          ordinal_identifier:
            value: 2
            type: creationtime
  check_points_and_outputs: []
  parameters: []
