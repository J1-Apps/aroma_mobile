import "package:aroma_mobile/data/model/session_model.dart";
import "package:flutter_test/flutter_test.dart";

void main() {
  group("Session Model", () {
    test("can be compared", () {
      final signedInSession1 = SignedInSessionModel(userId: "1");
      final signedInSession2 = SignedInSessionModel(userId: "1");
      final signedInSession3 = SignedInSessionModel(userId: "2");
      final signedOutSession1 = SignedOutSessionModel();
      final signedOutSession2 = SignedOutSessionModel();

      expect(signedInSession1, equals(signedInSession2));
      expect(signedInSession1, isNot(signedInSession3));
      expect(signedInSession1, isNot(signedOutSession1));
      expect(signedOutSession1, equals(signedOutSession2));
    });
  });
}
