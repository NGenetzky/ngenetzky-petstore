#!//bin/sh
HOST='http://192.168.1.147:8080'
get()
{
  curl -X GET --header 'Accept: application/json' "${HOST}/v1/pet/1"
}
get $@
