#!/usr/bin/with-contenv bashio
set -e

trap 'bashio::log.warning "SmartHomeEntry Agent exited (exit code: $?)"' EXIT

INSTALL_TOKEN=$(bashio::config 'install_token')
API_URL=$(bashio::config 'api_url')
HA_PORT=$(bashio::config 'ha_port')

# --- Validate install_token ---
if [ -z "${INSTALL_TOKEN}" ]; then
    bashio::log.fatal "install_token is not set. Please configure it in the add-on options."
    exit 1
fi

# --- Validate ha_port ---
if ! [[ "${HA_PORT}" =~ ^[0-9]+$ ]] || [ "${HA_PORT}" -lt 1 ] || [ "${HA_PORT}" -gt 65535 ]; then
    bashio::log.fatal "ha_port must be a number between 1 and 65535, got: '${HA_PORT}'"
    exit 1
fi

export SMARTHOMEENTRY_API_URL="${API_URL}"
export SMARTHOMEENTRY_INSTALL_TOKEN="${INSTALL_TOKEN}"
export SMARTHOMEENTRY_LOCAL_ADDR="localhost:${HA_PORT}"

bashio::log.info "Starting SmartHomeEntry Agent..."
bashio::log.info "API URL: ${API_URL}"
bashio::log.info "Tunneling: localhost:${HA_PORT}"

exec /usr/local/bin/smarthomeentry-agent
