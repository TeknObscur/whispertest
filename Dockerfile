FROM vllm/vllm-openai:latest
ENTRYPOINT ["vllm", "serve", "openai/gpt-oss-120b", "--host", "0.0.0.0", "--port", "8000", "--gpu-memory-utilization", "0.90"]
