namespace: AOS
operation:
  name: parse_json_message
  inputs:
    - json_string
  python_action:
    use_jython: false
    script: "# do not remove the execute function \n#def execute(): \n    # code goes here\n# you can add additional helper methods below.\n\nimport json\ndef execute(json_string):\n  data = json.loads(json_string)\n  message_id = data['id']\n  subject = data['subject']\n\n  emailAddress = data['sender']['emailAddress']\n  sender_name = emailAddress['name']\n  sender_email = emailAddress['address']\n\n  #todo handle multiple recipients\n  emailAddress = data['toRecipients'][0]['emailAddress']\n  recipient_name = emailAddress['name']\n  recipient_email = emailAddress['address']\n\n  body = data['body']\n  content_type = body['contentType']\n  content = body['content']\n\n  has_attachments = str(data['hasAttachments'])\n  return locals()"
  outputs:
    - message_id: '${message_id}'
    - subject: '${subject}'
    - content: '${content}'
    - content_type: '${content_type}'
    - sender_name: '${sender_name}'
    - sender_email: '${sender_email}'
    - recipient_name: '${recipient_name}'
    - recipient_email: '${recipient_email}'
    - has_attachments: '${has_attachments}'
  results:
    - SUCCESS
