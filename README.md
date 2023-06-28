## (Repro) Unable to force language or locale in tests 

In this sample we have a code base where the `CFBundleDevelopmentRegion` is `en` and the app/tests contains localizations for `en` and `es`.

There are 2 test targets, they use the same code but only one have `host_app` set.

- `//tests:UnitTestA`
- `//tests:UnitTestB` (with host_app)

These test targets are expected to run in Spanish (`es`), and will fail otherwise.

```
bazelisk test //tests:UnitTestA

bazelisk test //tests:UnitTestB
```

All tests are currently failing, even when passing `-testLanguage es` to xcodebuild. Tested with Xcode 14.1.

### Proposed Solution

Add support for passing `CommandLineArguments` to xctestrun file and provide `-AppleLanguages (es)` as launch argument to the tests.

It's possible to verify this solution in this repro. Uncomment `args` from the test targets and uncomment the rules_apple fork declaration in the `WORKSPACE`.

https://github.com/andre-alves/rules_apple/commit/0012aed91dc20799a245df1bd494df618ade62d3
