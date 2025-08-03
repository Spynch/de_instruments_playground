# DE Instruments Playground

Набор контейнеров для обучения и экспериментов с инструментами Data Engineering. Проект разворачивает типовой стек через `docker compose` и предоставляет подготовленную директорию для данных и конфигураций.

## Инфраструктура
В состав входят сервисы:
- PostgreSQL для DWH
- MinIO для хранения файлов
- ClickHouse
- Apache Airflow
- Zookeeper и Kafka
- Hadoop (HDFS)
- JupyterHub c PySpark
- Apache Superset
- Grafana
- Trino
- MariaDB
- Hive Metastore

Сервисы находятся в одной мостовой сети с предопределёнными IP и портами, что упрощает настройки и подключение из внешних инструментов.

## Структура проекта
- `docker-compose.yml` — описание всех контейнеров, сети и переменных.
- `sandbox_db_run.sh` — подготовка каталогов и запуск всей инфраструктуры.
- `sandbox_db_remove.sh` — остановка и удаление окружения.
- `services/`
  - `configs/` — файлы конфигураций для сервисов (Airflow, Hadoop, Trino и т.д.).
  - `datasets/` — каталог для размещения наборов данных.
  - `volume/` — тома с логами и данными контейнеров.

## Быстрый старт
```bash
mkdir -p ./services/volume/{airflow/{dags,logs,plugins,config},postgres,minio}
mkdir -p ./services/configs/{airflow,hadoop,jupiterhub}
mkdir -p ./services/datasets
sudo chmod -R 777 ./services/
echo -e "AIRFLOW_UID=$(id -u)" > ./services/configs/airflow/env
sudo docker compose up airflow-init
sudo docker compose up -d
```

### Остановка
```bash
sudo docker compose down
```

### Полное удаление
```bash
docker compose down --volumes --rmi all
```
