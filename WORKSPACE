load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")
load("@bazel_tools//tools/build_defs/repo:git.bzl", "git_repository")

http_archive(
    name = "build_bazel_rules_apple",
    sha256 = "a6141240657093fa7ccc7ca1ee5a62408dd9996d1bf47bc2369b8b9faefb2698",
    url = "https://github.com/bazelbuild/rules_apple/releases/download/2.3.0/rules_apple.2.3.0.tar.gz",
)

# git_repository(
#     name = "build_bazel_rules_apple",
#     commit = "0012aed91dc20799a245df1bd494df618ade62d3",
#     remote = "https://github.com/andre-alves/rules_apple",
# )

load(
    "@build_bazel_rules_apple//apple:repositories.bzl",
    "apple_rules_dependencies",
)

apple_rules_dependencies()

http_archive(
    name = "build_bazel_rules_swift",
    sha256 = "b98bd1ec03c713e2ff5c3aa8c05930d8b6ab85cc82b3ae5d869058da4731f230",
    url = "https://github.com/bazelbuild/rules_swift/releases/download/1.8.0/rules_swift.1.8.0.tar.gz",
)

load(
    "@build_bazel_rules_swift//swift:repositories.bzl",
    "swift_rules_dependencies",
)

swift_rules_dependencies()

load(
    "@build_bazel_rules_swift//swift:extras.bzl",
    "swift_rules_extra_dependencies",
)

swift_rules_extra_dependencies()

load(
    "@build_bazel_apple_support//lib:repositories.bzl",
    "apple_support_dependencies",
)

apple_support_dependencies()
