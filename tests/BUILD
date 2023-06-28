load("@build_bazel_rules_apple//apple:ios.bzl", "ios_unit_test")
load("@build_bazel_rules_swift//swift:swift.bzl", "swift_library")
load("@build_bazel_rules_apple//apple/testing/default_runner:ios_xctestrun_runner.bzl", "ios_xctestrun_runner")
load("@build_bazel_rules_apple//apple:resources.bzl", "apple_resource_group")

ios_xctestrun_runner(
    name = "TestRunner",
    create_xcresult_bundle = True,
    random = False,
    reuse_simulator = False,
    xcodebuild_args = [
        "-testLanguage",
        "es",
    ],
)

apple_resource_group(
    name = "UnitTestStrings",
    resources = glob(["resources/strings/**/*.strings"]),
)

swift_library(
    name = "UnitTestSources",
    testonly = True,
    srcs = glob(["unit_tests/*.swift"]),
    data = [":UnitTestStrings"],
    module_name = "UnitTestSources",
    tags = ["manual"],
    deps = [],
)

ios_unit_test(
    name = "UnitTestA",
    # args = ["--command_line_args=-AppleLanguages,(es)"],
    bundle_id = "com.unit_test_a",
    data = [],
    infoplists = ["UnitTest_Info.plist"],
    minimum_os_version = "14.0",
    runner = ":TestRunner",
    deps = [":UnitTestSources"],
)

# The same thing as A, but with host app
ios_unit_test(
    name = "UnitTestB",
    # args = ["--command_line_args=-AppleLanguages,(es)"],
    bundle_id = "com.unit_test_b",
    data = [],
    infoplists = ["UnitTest_Info.plist"],
    minimum_os_version = "14.0",
    runner = ":TestRunner",
    test_host = "//app:SampleApp",
    deps = [":UnitTestSources"],
)
