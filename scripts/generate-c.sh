#!/usr/bin/env bash
set -euo pipefail

repo_root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
out_dir="${repo_root}/generated"

rm -rf "${out_dir}"
mkdir -p "${out_dir}/include/google/protobuf"

protoc --proto_path="${repo_root}" --c_out="${out_dir}" \
  "${repo_root}/timer.proto" \
  "${repo_root}/google/protobuf/timestamp.proto"

mv "${out_dir}/timer.pb-c.h" "${out_dir}/include/timer.pb-c.h"
mv "${out_dir}/google/protobuf/timestamp.pb-c.h" \
  "${out_dir}/include/google/protobuf/timestamp.pb-c.h"
mv "${out_dir}/google/protobuf/timestamp.pb-c.c" \
  "${out_dir}/timestamp.pb-c.c"
rmdir "${out_dir}/google/protobuf" "${out_dir}/google"

if command -v clang-format >/dev/null 2>&1; then
  clang-format -i \
    "${out_dir}/timer.pb-c.c" \
    "${out_dir}/timestamp.pb-c.c" \
    "${out_dir}/include/timer.pb-c.h" \
    "${out_dir}/include/google/protobuf/timestamp.pb-c.h"
fi
