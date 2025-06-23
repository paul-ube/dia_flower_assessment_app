import 'package:flutter_test/flutter_test.dart';
import 'package:dia_flowers_assessment/app/app.locator.dart';

import '../helpers/test_helpers.dart';

void main() {
  group('ProductDetailViewModel Tests -', () {
    setUp(() => registerServices());
    tearDown(() => locator.reset());
  });
}
