# claude

Helpers for working with Claude — the API and Claude Code.

| File                 | What it's for                                                       |
|----------------------|---------------------------------------------------------------------|
| `anthropic_chat.py`  | Minimal Anthropic Python SDK example (single call + streaming)      |
| `CLAUDE.md`          | Template project-instructions file Claude Code reads automatically  |
| `settings.json`      | Sample Claude Code `settings.json` (permissions + env)              |

## Anthropic SDK quick start

```bash
pip install anthropic
export ANTHROPIC_API_KEY=sk-ant-...
python claude/anthropic_chat.py
```

Default model is `claude-opus-4-8`. The example uses **adaptive thinking**
(`thinking={"type": "adaptive"}`) — Claude decides how much to reason per request.
