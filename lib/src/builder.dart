import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';

import 'annotation.dart';

Builder artemisCustomTypeBuilder(BuilderOptions options) {
  return SharedPartBuilder(
    [ArtemisCustomTypeGenerator(options)],
    'artemis_custom_type',
  );
}

class ArtemisCustomTypeGenerator
    extends GeneratorForAnnotation<ArtemisCustomType> {
  ArtemisCustomTypeGenerator(this.options);

  final BuilderOptions options;

  @override
  String generateForAnnotatedElement(
    Element element,
    ConstantReader annotation,
    BuildStep buildStep,
  ) {
    final List<ConstructorElement> ctors =
        (element as ClassElement).constructors;
    final String name = element.name;

    String? dartCtor;
    for (var ctor in ctors) {
      if (ctor.parameters.length == 1 &&
          ctor.parameters.first.type.isDartCoreString) {
        dartCtor = ctor.displayName;
      }
    }

    if (dartCtor == null) {
      print(
        'WARNING: $name cannot be generated, as it lacks $name(String) constructor.',
      );

      return '';
    }

    final StringBuffer code = StringBuffer();

    final String graphQlType =
        annotation.peek('graphQlName')?.stringValue ?? name;
    final String dartType = name;

    code.write(
      '$dartType fromGraphQL${graphQlType}ToDart$dartType(String v) => $dartCtor(v);\n'
      'String fromDart${dartType}ToGraphQL$graphQlType($dartType v) => v.toString();\n'
      'List<$dartType> fromGraphQLList${graphQlType}ToDartList$dartType(List<Object?> v) => v.map((e) => fromGraphQL${graphQlType}ToDart$dartType(e as String)).toList();\n'
      'List<String> fromDartList${dartType}ToGraphQLList$graphQlType(List<$dartType> v) => v.map((e) => fromDart${dartType}ToGraphQL$graphQlType(e)).toList();\n'
      'List<$dartType>? fromGraphQLListNullable${graphQlType}ToDartListNullable$dartType(List<Object?>? v) => v?.map((e) => fromGraphQL${graphQlType}ToDart$dartType(e as String)).toList();\n'
      'List<String>? fromDartListNullable${dartType}ToGraphQLListNullable$graphQlType(List<$dartType>? v) => v?.map((e) => fromDart${dartType}ToGraphQL$graphQlType(e)).toList();\n'
      '$dartType? fromGraphQL${graphQlType}NullableToDart${dartType}Nullable(String? v) => v == null ? null : $dartCtor(v);\n'
      'String? fromDart${dartType}NullableToGraphQL${graphQlType}Nullable($dartType? v) => v?.toString();\n'
      'List<$dartType?> fromGraphQLList${graphQlType}NullableToDartList${dartType}Nullable(List<Object?> v) => v.map((e) => fromGraphQL${graphQlType}NullableToDart${dartType}Nullable(e as String?)).toList();\n'
      'List<String?> fromDartList${dartType}NullableToGraphQLList${graphQlType}Nullable(List<$dartType?> v) => v.map((e) => fromDart${dartType}NullableToGraphQL${graphQlType}Nullable(e)).toList();\n'
      'List<$dartType?>? fromGraphQLListNullable${graphQlType}NullableToDartListNullable${dartType}Nullable(List<Object?>? v) => v?.map((e) => fromGraphQL${graphQlType}NullableToDart${dartType}Nullable(e as String?)).toList();\n'
      'List<String?>? fromDartListNullable${dartType}NullableToGraphQLListNullable${graphQlType}Nullable(List<$dartType?>? v) => v?.map((e) => fromDart${dartType}NullableToGraphQL${graphQlType}Nullable(e)).toList();\n',
    );

    return code.toString();
  }
}
