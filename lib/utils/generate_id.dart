import 'dart:math';

import 'package:counter/constants/random_id_constants.dart';

class GenerateId {
  static const String charset = RandomIdConstants.charset;
  final Random rnd;

  GenerateId({Random? randomGenerator})
      : rnd = randomGenerator ?? Random.secure();
  String generate({int length = 10}) {
    return List.generate(
        length, (index) => charset[rnd.nextInt(charset.length)]).join();
  }
}
