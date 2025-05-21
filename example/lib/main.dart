import 'package:artemis_custom_gen/artemis_custom_gen.dart';

class NewType<T> {
  const NewType(this.value);
  final T value;
}

@ArtemisCustomType()
class UserId extends NewType<String> {
  const UserId(super.value);
}

@ArtemisCustomType(graphQlName: 'Cursor')
class Version extends NewType<double> {
  const Version(super.value);
  Version.parse(String value) : super(double.parse(value));
}

@ArtemisCustomType(graphQlName: 'NovelTitle')
class GameTitle {
  const GameTitle(this.value);
  final String value;
}

@ArtemisCustomType<CustomParse>(
  parse: CustomParse.parse,
  convert: CustomParse.convert,
)
class CustomParse extends NewType<double> {
  const CustomParse(super.value);

  static CustomParse parse(String value) {
    return CustomParse(double.parse(value));
  }

  static String convert(CustomParse value) => value.value.toString();
}
