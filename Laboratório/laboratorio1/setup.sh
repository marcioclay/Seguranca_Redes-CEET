#!/bin/bash

# Nome da bridge definida no arquivo de topologia (nó "switch")
BRIDGE_NAME="switch"
# Nome do arquivo de topologia do Containerlab
CLAB_FILE="lab.clab.yml"

echo "=== 1. Verificando a Bridge no sistema ==="
if ! ip link show "$BRIDGE_NAME" > /dev/null 2>&1; then
    echo "A bridge '$BRIDGE_NAME' não existe. Criando..."
    sudo ip link add name "$BRIDGE_NAME" type bridge
    sudo ip link set dev "$BRIDGE_NAME" up
    echo "Bridge '$BRIDGE_NAME' criada e ativada com sucesso."
else
    echo "A bridge '$BRIDGE_NAME' já existe. Garantindo que está ativa..."
    sudo ip link set dev "$BRIDGE_NAME" up
fi

echo ""
echo "=== 2. Iniciando Deploy da Topologia ==="
sudo containerlab deploy -t "$CLAB_FILE"
