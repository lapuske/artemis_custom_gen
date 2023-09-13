[`artemis_custom_gen`]
====================

[`artemis_custom_gen`] is a custom types generator for [`artemis`] GraphQL package.




## Getting started

To use the package, simply add the following to your `pubspec.yaml`:


```yaml
dependencies:
  artemis_custom_gen:

dev_dependencies:
  build_runner:
```

Or to depend on the latest `main`:

```yaml
dependencies:
  artemis_custom_gen:
    git: https://github.com/lapuske/artemis_custom_gen.git

dev_dependencies:
  build_runner:
```




## Usage

Detailed example can be found in `/example` directory.

1. Annotate the custom type with `@ArtemisCustomType()` annotation:

```dart
@ArtemisCustomType()
class MyCustomType {
    // ...
}
```

By default, `artemis_custom_gen` uses the Dart class name (`MyCustomType` in the example above) as a GraphQL scalar name. If the GraphQL scalar name differs from your Dart class name, you should specify the `graphQlType` parameter in `ArtemisCustomType` annotation:

```dart
@ArtemisCustomType(graphQlType: 'MyGraphQlScalar')
class MyCustomType {
    // ...
}
```

__Note__, that for parsing from `String` your custom type __must__ have a single `String` argument constructor. E.g.:

```dart
@ArtemisCustomType(graphQlType: 'MyGraphQlScalar')
class MyCustomType {
  const MyCustomType(this.value); // `this.value` is a `String`.
  final String value;
}
```

```dart
class Parent {
  const Parent(this.value);
  final String value;
}

@ArtemisCustomType(graphQlType: 'MyGraphQlScalar')
class MyCustomType extends Parent {
  const MyCustomType(super.value); // `super.value` is a `String`.
}
```

```dart
@ArtemisCustomType(graphQlType: 'MyGraphQlScalar')
class MyCustomType {
  const MyCustomType(this.value);

  // Naming doesn't matter.
  const MyCustomType.parse(String string) : value = double.parse(string);

  final double value;
}
```

And for parsing to `String` currently `artemis_custom_gen` uses `toString()` on your custom type.

2. (Optionally) Configure the output path (default is `lib/api/parsers.g.dart`).

In your `build.yaml`:

```yaml
targets:
  $default:
    builders:
      artemis_custom_gen:
        options:
          output: api/backend/parsers.dart # Without `lib/`.
```

3. Run the [`build_runner`]:

```bash
dart run build_runner build
```

4. Add the generated type to the [`artemis`] options in `build.yaml` (see [`artemis`] documentation to learn more):

```yaml
targets:
  $default:
    builders:
      artemis:
        options:
          scalar_mapping:
            - graphql_type: MyGraphQlScalar
              custom_parser_import: "package:your_package/path_to_parsed_file.dart"
              dart_type:
                name: MyCustomType
                imports:
                  - "package:your_package/path_to_your_model/my_custom_type.dart"
```




## Roadmap

- [ ] Configurable to `String` and from `String` parsers on `ArtemisCustomType`.




[`artemis`]: https://pub.dev/packages/artemis
[`artemis_custom_gen`]: https://pub.dev/packages/artemis_custom_gen
[`build_runner`]: https://pub.dev/packages/build_runner
