import 'package:artemis_custom_gen/artemis_custom_gen.dart';

part 'artemis_custom_gen_example.g.dart';

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
