import 'package:flutter_test/flutter_test.dart';
import 'package:todo_stacked/app/app.locator.dart';

import '../helpers/test_helpers.dart';

void main() {
  group('SupabaseServiceTest -', () {
    setUp(() => registerServices());
    tearDown(() => locator.reset());
  });
}
