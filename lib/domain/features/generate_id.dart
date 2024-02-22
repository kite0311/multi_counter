import 'dart:math';

import 'package:counter/presentation/constants/random_id_constants.dart';

class RandomIdGenerator {
  static const String charset = RandomIdConstants.charset;
  final Random rnd;

  RandomIdGenerator({Random? randomGenerator})
      : rnd = randomGenerator ?? Random.secure();
  String generate({int length = 10}) {
    return List.generate(
        length, (index) => charset[rnd.nextInt(charset.length)]).join();
  }
}
