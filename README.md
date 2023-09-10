`artemis_custom_gen` is a `build_runner` custom types generator for `artemis` GraphQL package.




## Getting started

To use the package, simply add the following to your `pubspec.yaml`:

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

2. Add the `part '....g.dart';` directive after the imports in your Dart file.
3. Run the `build_runner`: `dart run build_runner build`.
4. Add the generated type to the `build.yaml` of your package (see `artemis` documentation to learn more):

```yaml
targets:
  $default:
    builders:
      artemis:
        options:
          scalar_mapping:
            - graphql_type: MyCustomType
              custom_parser_import: "package:your_package/path_to_your_model/my_custom_type.dart"
              dart_type:
                name: MyCustomType
                imports:
                  - "package:your_package/path_to_your_model/my_custom_type.dart"
```

Note, that `custom_parser_import` and `imports` are the same. That's because of that `part` directive you put.
