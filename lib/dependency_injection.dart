import 'apiRepository.dart';
import 'api_data_prod.dart';

// ignore: constant_identifier_names
enum Flavor { MOCK, PROD }

class Injector {
  static final Injector _singleton = Injector._internal();
  // ignore: unused_field
  static Flavor _flavor;

  static void configure(Flavor flavor) {
    _flavor = flavor;
  }

  // ignore: sort_constructors_first
  factory Injector() {
    return _singleton;
  }

  // ignore: sort_constructors_first
  Injector._internal();

  ApiRepository get loginRepository {
    return ProdApiRepository();
  }
}
