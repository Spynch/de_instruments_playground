mkdir -p ./services/volume/{airflow/{dags,logs,plugins,config},postgres,minio}
mkdir -p ./services/configs/{airflow,hadoop,jupiterhub}
mkdir -p ./services/datasets
sudo chmod -R 777 ./services/
echo -e "AIRFLOW_UID=$(id -u)" > ./services/configs/airflow/env
sudo docker compose up airflow-init
sudo docker compose up -d