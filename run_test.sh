#!/bin/bash

echo "Iniciando execução dos testes Robot Framework..."

robot \
  -d results \
  -i regressivo \
  tests/

echo "Execução finalizada."