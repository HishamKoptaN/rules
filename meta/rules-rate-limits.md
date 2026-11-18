# Rate Limits & Auto-Retry Rule

When an AI agent encounters API rate limit errors (such as HTTP `429`, `Quota exceeded`, or messages like `Please retry in ...s`):
1. **Never Stop or Fail Prematurely:** Do not abort the session or declare task failure due to temporary rate limits if automatic waiting and retrying can resolve it.
2. **Backoff & Wait (Mandatory):** Automatically intercept any rate limit or quota exceeded response, parse the required wait duration from the error message or header, wait (`sleep` or delay for the specified seconds plus a safety margin), and automatically retry the failed tool call or request without requiring manual user intervention.
3. **Chunked & Stateful Progress:** Execute complex or large tasks in small, verifiable incremental steps with frequent checkpointing (e.g., git commits or saved files), ensuring seamless recovery if sessions restart.
