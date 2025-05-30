import "package:aroma_mobile/app.dart";
import "package:aroma_mobile/data/source/util/memory_source.dart";
import "package:aroma_mobile/presentation/screen/home/home_screen.dart";
import "package:aroma_mobile/presentation/util/environment/local_environment.dart";
import "package:flutter_test/flutter_test.dart";

void main() {
  group("Currency Converter App", () {
    testWidgets("builds and displays the home page", (tester) async {
      await LocalEnvironment().configure();
      await tester.pumpWidget(AromaApp());
      await tester.pumpAndSettle(const Duration(milliseconds: MemorySource.memoryNetworkDelayMs));

      expect(find.byType(HomeScreen), findsOneWidget);
    });
  });
}
