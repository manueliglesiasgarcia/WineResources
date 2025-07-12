#!/bin/bash

# Try to get the second IP address, fallback to the first if not available
HORDE_AGENT_IP=$(hostname -I | awk '{print ($2 != "") ? $2 : $1}')

# Get the registration token
HORDE_TOKEN=$(curl -s "$HORDE_SERVER_URL/api/v1/admin/registrationtoken")

# Export the values
export HORDE_AGENT_IP=$HORDE_AGENT_IP
export HORDE_TOKEN=$HORDE_TOKEN

# Replace variables in the JSON template
envsubst < /opt/horde-agent/appsettings.json.template > /opt/horde-agent/appsettings.json

# Set server and run the agent
dotnet /opt/horde-agent/HordeAgent.dll SetServer -Url="$HORDE_SERVER_URL" -Token="$HORDE_TOKEN" -Default
dotnet /opt/horde-agent/HordeAgent.dll
