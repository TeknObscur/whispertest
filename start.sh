#!/bin/bash
set -e
# LLM post-traitement : gpt-oss-120b sur le port 8000 (port public par defaut)
vllm serve openai/gpt-oss-120b \
  --host 0.0.0.0 --port 8000 \
  --gpu-memory-utilization 0.82 &
# ASR : Whisper large-v3-turbo sur le port 8001
vllm serve openai/whisper-large-v3-turbo \
  --host 0.0.0.0 --port 8001 \
  --gpu-memory-utilization 0.05 --max-num-seqs 16 &
# si l'un des deux meurt, le conteneur sort (Koyeb relance)
wait -n
