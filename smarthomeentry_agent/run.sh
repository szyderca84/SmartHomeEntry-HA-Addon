#!/usr/bin/with-contenv bashio

INSTALL_TOKEN=$(bashio::config 'install_token')
API_URL=$(bashio::config 'api_url')
HA_PORT=$(bashio::config 'ha_port')

export SMARTHOMEENTRY_API_URL="${API_URL}"
export SMARTHOMEENTRY_INSTALL_TOKEN="${INSTALL_TOKEN}"
export SMARTHOMEENTRY_LOCAL_ADDR="localhost:${HA_PORT}"

bashio::log.info "Starting SmartHomeEntry Agent..."
bashio::log.info "API URL: ${API_URL}"
bashio::log.info "Tunneling: localhost:${HA_PORT}"

exec /usr/local/bin/smarthomeentry-agent
