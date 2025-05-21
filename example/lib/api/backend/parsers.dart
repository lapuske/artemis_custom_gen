import '/main.dart';

// UserId -> UserId

UserId fromGraphQLUserIdToDartUserId(String v) => UserId(v);
String fromDartUserIdToGraphQLUserId(UserId v) => v.toString();
List<UserId> fromGraphQLListUserIdToDartListUserId(List<Object?> v) =>
    v.map((e) => fromGraphQLUserIdToDartUserId(e as String)).toList();
List<String> fromDartListUserIdToGraphQLListUserId(List<UserId> v) =>
    v.map((e) => fromDartUserIdToGraphQLUserId(e)).toList();
List<UserId>? fromGraphQLListNullableUserIdToDartListNullableUserId(
  List<Object?>? v,
) => v?.map((e) => fromGraphQLUserIdToDartUserId(e as String)).toList();
List<String>? fromDartListNullableUserIdToGraphQLListNullableUserId(
  List<UserId>? v,
) => v?.map((e) => fromDartUserIdToGraphQLUserId(e)).toList();
UserId? fromGraphQLUserIdNullableToDartUserIdNullable(String? v) =>
    v == null ? null : UserId(v);
String? fromDartUserIdNullableToGraphQLUserIdNullable(UserId? v) =>
    v?.toString();
List<UserId?> fromGraphQLListUserIdNullableToDartListUserIdNullable(
  List<Object?> v,
) => v
    .map((e) => fromGraphQLUserIdNullableToDartUserIdNullable(e as String?))
    .toList();
List<String?> fromDartListUserIdNullableToGraphQLListUserIdNullable(
  List<UserId?> v,
) => v.map((e) => fromDartUserIdNullableToGraphQLUserIdNullable(e)).toList();
List<UserId?>?
fromGraphQLListNullableUserIdNullableToDartListNullableUserIdNullable(
  List<Object?>? v,
) => v
    ?.map((e) => fromGraphQLUserIdNullableToDartUserIdNullable(e as String?))
    .toList();
List<String?>?
fromDartListNullableUserIdNullableToGraphQLListNullableUserIdNullable(
  List<UserId?>? v,
) => v?.map((e) => fromDartUserIdNullableToGraphQLUserIdNullable(e)).toList();

// Version -> Cursor

Version fromGraphQLCursorToDartVersion(String v) => Version.parse(v);
String fromDartVersionToGraphQLCursor(Version v) => v.toString();
List<Version> fromGraphQLListCursorToDartListVersion(List<Object?> v) =>
    v.map((e) => fromGraphQLCursorToDartVersion(e as String)).toList();
List<String> fromDartListVersionToGraphQLListCursor(List<Version> v) =>
    v.map((e) => fromDartVersionToGraphQLCursor(e)).toList();
List<Version>? fromGraphQLListNullableCursorToDartListNullableVersion(
  List<Object?>? v,
) => v?.map((e) => fromGraphQLCursorToDartVersion(e as String)).toList();
List<String>? fromDartListNullableVersionToGraphQLListNullableCursor(
  List<Version>? v,
) => v?.map((e) => fromDartVersionToGraphQLCursor(e)).toList();
Version? fromGraphQLCursorNullableToDartVersionNullable(String? v) =>
    v == null ? null : Version.parse(v);
String? fromDartVersionNullableToGraphQLCursorNullable(Version? v) =>
    v?.toString();
List<Version?> fromGraphQLListCursorNullableToDartListVersionNullable(
  List<Object?> v,
) => v
    .map((e) => fromGraphQLCursorNullableToDartVersionNullable(e as String?))
    .toList();
List<String?> fromDartListVersionNullableToGraphQLListCursorNullable(
  List<Version?> v,
) => v.map((e) => fromDartVersionNullableToGraphQLCursorNullable(e)).toList();
List<Version?>?
fromGraphQLListNullableCursorNullableToDartListNullableVersionNullable(
  List<Object?>? v,
) => v
    ?.map((e) => fromGraphQLCursorNullableToDartVersionNullable(e as String?))
    .toList();
List<String?>?
fromDartListNullableVersionNullableToGraphQLListNullableCursorNullable(
  List<Version?>? v,
) => v?.map((e) => fromDartVersionNullableToGraphQLCursorNullable(e)).toList();

// GameTitle -> NovelTitle

GameTitle fromGraphQLNovelTitleToDartGameTitle(String v) => GameTitle(v);
String fromDartGameTitleToGraphQLNovelTitle(GameTitle v) => v.toString();
List<GameTitle> fromGraphQLListNovelTitleToDartListGameTitle(List<Object?> v) =>
    v.map((e) => fromGraphQLNovelTitleToDartGameTitle(e as String)).toList();
