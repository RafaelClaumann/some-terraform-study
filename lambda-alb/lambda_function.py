import json

def lambda_handler(event, context):
    print("-------------------------------------------------------------")
    print("lambda_event:", event)
    print("lambda_context:", context)
    print("-------------------------------------------------------------")
    
    return json.dumps(event)
