# Rate Limits & Auto-Retry Rule

When an AI agent encounters API rate limit errors (such as HTTP `429`, `Quota exceeded`, or messages like `Please retry in ...s`):
1. **Never Stop or Fail Prematurely:** Do not abort the session or declare task failure due to temporary rate limits if automatic waiting and retrying can resolve it.
2. **Backoff & Wait:** Extract the required wait duration from the error message or header (`Retry-After`), add a small safety margin (2–5 seconds), and wait (`sleep`) before retrying the operation.
3. **Chunked & Stateful Progress:** Execute complex or large tasks in small, verifiable incremental steps with frequent checkpointing (e.g., git commits or saved files), ensuring seamless recovery if sessions restart.
