import "package:aroma_mobile/presentation/bloc/login/login_bloc.dart";
import "package:aroma_mobile/presentation/screen/login/login_screen.dart";
import "package:flutter_test/flutter_test.dart";
import "package:j1_core_base/j1_core_base.dart";
import "package:mocktail/mocktail.dart";

import "../../../test_util/test_wrapper.dart";
import "../../../test_util/testing_mocks.dart";

void main() {
  group("Login Screen", () {
    final signInGoogleUsecase = MockSignInGoogleUsecase();

    setUp(() {
      when(signInGoogleUsecase.call).thenAnswer((_) => Future.value(const Success("")));
    });

    testWidgets("shows login screen text", (tester) async {
      await tester.pumpWidget(
        TestWrapper(
          globalBloc: LoginBloc(signInGoogleUsecase: signInGoogleUsecase),
          child: const LoginScreen(),
        ),
      );
      await tester.pumpAndSettle();
    });
  });
}
