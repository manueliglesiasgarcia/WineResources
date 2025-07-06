#!/bin/bash
HORDE_AGENT_IP=$(hostname -I | awk '{print $2}')
HORDE_TOKEN=$(curl "$HORDE_SERVER_URL/api/v1/admin/registrationtoken")
export HORDE_AGENT_IP=$HORDE_AGENT_IP
export HORDE_TOKEN=$HORDE_TOKEN
envsubst < /opt/horde-agent/appsettings.json.template > /opt/horde-agent/appsettings.json
dotnet /opt/horde-agent/HordeAgent.dll SetServer -Url="$HORDE_SERVER_URL" -Token="$HORDE_TOKEN" -Default
dotnet /opt/horde-agent/HordeAgent.dll
 
