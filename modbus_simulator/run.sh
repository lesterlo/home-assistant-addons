#!/usr/bin/with-contenv bashio


# Read the JSON content from the add-on option
SIM_JSON_PATH="/config/sim_reg.json"
Modbus_Server_Name=$(bashio::config 'modbus_server_name')
Modbus_Device_Name=$(bashio::config 'modbus_device_name')

# Validate the file
if [ ! -f "${SIM_JSON_PATH}" ]; then
     bashio::log.info "➡️ Copying default sim_reg.json to ${SIM_JSON_PATH}"
    cp /default_sim_reg.json "${SIM_JSON_PATH}"
fi

# Optionally validate JSON
#jq . "${SIM_JSON_PATH}" >/dev/null || {
#    bashio::log.error "❌ Invalid JSON syntax in ${SIM_JSON_PATH}"
#    exit 1
#}

pymodbus.simulator \
 --modbus_server "${Modbus_Server_Name}" \
 --modbus_device "${Modbus_Device_Name}" \
 --json_file "${SIM_JSON_PATH}"