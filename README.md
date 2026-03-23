# trigrep

trigrep is an **indexed regex search tool for large codebases**, written in Rust.

Instead of scanning every file on each search like `grep` or `ripgrep`, trigrep
builds a **local, disk-backed trigram index** of your repository. At query time
it:

- decomposes your regex into literal fragments,
- turns them into trigrams (and later sparse n‑grams),
- uses an inverted index to find only the **small set of candidate files**,
- then runs a real regex engine just on those candidates.

This keeps search latency almost flat even as your monorepo grows, and makes
trigrep especially useful for **AI coding agents** and humans who search a lot
in very large trees.

