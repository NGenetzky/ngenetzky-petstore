from __future__ import print_function
import time
import swagger_client
from swagger_client.rest import ApiException
from pprint import pprint

# Configure OAuth2 access token for authorization: petstore_auth
# swagger_client.configuration.access_token = 'YOUR_ACCESS_TOKEN'
# swagger_client.configuration.host = 'http://0.0.0.0:8080/nathansen4/ngenetzky-petstore/1.0.0'
swagger_client.configuration.host = 'http://server_python_flask:8080/nathansen4/ngenetzky-petstore/1.0.0'

# create an instance of the API class
api_instance = swagger_client.PetApi()
body = swagger_client.Pet() # Pet | Pet object that needs to be added to the store

try:
    # Add a new pet to the store
    api_instance.add_pet(body)
except ApiException as e:
    print("Exception when calling PetApi->add_pet: %s\n" % e)

