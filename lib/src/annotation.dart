/// Annotation for marking [T] as custom type for `artemis` code gen.
class ArtemisCustomType<T> {
  const ArtemisCustomType({
    this.graphQlName,
    this.convert,
    this.parse,
  });

  /// Name of GraphQL scalar type this [T] represents.
  ///
  /// If not specified, [runtimeType] of [T] is used.
  final String? graphQlName;

  /// Function, converting this [T] to [String].
  ///
  /// If not specified, then [toString] is used.
  final String Function(T)? convert;

  /// Function, converting the [String] to [T].
  ///
  /// If not specified, then any constructor accepting single [String] is used.
  final T Function(String)? parse;
}
