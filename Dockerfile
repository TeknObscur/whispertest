FROM vllm/vllm-openai:v0.8.5
RUN pip install --no-cache-dir librosa soundfile
ENTRYPOINT ["vllm", "serve", "openai/whisper-large-v3-turbo", "--host", "0.0.0.0", "--port", "8000", "--max-num-seqs", "64"]
