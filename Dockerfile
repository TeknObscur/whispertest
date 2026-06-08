FROM vllm/vllm-openai:latest
RUN pip install --no-cache-dir librosa soundfile
COPY start.sh /start.sh
RUN chmod +x /start.sh
ENTRYPOINT ["bash", "/start.sh"]
