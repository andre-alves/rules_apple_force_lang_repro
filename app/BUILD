load("@build_bazel_rules_apple//apple:ios.bzl", "ios_application")
load("@build_bazel_rules_apple//apple:versioning.bzl", "apple_bundle_version")
load("@build_bazel_rules_swift//swift:swift.bzl", "swift_library")
load("@build_bazel_rules_apple//apple:resources.bzl", "apple_resource_group")

ios_application(
    name = "SampleApp",
    app_icons = glob(["resources/assets/AppIcon.xcassets/**/*"]),
    bundle_id = "com.test.andre.sampleapp",
    bundle_name = "SampleApp",
    families = [
        "iphone",
        "ipad",
    ],
    infoplists = ["resources/Info.plist"],
    minimum_os_version = "14.0",
    version = ":SampleAppVersion",
    visibility = ["//visibility:public"],
    deps = [
        ":SampleLibrary",
    ],
)

apple_bundle_version(
    name = "SampleAppVersion",
    build_version = "1.2.3.4",
    short_version_string = "1.2.3",
    tags = ["manual"],
)

swift_library(
    name = "SampleLibrary",
    srcs = glob(["sources/**/*.swift"]),
    module_name = "SampleLibrary",
    tags = ["manual"],
    deps = [],
    data = [":SampleAppStrings"],
)

apple_resource_group(
    name = "SampleAppStrings",
    resources = glob(["resources/strings/**/*.strings"])
)
