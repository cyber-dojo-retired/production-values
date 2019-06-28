#!/bin/bash

helm init --client-only
helm repo add praqma https://praqma-helm-repo.s3.amazonaws.com/
helm repo update

HELM_CHART_VERSION_NUMBER=0.2.2

helm upgrade --install --namespace=prod -f values-files/differ-values.yaml prod-differ praqma/cyber-dojo-service --version ${HELM_CHART_VERSION_NUMBER}
helm upgrade --install --namespace=prod -f values-files/custom-values.yaml prod-custom praqma/cyber-dojo-service --version ${HELM_CHART_VERSION_NUMBER}
helm upgrade --install --namespace=prod -f values-files/exercises-values.yaml prod-exercises praqma/cyber-dojo-service --version ${HELM_CHART_VERSION_NUMBER}
helm upgrade --install --namespace=prod -f values-files/languages-values.yaml prod-languages praqma/cyber-dojo-service --version ${HELM_CHART_VERSION_NUMBER}
helm upgrade --install --namespace=prod -f values-files/mapper-values.yaml prod-mapper praqma/cyber-dojo-service --version ${HELM_CHART_VERSION_NUMBER} --wait
helm upgrade --install --namespace=prod -f values-files/saver-values.yaml prod-saver praqma/cyber-dojo-service --version ${HELM_CHART_VERSION_NUMBER}
helm upgrade --install --namespace=prod -f values-files/runner-values.yaml prod-runner praqma/cyber-dojo-service --version ${HELM_CHART_VERSION_NUMBER} --wait
helm upgrade --install --namespace=prod -f values-files/ragger-values.yaml prod-ragger praqma/cyber-dojo-service --version ${HELM_CHART_VERSION_NUMBER} --wait
helm upgrade --install --namespace=prod -f values-files/web-values.yaml prod-web praqma/cyber-dojo-service --version ${HELM_CHART_VERSION_NUMBER} --wait
helm upgrade --install --namespace=prod -f values-files/nginx-values.yaml prod-nginx praqma/cyber-dojo-service --version ${HELM_CHART_VERSION_NUMBER}