List<String> fromDartListGameTitleToGraphQLListNovelTitle(List<GameTitle> v) =>
    v.map((e) => fromDartGameTitleToGraphQLNovelTitle(e)).toList();
List<GameTitle>? fromGraphQLListNullableNovelTitleToDartListNullableGameTitle(
  List<Object?>? v,
) => v?.map((e) => fromGraphQLNovelTitleToDartGameTitle(e as String)).toList();
List<String>? fromDartListNullableGameTitleToGraphQLListNullableNovelTitle(
  List<GameTitle>? v,
) => v?.map((e) => fromDartGameTitleToGraphQLNovelTitle(e)).toList();
GameTitle? fromGraphQLNovelTitleNullableToDartGameTitleNullable(String? v) =>
    v == null ? null : GameTitle(v);
String? fromDartGameTitleNullableToGraphQLNovelTitleNullable(GameTitle? v) =>
    v?.toString();
List<GameTitle?> fromGraphQLListNovelTitleNullableToDartListGameTitleNullable(
  List<Object?> v,
) => v
    .map(
      (e) => fromGraphQLNovelTitleNullableToDartGameTitleNullable(e as String?),
    )
    .toList();
List<String?> fromDartListGameTitleNullableToGraphQLListNovelTitleNullable(
  List<GameTitle?> v,
) => v
    .map((e) => fromDartGameTitleNullableToGraphQLNovelTitleNullable(e))
    .toList();
List<GameTitle?>?
fromGraphQLListNullableNovelTitleNullableToDartListNullableGameTitleNullable(
  List<Object?>? v,
) => v
    ?.map(
      (e) => fromGraphQLNovelTitleNullableToDartGameTitleNullable(e as String?),
    )
    .toList();
List<String?>?
fromDartListNullableGameTitleNullableToGraphQLListNullableNovelTitleNullable(
  List<GameTitle?>? v,
) => v
    ?.map((e) => fromDartGameTitleNullableToGraphQLNovelTitleNullable(e))
    .toList();

// CustomParse -> CustomParse

CustomParse fromGraphQLCustomParseToDartCustomParse(String v) =>
    CustomParse.parse(v);
String fromDartCustomParseToGraphQLCustomParse(CustomParse v) => v.toString();
List<CustomParse> fromGraphQLListCustomParseToDartListCustomParse(
  List<Object?> v,
) =>
    v.map((e) => fromGraphQLCustomParseToDartCustomParse(e as String)).toList();
List<String> fromDartListCustomParseToGraphQLListCustomParse(
  List<CustomParse> v,
) => v.map((e) => fromDartCustomParseToGraphQLCustomParse(e)).toList();
List<CustomParse>?
fromGraphQLListNullableCustomParseToDartListNullableCustomParse(
  List<Object?>? v,
) => v
    ?.map((e) => fromGraphQLCustomParseToDartCustomParse(e as String))
    .toList();
List<String>? fromDartListNullableCustomParseToGraphQLListNullableCustomParse(
  List<CustomParse>? v,
) => v?.map((e) => fromDartCustomParseToGraphQLCustomParse(e)).toList();
CustomParse? fromGraphQLCustomParseNullableToDartCustomParseNullable(
  String? v,
) => v == null ? null : CustomParse.parse(v);
String? fromDartCustomParseNullableToGraphQLCustomParseNullable(
  CustomParse? v,
) => v?.toString();
List<CustomParse?>
fromGraphQLListCustomParseNullableToDartListCustomParseNullable(
  List<Object?> v,
) => v
    .map(
      (e) =>
          fromGraphQLCustomParseNullableToDartCustomParseNullable(e as String?),
    )
    .toList();
List<String?> fromDartListCustomParseNullableToGraphQLListCustomParseNullable(
  List<CustomParse?> v,
) => v
    .map((e) => fromDartCustomParseNullableToGraphQLCustomParseNullable(e))
    .toList();
List<CustomParse?>?
fromGraphQLListNullableCustomParseNullableToDartListNullableCustomParseNullable(
  List<Object?>? v,
) => v
    ?.map(
      (e) =>
          fromGraphQLCustomParseNullableToDartCustomParseNullable(e as String?),
    )
    .toList();
List<String?>?
fromDartListNullableCustomParseNullableToGraphQLListNullableCustomParseNullable(
  List<CustomParse?>? v,
) => v
    ?.map((e) => fromDartCustomParseNullableToGraphQLCustomParseNullable(e))
    .toList();

