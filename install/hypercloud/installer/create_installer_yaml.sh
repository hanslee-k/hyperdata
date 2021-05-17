#!/bin/bash
parent_path=$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )

export $(grep -v '^#' image_config.properties | xargs -d '\n')
export $(grep -v '^#' hyperdata_config.properties | xargs -d '\n')

ADDRESS_DELIMITER=':'
LOCAL_REGISTRY_SPLIT=(${LOCAL_REGISTRY//${ADDRESS_DELIMITER}/ })
LOCAL_REGISTRY_IP=${LOCAL_REGISTRY_SPLIT[0]}
LOCAL_REGISTRY_PORT=${LOCAL_REGISTRY_SPLIT[1]}

sed 's/${NAMESPACE}/'${NAMESPACE}'/g;'\
's/${LOCAL_REGISTRY}/'${LOCAL_REGISTRY}'\//g;'\
's/${LOCAL_REGISTRY_IP}/'${LOCAL_REGISTRY_IP}'/g;'\
's/${LOCAL_REGISTRY_PORT}/'${LOCAL_REGISTRY_PORT}'/g;'\
's/${LOCAL_REGISTRY_SECRET}/'${LOCAL_REGISTRY_SECRET}'/g;'\
's/${ENABLE_HTTPS}/'${ENABLE_HTTPS}'/g;'\
's/${ENABLE_LOADBALANCER}/'${ENABLE_LOADBALANCER}'/g;'\
's/${IP}/'${IP}'/g;'\
's/${TB_TAG}/'${TB_TAG}'/g;'\
's/${NGINX_PORT}/'${NGINX_PORT}'/g;'\
's/${NGINX_CONTROLLER_TAG}/'${NGINX_CONTROLLER_TAG}'/g;'\
's/${NGINX_CERTGEN_TAG}/'${NGINX_CERTGEN_TAG}'/g;'\
's/${HD_TAG}/'${HD_TAG}'/g;'\
's/${HYPERDATA_PROXY_BODYSIZE}/'${HYPERDATA_PROXY_BODYSIZE}'/g;'\
's/${HYPERDATA_PROXY_TIMEOUT}/'${HYPERDATA_PROXY_TIMEOUT}'/g;'\
's/${KUBEFLOW_IP}/'${KUBEFLOW_IP}'/g;'\
's/${KUBEFLOW_NOTEBOOK_PORT}/'${KUBEFLOW_NOTEBOOK_PORT}'/g;'\
's/${KUBEFLOW_KFSERVING_PORT}/'${KUBEFLOW_KFSERVING_PORT}'/g;'\
's/${AUTOML_TAG}/'${AUTOML_TAG}'/g;'\
's/${DOLOADER_TAG}/'${DOLOADER_TAG}'/g;'\
's/${FE_TAG}/'${FE_TAG}'/g;'\
's/${XGB_TAG}/'${XGB_TAG}'/g;'\
's/${RF_TAG}/'${RF_TAG}'/g;'\
's/${DOWNLOADER_TAG}/'${DOWNLOADER_TAG}'/g;'\
's/${SCHEDULER_TAG}/'${SCHEDULER_TAG}'/g;'\
's/${WOORI_TAG}/'${WOORI_TAG}'/g;'\
's/${RESULTUPLOADER_TAG}/'${RESULTUPLOADER_TAG}'/g;'\
's/${DOMAINSERVING_TAG}/'${DOMAINSERVING_TAG}'/g;'\
's/${WOORISERVING_TAG}/'${WOORISERVING_TAG}'/g;' \
./base/installer.yaml > installer.yaml