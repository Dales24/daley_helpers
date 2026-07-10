# ai

Small, dependency-free helpers for AI/LLM work.

| File            | What it does                                                          |
|-----------------|----------------------------------------------------------------------|
| `text_chunk.py` | Split long text into overlapping, context-window-sized chunks (RAG)  |
| `vector_ops.py` | Embedding math: cosine similarity, top-k nearest, softmax            |
| `retry.py`      | Exponential-backoff retry decorator for flaky API calls              |

All pure Python — run any file directly for a demo (`python3 ai/vector_ops.py`).
Scale up (numpy, a real tokenizer, a vector DB) when the corpus grows.
