ARG BUILD_FROM
FROM $BUILD_FROM

WORKDIR /data

# Install Python, pip, virtualenv, and jq (for JSON formatting)
RUN apk add --no-cache python3 py3-pip py3-virtualenv jq

# Create and activate virtualenv in /opt/venv
RUN python3 -m venv /opt/venv

# Install pymodbus in the venv
RUN /opt/venv/bin/pip install --no-cache-dir "pymodbus[simulator]"

# Copy script
COPY default_sim_reg.json /default_sim_reg.json
COPY run.sh /
RUN chmod +x /run.sh

# Set venv as default Python and pip path
ENV PATH="/opt/venv/bin:$PATH"

CMD [ "/run.sh" ]
