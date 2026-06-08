FROM vllm/vllm-openai:v0.8.5
ENV VLLM_USE_V1=0
RUN pip install --no-cache-dir librosa soundfile
RUN python3 -c "from huggingface_hub import snapshot_download; snapshot_download('openai/whisper-large-v3-turbo')"
ENTRYPOINT ["vllm", "serve", "openai/whisper-large-v3-turbo", "--host", "0.0.0.0", "--port", "8000", "--max-num-seqs", "64"]
