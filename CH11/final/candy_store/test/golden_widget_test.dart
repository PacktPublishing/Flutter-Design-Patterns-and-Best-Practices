import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
// import 'package:golden_toolkit/golden_toolkit.dart';

import 'candy_shop_golden_test_widgets_page.dart';

void main() {
  testWidgets('Golden test', (WidgetTester tester) async {
    TestWidgetsFlutterBinding.ensureInitialized();
    // await loadAppFonts();

    await tester.pumpWidget(const MaterialApp(home: CandyShopGoldenTestWidgetsPage()));
    await tester.pumpAndSettle();
    await expectLater(find.byType(CandyShopGoldenTestWidgetsPage), matchesGoldenFile('goldens/candy_shop_widgets.png'));
  });
}
