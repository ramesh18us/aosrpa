namespace: AOS.Flows
flow:
  name: parse_json_message_flow
  workflow:
    - parse_json_message:
        do:
          AOS.parse_json_message:
            - json_string: |-
                ${'''
                    {
                        "@odata.etag": "W/CQAAABYAAABheQ7KwMzvS4oFgCBhLIn7AAB917kg",
                        "id": "AAMkAGZmMDcyNmZhLTIxNDMtNDViYS1hOGMxLTcxNmNiNTczZmY4ZABGAAAAAAAoHTw4bFOpT5xrx2riEMO0BwBheQ7KwMzvS4oFgCBhLIn7AAAAAAEMAABheQ7KwMzvS4oFgCBhLIn7AAB929siAAA=",
                        "subject": "FW: #VNRecord [ID]:73547/Friday, September 6, 2019/Arst.presales Arrived",
                        "body": {
                          "contentType": "html",
                          "content": "<html><head><style type='text/css' style='display:none'><!--p{margin-top:0;margin-bottom:0}--></style></head><body dir='ltr'><div style='font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12pt; color:rgb(0,0,0)'></div></body></html>"
                        },
                        "sender": {
                          "emailAddress": {
                            "name": "Petr Panuska",
                            "address": "petr.panuska@microfocus.com"
                          }
                        },
                        "from": {
                          "emailAddress": {
                            "name": "Petr Panuska",
                            "address": "petr.panuska@microfocus.com"
                          }
                        },
                        "toRecipients": [
                          {
                            "emailAddress": {
                              "name": "BCC1@microfocus.com",
                              "address": "BCC1@microfocus.com"
                            }
                          },
                          {
                            "emailAddress": {
                              "name": "BCC2@microfocus.com",
                              "address": "BCC2@microfocus.com"
                            }
                          }
                        ],
                        "hasAttachments": true
                    }
                '''}
        publish:
          - message_id
          - subject
          - content
          - content_type
          - sender_name
          - sender_email
          - recipient_name
          - recipient_email
          - has_attachments
        navigate:
          - SUCCESS: SUCCESS
  results:
    - SUCCESS
extensions:
  graph:
    steps:
      parse_json_message:
        x: 150
        'y': 190
        navigate:
          b2f94e6b-12e1-3759-8c73-d22d4a8efeff:
            targetId: aab5bd96-ec4b-08dd-462b-eb1255e68788
            port: SUCCESS
    results:
      SUCCESS:
        aab5bd96-ec4b-08dd-462b-eb1255e68788:
          x: 432
          'y': 191
