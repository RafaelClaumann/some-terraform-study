import json

def lambda_handler(event, context):
    print("-------------------------------------------------------------")
    print("lambda_event:", event)
    print("lambda_context:", context)
    print("-------------------------------------------------------------")
    
    response = {
        "statusCode": 200,
        "statusDescription": "200 OK",
        "isBase64Encoded": False,
        "headers": {
            "Content-Type": "application/json; charset=utf-8"
        }
    }

    response['body'] = json.dumps(event)
    return response
