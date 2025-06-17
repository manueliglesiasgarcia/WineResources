#!/bin/bash
HORDE_AGENT_IP=$(hostname -I | awk '{print $2}')
export HORDE_AGENT_IP=$HORDE_AGENT_IP
envsubst < /opt/horde-agent/appsettings.json.template > /opt/horde-agent/appsettings.json
dotnet /opt/horde-agent/HordeAgent.dll

