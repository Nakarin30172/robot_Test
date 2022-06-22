import base64

def encode(decode):
    mystr_encoded = base64.b64decode(decode).decode('utf-8') 
    return mystr_encoded
def decode(encode):
    message_bytes = encode.encode('ascii')
    base64_bytes = base64.b64encode(message_bytes)
    mystr_encoded = base64_bytes.decode('ascii')
    return mystr_encoded