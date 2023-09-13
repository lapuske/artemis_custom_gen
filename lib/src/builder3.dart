import 'dart:async';

import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:glob/glob.dart';
import 'package:source_gen/source_gen.dart';

import 'annotation.dart';

Builder artemisCustomTypeBuilder(BuilderOptions options) {
  return ArtemisCustomTypeBuilder(options);
}

class ArtemisCustomTypeBuilder implements Builder {
  const ArtemisCustomTypeBuilder(this.options);

  final BuilderOptions options;

  String get output => options.config['output'] ?? 'api/parsers.g.dart';

  @override
  Map<String, List<String>> get buildExtensions => {
        r'$lib$': [output],
      };

  @override
  FutureOr<void> build(BuildStep buildStep) async {
    final assets = buildStep.findAssets(Glob('**/*.dart'));

    final List<AnnotatedElement> items = [];
    final List<AssetId> imports = [];

    await for (var asset in assets) {
      if (await buildStep.resolver.isLibrary(asset)) {
        final library = await buildStep.resolver.libraryFor(asset);
        final reader = LibraryReader(library);

        Iterable<AnnotatedElement> annotations =
            reader.annotatedWith(TypeChecker.fromRuntime(ArtemisCustomType));
        if (annotations.isNotEmpty) {
          imports.add(asset);
        }

        items.addAll(annotations);
      }
    }

    print('IMPORTS: ${imports.join('\n')}');

    if (items.isEmpty) {
      // Nothing to generate.
      return;
    }

    final StringBuffer buffer = StringBuffer();

    buffer.write('// ignore_for_file: lines_longer_than_80_chars\n');

    for (var i in imports) {
      buffer.write('import \'${i.path.replaceFirst('lib', '')}\';\n');
    }

    buffer.writeln();

    for (var e in items) {
      final StringBuffer code = StringBuffer();

      final ConstructorElement? element =
          (e.element as ClassElement).constructors.firstOrNull;
      final String name = e.element.name!;

      if (element == null ||
          element.parameters.length > 1 ||
          element.parameters.isEmpty ||
          element.parameters.first.name != 'String') {
        print(
          '[artemis_custom_gen] WARNING: $name cannot be generated, as it lacks $name(String) constructor.',
        );

        continue;
      }

      final String graphQlType =
          e.annotation.peek('graphQlName')?.stringValue ?? name;
      final String dartType = name;

      code.write(
        '$dartType fromGraphQL${graphQlType}ToDart$dartType(String v) => $dartType(v);\n'
        'String fromDart${dartType}ToGraphQL$graphQlType($dartType v) => v.toString();\n'
        'List<$dartType> fromGraphQLList${graphQlType}ToDartList$dartType(List<Object?> v) => v.map((e) => fromGraphQL${graphQlType}ToDart$dartType(e as String)).toList();\n'
        'List<String> fromDartList${dartType}ToGraphQLList$graphQlType(List<$dartType> v) => v.map((e) => fromDart${dartType}ToGraphQL$graphQlType(e)).toList();\n'
        'List<$dartType>? fromGraphQLListNullable${graphQlType}ToDartListNullable$dartType(List<Object?>? v) => v?.map((e) => fromGraphQL${graphQlType}ToDart$dartType(e as String)).toList();\n'
        'List<String>? fromDartListNullable${dartType}ToGraphQLListNullable$graphQlType(List<$dartType>? v) => v?.map((e) => fromDart${dartType}ToGraphQL$graphQlType(e)).toList();\n'
        '$dartType? fromGraphQL${graphQlType}NullableToDart${dartType}Nullable(String? v) => v == null ? null : $dartType(v);\n'
        'String? fromDart${dartType}NullableToGraphQL${graphQlType}Nullable($dartType? v) => v?.toString();\n'
        'List<$dartType?> fromGraphQLList${graphQlType}NullableToDartList${dartType}Nullable(List<Object?> v) => v.map((e) => fromGraphQL${graphQlType}NullableToDart${dartType}Nullable(e as String?)).toList();\n'
        'List<String?> fromDartList${dartType}NullableToGraphQLList${graphQlType}Nullable(List<$dartType?> v) => v.map((e) => fromDart${dartType}NullableToGraphQL${graphQlType}Nullable(e)).toList();\n'
        'List<$dartType?>? fromGraphQLListNullable${graphQlType}NullableToDartListNullable${dartType}Nullable(List<Object?>? v) => v?.map((e) => fromGraphQL${graphQlType}NullableToDart${dartType}Nullable(e as String?)).toList();\n'
        'List<String?>? fromDartListNullable${dartType}NullableToGraphQLListNullable${graphQlType}Nullable(List<$dartType?>? v) => v?.map((e) => fromDart${dartType}NullableToGraphQL${graphQlType}Nullable(e)).toList();\n',
      );

      buffer.write(code.toString());
    }

    final outputId = AssetId(buildStep.inputId.package, 'lib/$output');
    await buildStep.writeAsString(outputId, buffer.toString());
    print('written to $outputId');
  }
}
