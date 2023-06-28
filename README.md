## (Repro) Unable to force language or locale in tests 

In this sample we have a code base where the `CFBundleDevelopmentRegion` is `en` and the app/tests contains localizations for `en` and `es`.

There are 2 test targets, they use the same code but only one have `host_app` set.

- `//tests:UnitTestA`
- `//tests:UnitTestB` (with host_app)

These test targets contains tests that are expected to run in Spanish (`es`), and will fail otherwise.

```
bazelisk test //tests:UnitTestA

bazelisk test //tests:UnitTestB
```

All tests are currently failing, even when passing `-testLanguage es` to xcodebuild.
