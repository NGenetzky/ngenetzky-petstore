#!/bin/bash -x

################################################################################
# Globals
GITROOT="${GITROOT-$(readlink -f ./$(git rev-parse --show-cdup))}"
#
################################################################################

get_swagger_url(){
  local commit="${1?}"
  echo "https://raw.githubusercontent.com/NGenetzky/ngenetzky-api/${commit}/api/swagger.yaml"
}

################################################################################
# api-yaml
get_swagger_yaml(){
  local url="${1?}"

  local s_dir="${GITROOT}/api/"
  local s_file="${s_dir}/swagger.yaml"
  if [ ! -d ${s_file} ] ; then 
    mkdir -p "${s_dir}"
  fi
  wget \
      --no-check-certificate \
      --output-document "${s_file}" \
      "${url}"
}
#
################################################################################

################################################################################
# python-flask

python_flask_config()
{
  local swagger_url="${1?}"

  local o_dir="${GITROOT}/python-flask-server/.swagger-codegen/"
  local o_file="${o_dir}/config.json"
  if [ ! -f ${o_file} ] ; then 
    mkdir -p \
      "${o_dir}"
    jq --null-input \
       --arg swagger_url "${swagger_url}" \
       '. | .spec={} | .options={} | .swaggerUrl=$swagger_url' \
       > "${o_file}"
  fi
  local config="$(\
    cat "${o_file}" \
      | jq \
       --arg swagger_url "${swagger_url}" \
       '. | .swaggerUrl=$swagger_url' \
  )"
  echo "${config}" | tee "${o_file}"
}

post_gen_servers_python_flask()
{
  local swagger_url="${1?}"

  local config="$(python_flask_config ${swagger_url})"
  local gen_reply=$(curl -X POST \
    "http://generator.swagger.io/api/gen/servers/python-flask" \
    -H  "accept: application/json" \
    -H  "content-type: application/json" \
    -d "${config}"
    ) || return $?
  echo $gen_reply | jq --raw-output .link
}

gen_servers_python_flask()
{
  local swagger_url="${1?}"
  local filename="${2-python-flask-generated.zip}"

  local url=$(post_gen_servers_python_flask  ${swagger_url})
  wget --output-document "${filename}" "${url}"
  unzip -o \
    -d "${GITROOT}" \
    "${filename}"
}

#
################################################################################

main() {
  local commit="${COMMIT-$(git rev-parse HEAD)}"
  local swagger_url="$(get_swagger_url ${commit})"

  get_swagger_yaml "${swagger_url}"
  gen_servers_python_flask "${swagger_url}"
}

if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    # Bash Strict Mode
    set -eu -o pipefail
    set -x
    main "$@"
fi

