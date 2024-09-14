#!/usr/bin/env sh


docker run -d \
    --name clickhouse \
    --ulimit nofile=262144:262144 \
    -p 18123:8123 \
    -p 19000:9000 \
    -v ./clickhouse/data:/var/lib/clickhouse/ \
    -v ./clickhouse/logs:/var/log/clickhouse-server/ \
    clickhouse/clickhouse-server

echo "##############################"    
echo ""    
echo "ClickHouse ruining in Docker"
echo "  exposes port 18123 (8123) for the HTTP interface⁠"
echo "  and port 19000 (9000) for the native client⁠"
echo ""    
echo "Please run;"
echo "sudo ./ufw_add_port.sh 18123"    
echo "sudo ./ufw_add_port.sh 19000"

docker container ls