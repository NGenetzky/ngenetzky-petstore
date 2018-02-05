#!//bin/sh
HOST='http://192.168.1.147:8080'
post()
{
  curl -X POST --header 'Content-Type: application/json' --header 'Accept: application/json' -d '{ \ 
     "category": { \ 
       "id": 6, \ 
       "name": "name" \ 
     }, \ 
     "id": 0, \ 
     "name": "doggie", \ 
     "photoUrls": [ \ 
       "photoUrls", \ 
       "photoUrls" \ 
     ], \ 
     "status": "available", \ 
     "tags": [ \ 
       { \ 
         "id": 1, \ 
         "name": "name" \ 
       }, \ 
       { \ 
         "id": 1, \ 
         "name": "name" \ 
       } \ 
     ] \ 
   }' "${HOST}/v1/user"
}
post $@
