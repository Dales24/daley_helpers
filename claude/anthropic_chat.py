"""Minimal Claude API example using the Anthropic Python SDK.

Setup:
    pip install anthropic
    export ANTHROPIC_API_KEY=sk-ant-...
"""
import anthropic

# Resolves the key from ANTHROPIC_API_KEY in the environment.
client = anthropic.Anthropic()

MODEL = "claude-opus-4-8"  # latest Opus; see https://docs.claude.com for other IDs


def ask(question: str) -> str:
    """Send one prompt to Claude and return the text answer."""
    response = client.messages.create(
        model=MODEL,
        max_tokens=1024,
        thinking={"type": "adaptive"},  # let Claude decide how much to reason
        messages=[{"role": "user", "content": question}],
    )
    # content is a list of blocks; pick the text ones.
    return "".join(b.text for b in response.content if b.type == "text")


def stream(question: str) -> None:
    """Stream a long answer token-by-token (avoids request timeouts)."""
    with client.messages.stream(
        model=MODEL,
        max_tokens=8192,
        messages=[{"role": "user", "content": question}],
    ) as s:
        for text in s.text_stream:
            print(text, end="", flush=True)
    print()


if __name__ == "__main__":
    print(ask("In one sentence, what is Kubernetes?"))
