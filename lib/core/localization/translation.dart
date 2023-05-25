import 'package:get/get.dart';

class MyTranslation extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        "key1": {"english": "arabic"},
        "key2": {"Hello": "مرحبا"},
        "key3": {"english": "arabic"},
      };
}
