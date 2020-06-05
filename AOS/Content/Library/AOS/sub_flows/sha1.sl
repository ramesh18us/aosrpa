namespace: AOS.sub_flows
operation:
  name: sha1
  inputs:
    - text
  python_action:
    use_jython: false
    script: "# do not remove the execute function \n#def execute(): \n    # code goes here\n# you can add additional helper methods below.\nimport hashlib\ndef execute(text):\n    return { 'sha1': hashlib.sha1(text.encode('utf-8')).hexdigest() }"
  outputs:
    - sha1: '${sha1}'
  results:
    - SUCCESS
