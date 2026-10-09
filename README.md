# RR1 Timer Protos

Protocol buffer schemas for RR1 timer messages.

Generated protobuf-c files are produced by GitHub Actions. Every run uploads
them as a workflow artifact named `rr1-messages-generated` (expires after 90
days). Pushes to `main` and `v*` tags also publish them as the release asset
`rr1-messages-generated.zip`, which does not expire:

- Push to `main`: a new immutable `bindings-<sha>` release is created and
  verified, then marked GitHub's "latest" release. Nothing is deleted or
  replaced in place, so downloads never see a gap. The newest 50 are kept.
  Consumers fetch
  `https://github.com/<owner>/<repo>/releases/latest/download/rr1-messages-generated.zip`.
- `vX.Y.Z` tag: a pinned release that never becomes "latest"; use these to
  pin a firmware build to a known set of bindings.

A run can also be started by hand with `gh workflow run generate-c.yml`.

The generated artifact is shaped to overlay the ESP-IDF `rr1_messages`
component:

- `timer.pb-c.c`
- `timestamp.pb-c.c`
- `include/timer.pb-c.h`
- `include/google/protobuf/timestamp.pb-c.h`

